class User {
  String id;
  String username;
  String email;
  String alamat;

  User(this.id, this.username, this.email, this.alamat);

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    alamat = json['alamat'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'alamat': alamat,
    };
  }

  @override
  String toString() {
    return '{"_id":"$id", "username":"$username","email":"$email","alamat":"$alamat"}';
  }
}
