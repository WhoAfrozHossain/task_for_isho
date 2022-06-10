import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyModel {
  String? id;
  String? userId;
  String? propertyName;
  String? propertyRent;
  String? supplierName;
  double? lat;
  double? lng;
  List<String>? images;
  Timestamp? time;

  PropertyModel(
      {this.id,
      this.userId,
      this.propertyName,
      this.propertyRent,
      this.lat,
      this.lng,
      this.images,
      this.time});

  PropertyModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc['id'];
    userId = doc['user_id'];
    propertyName = doc['property_name'];
    propertyRent = doc['property_rent'];
    lat = doc['lat'];
    lng = doc['lng'];
    images = doc['images'] != null ? List.from(doc['images']) : doc['images'];
    time = doc['time'];
  }
}
