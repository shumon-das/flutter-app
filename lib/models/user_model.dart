import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String _name = '';
  String? _email;
  String? _contact;
  String _password = '';
  String _role = 'USER';
  String _image = '';
  String _description = '';
  List followers = [];
  List favourites = [];
  Timestamp createdAt = Timestamp.now();
  Timestamp? updatedAt;
  String? updatedBy;
  Timestamp? deletedAt;
  String? deletedBy;
  bool isDeleted = false;


  String get getName {
    return _name;
  }
  set setName(String name) {
    if (name.isNotEmpty) {
      _name = name;
    }
  }

  String? get getEmail {
    return _email;
  }
  set setEmail(String? email) {
    if (null != email && email.isNotEmpty) {
      _email = email;
    }
  }

  String? get getContact {
    return _contact;
  }
  set setContact(String? contact) {
    if (null != contact && contact.isNotEmpty) {
      _contact = contact;
    }
  }

  String get getPassword {
    return _password;
  }
  set setPassword(String password) {
    if (password.isNotEmpty) {
      _password = password;
    }
  }

  String get getRole {
    return _role;
  }
  set setRole(String role) {
    if (role.isNotEmpty) {
      _role = role;
    }
  }

  String get getImage {
    return _image;
  }
  set setImage(String image) {
    if (image.isNotEmpty) {
      _image = image;
    }
  }

  String get getDescription {
    return _description;
  }
  set setDescription(String description) {
    if (description.isNotEmpty) {
      _description = description;
    }
  }

  List get getFollowers {
    return followers;
  }
  set setFollowers(List values) {
    followers = values;
  }

  List get getFavourites {
    return favourites;
  }
  set setFavourites(List values) {
    favourites = values;
  }

  Timestamp get getCreatedAt {
    return createdAt;
  }

  bool get getIsDeleted {
    return isDeleted;
  }
  set setIsDeleted(bool value) {
    isDeleted = value;
  }
}