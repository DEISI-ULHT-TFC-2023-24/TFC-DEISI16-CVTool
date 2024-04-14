import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfc_versaofinal/users/business/models/business_user_model.dart';


class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({super.key, required this.user});

  final BusinessUser user;

  @override
  State<BusinessProfileScreen> createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfileScreen> {
  late BusinessUser user;
  bool isObscurePassword = true;

  // Variables to store edited values
  late String editedName;
  late String editedEmail;
  late String editedUsername;
  late String editedPassword;
  late String editedPhoneNumber;
  late String editedJob;

  @override
  void initState() {
    super.initState();
    user = widget.user;
    // Initialize edited values with user data
    editedName = user.name;
    editedEmail = user.email;
    editedUsername = user.username;
    editedPassword = user.password;
    editedPhoneNumber = user.phoneNumber;
    editedJob = user.job;
  }

  void saveEditedUserData() {
    // Update the user object with edited data
    setState(() {
      user.name = editedName;
      user.email = editedEmail;
      user.username = editedUsername;
      user.password = editedPassword;
      user.phoneNumber = editedPhoneNumber;
      user.job = editedJob;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[600],
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2018/04/18/18/56/user-3331256_1280.png',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.white,
                          ),
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              buildTextField("Nome", editedName, false, (value) {
                editedName = value;
              }),
              buildTextField("Email", editedEmail, false, (value) {
                editedEmail = value;
              }),
              buildTextField("Username", editedUsername, false, (value) {
                editedUsername = value;
              }),
              buildTextField("Password", editedPassword, true, (value) {
                editedPassword = value;
              }),
              buildTextField("Número Telemóvel", editedPhoneNumber, false, (value) {
                editedPhoneNumber = value;
              }),
              buildTextField("Profissão", editedJob, false, (value) {
                editedJob = value;
              }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      saveEditedUserData();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField, ValueChanged<String> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    isObscurePassword = !isObscurePassword;
                  });
                }
            ): null,
            contentPadding: const EdgeInsets.only(bottom: 1),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }
}
