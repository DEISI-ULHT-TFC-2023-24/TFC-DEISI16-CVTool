import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/login/conditions_checkbox.dart';
import '../../../../../../models/business_user.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../sucess/business_sucess_screen.dart';

class BusinessSignUpForm extends StatefulWidget {
  const BusinessSignUpForm({Key? key}) : super(key: key);

  @override
  _BusinessSignUpFormState createState() => _BusinessSignUpFormState();
}

class _BusinessSignUpFormState extends State<BusinessSignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _jobController = TextEditingController();
  final _companyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // First and Last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: TFCTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: TFCSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: TFCTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: TFCSizes.spaceBtwInputFields),

          // Username
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: TFCTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a username';
              }
              return null;
            },
          ),
          const SizedBox(height: TFCSizes.spaceBtwInputFields),

          // Password
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TFCTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
          ),
          const SizedBox(height: TFCSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: TFCTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              // Add email validation logic here if needed
              return null;
            },
          ),
          const SizedBox(height: TFCSizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            controller: _phoneNumberController,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
              labelText: TFCTexts.mobilePhone,
              prefixIcon: Icon(Iconsax.call),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              }
              // Add phone number validation logic here if needed
              return null;
            },
          ),
          const SizedBox(height: TFCSizes.spaceBtwInputFields),

          // Job
          TextFormField(
            controller: _jobController,
            decoration: const InputDecoration(
              labelText: 'Job',
              prefixIcon: Icon(Icons.work),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your job';
              }
              return null;
            },
          ),
          const SizedBox(height: TFCSizes.spaceBtwInputFields),

          // Company name
          TextFormField(
            controller: _companyController,
            decoration: const InputDecoration(
              labelText: TFCTexts.company,
              prefixIcon: Icon(Iconsax.building),
            ),
          ),
          const SizedBox(height: TFCSizes.spaceBtwSections),

          // Terms agree checkbox
          const ConditionsCheckbox(),
          const SizedBox(height: TFCSizes.spaceBtwSections),

          // SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If all fields are valid, create the BusinessUser object
                  BusinessUser user = BusinessUser(
                    id: 0,
                    name: '${_firstNameController.text} ${_lastNameController.text}',
                    email: _emailController.text,
                    username: _usernameController.text,
                    gender: "male",
                    age: 99,
                    password: _passwordController.text,
                    phoneNumber: _phoneNumberController.text,
                    job: _jobController.text,
                    company: "Ezi",
                  );

                  //BusinessUser.add(user);

                  Get.to(() => BusinessSucessScreen(user: user));
                }
              },
              child: const Text(TFCTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
