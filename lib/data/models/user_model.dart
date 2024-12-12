import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String name;
  String email;
  String? profilePictureUrl;
  String? userType;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.profilePictureUrl,
    this.userType,
  });

  // Convert a UserModel object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'userType': userType,
    };
  }

  // Create a UserModel object from a Map object
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      profilePictureUrl: map['profilePictureUrl'],
      userType: map['userType'],
    );
  }

  // Create a UserModel object from a Firestore document
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      name: data['name'],
      email: data['email'],
      profilePictureUrl: data['profilePictureUrl'],
      userType: data['userType'],
    );
  }
}
