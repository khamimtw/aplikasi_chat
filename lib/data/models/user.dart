import 'package:flutter/material.dart';

class User {
  String id;
  String username;
  String email;
  String alamat;
  String jenisKelamin;

  User({
    @required this.id,
    @required this.username,
    @required this.email,
    this.alamat,
    this.jenisKelamin,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    alamat = json['alamat'];
    jenisKelamin = json['jenis_kelamin'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'alamat': alamat,
      'jenis_kelamin': jenisKelamin,
    };
  }

  @override
  String toString() {
    return '{"_id":"$id","username":"$username", "email":"$email", "alamat":"$alamat", "jenis_kelamin":"$jenisKelamin"}';
  }
}
