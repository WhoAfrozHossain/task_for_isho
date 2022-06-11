import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/constants.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'package:task_for_isho/app/models/property_model.dart';
import 'package:task_for_isho/app/models/user_model.dart';
import 'package:task_for_isho/app/routes/app_pages.dart';
import 'package:task_for_isho/features/auth/controllers/auth_controller.dart';

class PropertyController extends GetxController {
  AuthController authController = Get.put(AuthController());

  late FirebaseAuth _auth;
  late FirebaseFirestore _firestore;

  TextEditingController propertyNameController = TextEditingController();
  TextEditingController rentController = TextEditingController();

  var user = UserModel().obs;
  var properties = [].obs;

  var selectedProperty = PropertyModel().obs;
  var isLoading = false.obs;

  List<String> propertyImage = [];
  List<String> selectedImage = [];
  var totalImage = 0.obs;

  Rx<LatLng> currentLocation = const LatLng(37.42796133580664, -122.085749655962).obs;

  Completer<GoogleMapController> mapController = Completer();

  CameraPosition? kGooglePlex;

  @override
  onReady() {
    _auth = authController.auth;
    _firestore = authController.fireStore;

    getDeviceLocation();

    getUserData();
    getPropertyList();

    super.onReady();
  }

  void selectProperty(PropertyModel item) {
    selectedProperty(item);

    Get.toNamed(AppPages.VIEW_PROPERTY);
  }

  void getUserData() async {
    try {
      Utils.loadingDialog();

      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        Utils.closeDialog();

        if (documentSnapshot.exists) {
          user(UserModel.fromDocumentSnapshot(documentSnapshot));
        } else {
          print('Document does not exist on the database');
        }
      });
    } catch (e) {
      Utils.closeDialog();

      print(e);
      rethrow;
    }
  }

  Future getPropertyList() async {
    properties([]);
    try {
      isLoading(true);
      Utils.loadingDialog();

      await _firestore
          .collection('property')
          .where('user_id', isEqualTo: _auth.currentUser?.uid)
          .orderBy('time', descending: true)
          .get()
          .then((value) {
        Utils.closeDialog();

        for (var element in value.docs) {
          PropertyModel item = PropertyModel.fromDocumentSnapshot(element);
          properties.add(item);
        }
        isLoading(false);
        return value.docs[0];
      });
    } catch (e) {
      isLoading(false);
      Utils.closeDialog();

      print(e);
    }
  }

  Future<Position> getDeviceLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      getLatLngFromIp();

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        getLatLngFromIp();

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      getLatLngFromIp();

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    currentLocation(LatLng(position.latitude, position.longitude));

    goToTheLake();

    return position;
  }

  getLatLngFromIp() async {
    final response = await http.get(
      Uri.parse('http://ip-api.com/json'),
    );

    var jsonData = json.decode(response.body);

    currentLocation(LatLng(jsonData["lat"], jsonData["lon"]));

    goToTheLake();
  }

  getPropertyImages(File? file) {
    if (file != null) {
      propertyImage.add(file.path);
      totalImage(propertyImage.length);
    }
  }

  removePropertyImages(int index) {
    propertyImage.removeAt(index);
    totalImage(propertyImage.length);
  }

  Future<void> goToTheLake() async {
    kGooglePlex ??= CameraPosition(
      target: currentLocation.value,
      zoom: 14,
    );

    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: currentLocation.value,
      zoom: 17,
    )));
  }

  void selectedMapPosition(LatLng location) {
    currentLocation(location);
    goToTheLake();
  }

  String validationCreateProperty() {
    String message = "";

    if (propertyNameController.text.isEmpty) {
      if (message.isEmpty) {
        message = "Please enter title";
      } else {
        message = "$message\nPlease enter title";
      }
    }
    if (rentController.text.isEmpty) {
      if (message.isEmpty) {
        message = "Please enter property rent";
      } else {
        message = "$message\nPlease enter property rent";
      }
    }
    if (propertyImage.isEmpty) {
      if (message.isEmpty) {
        message = "Please select image";
      } else {
        message = "$message\nPlease select image";
      }
    }

    return message;
  }

  void submitCreateProperty() {
    String message = validationCreateProperty();

    if (message.isEmpty) {
      sslCommerzGeneralCall();
    } else {
      showErrorToast(message);
    }
  }

  Future<void> sslCommerzGeneralCall() async {
    Sslcommerz sslcommerz = Sslcommerz(
        initializer: SSLCommerzInitialization(
            //Use the ipn if you have valid one, or it will fail the transaction.
            ipn_url: "www.ipnurl.com",
            // multi_card_name: formData['multicard'],
            currency: SSLCurrencyType.BDT,
            product_category: "Test",
            sdkType: SSLCSdkType.TESTBOX,
            store_id: "afroz62a261f389205",
            store_passwd: "afroz62a261f389205@ssl",
            total_amount: double.parse(rentController.text),
            tran_id: "1231321321321312"));

    var result = await sslcommerz.payNow();
    if (result is PlatformException) {
      if (kDebugMode) {
        print("the response is: ${result.message} code: ${result.code}");
      }
    } else {
      SSLCTransactionInfoModel model = result;
      addProperty(model.toJson());
      showSuccessToast("Transaction successful: Amount ${model.amount} TK");
    }
  }

  Future<String> uploadImageFile(File image) async {
    Utils.loadingDialog();

    Reference storageRef = FirebaseStorage.instance
        .ref('PropertyImage/${DateTime.now().toString()}.jpg');
    TaskSnapshot uploadTask = await storageRef.putFile(
        image,
        SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {'picked-file-path': image.path},
        ));

    String imageUri = await uploadTask.ref.getDownloadURL();

    Utils.closeDialog();

    return imageUri;
  }

  void addProperty(var paymentData) async {
    Utils.loadingDialog();

    String id = DateTime.now().millisecondsSinceEpoch.toString();
    selectedImage.clear();

    try {
      for (int i = 0; i < propertyImage.length; i++) {
        selectedImage.add(await uploadImageFile(File(propertyImage[i])));
      }

      await _firestore.collection("property").doc(id).set({
        'id': id,
        'user_id': _auth.currentUser?.uid,
        'payment_data': paymentData,
        'property_name': propertyNameController.text,
        'property_rent': rentController.text,
        'lat': currentLocation.value.latitude,
        'lng': currentLocation.value.longitude,
        "images":
            selectedImage.isEmpty ? null : FieldValue.arrayUnion(selectedImage),
        'time': FieldValue.serverTimestamp(),
      }).then((value) {
        propertyImage.clear();
        propertyNameController.clear();
        rentController.clear();
        totalImage(propertyImage.length);

        Utils.closeDialog();

        Get.back();

        getPropertyList();
        getDeviceLocation();
      });
    } catch (e) {
      Utils.closeDialog();

      print(e);
    }
  }

  void signOut() async {
    authController.signOut();
  }
}
