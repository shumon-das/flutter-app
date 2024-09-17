import 'dart:io';

import 'package:crud/models/user_model.dart';
import 'package:crud/services/encryption.dart';
import 'package:crud/services/firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../services/file_upload.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({super.key});

  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  UserModel userModel = UserModel();
  FileUpload fileUpload = FileUpload();
  Encryption encryption = Encryption();
  FirestoreSerivce firestoreSerivce = FirestoreSerivce();
  List userRoles = ['USER', 'ADMIN', 'WRITER', 'EMPLOYEE', 'EMPLOYEE_SEEKER'];

  File? selectedImage;
  String? filename;
  final picker = ImagePicker();

  Future chooseImage() async {
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery
    );
    setState(() {
      if (null != pickedImage) {
        selectedImage = File(pickedImage.path);
        filename = basename(selectedImage!.path);
      }
    });
  }

  final _userFormGlobalKey = GlobalKey<FormState>();
  String? selectedPriority;
  bool passwordVisible=false;

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New User'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _userFormGlobalKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                null == selectedImage ? choseAnImage() : showImage(),

                const SizedBox(height: 20),
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Name')
                  ),
                  validator: (value) {
                      return value == null || value.isEmpty
                        ? 'This field is required'
                        : null;
                  },
                  onChanged: (value) {
                    userModel.setName = value;
                  },
                ),

                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text('Email')
                  ),
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
                      }
                      else if(value.isNotEmpty && !EmailValidator.validate(value)) {
                        return 'This field is required a valid email';
                      }
                      return null;
                  },
                  onChanged: (value) {
                    userModel.setEmail = value;
                  },
                ),

                const SizedBox(height: 20),
                TextFormField(
                  maxLength: 14,
                  decoration: const InputDecoration(
                    label: Text('Contact'),
                  ),
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
                      }
                      else if(value.isNotEmpty && value.length < 10) {
                        return 'This field is required a valid contact number';
                      }
                      return null;
                  },
                  onChanged: (value) {
                    userModel.setContact = value;
                  },
                ),

                const SizedBox(height: 20),
                TextFormField(
                  maxLength: 20,
                  obscureText: passwordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: const Text('Password'),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off
                      ),
                      onPressed: () {
                        setState(() {
                            passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required a contact number';
                      } else if (value.isNotEmpty && value.length < 6) {
                        return 'Password should contain minimum 6 character';
                      }
                      return null;
                  },
                  onChanged: (value) {
                    userModel.setPassword = encryption.encryptPassword(value);
                  },
                ),

                const SizedBox(height: 20),
                DropdownButtonFormField(
                    value: userModel.getRole,
                    decoration: const InputDecoration(
                      label: Text('Select User Role')
                    ),
                    items: List.generate(
                        userRoles.length, (int index) {
                          return DropdownMenuItem(
                            value: userRoles[index],
                            child: Text(userRoles[index]),
                          );
                      }
                    ),
                    onChanged: (value) {
                      userModel.setRole = value as String;
                    }
                ),

                const SizedBox(height: 20),
                TextFormField(
                  maxLength: 200,
                  decoration: const InputDecoration(
                    label: Text('Description')
                  ),
                  onChanged: (value) {
                    userModel.setDescription = value;
                  },
                ),

                const SizedBox(height: 20),
                FilledButton(
                    onPressed: () {
                      if (_userFormGlobalKey.currentState!.validate()) {
                        String imgName = '${DateTime.now().microsecondsSinceEpoch}.png';
                        userModel.setImage = imgName;
                        fileUpload.uploadToFirebase(selectedImage, imgName);
                        firestoreSerivce.addUser(userModel);
                        Fluttertoast.showToast(msg: 'New user created successfully');
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Something went wrong!'))
                        );
                      }
                    },
                    child: const Text('Add')
                ),
              ],
            ),
        ),
      ),
    );
  }

  Container choseAnImage() {
    return Container(
      height: 200,
      color: Colors.blueGrey,
      child: Center(
        child: TextButton(
            onPressed: chooseImage,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Choose an Image',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
        ),
      ),
    );
  }

  Container showImage() {
    if (null == selectedImage) {
      return Container();
    }
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(selectedImage!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
