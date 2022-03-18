// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagetotext/controller/registertion_controller.dart';
import 'package:imagetotext/helper/get_storage.dart';
import 'package:imagetotext/model/registration_model.dart';
import 'package:imagetotext/views/user/home.dart';

import '../../String/key.dart';

class Registertionpage extends StatelessWidget {
  Registertionpage({Key? key}) : super(key: key);
  final _registertionController = Get.put(RegistertionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "Registertion Page ",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Form(
                key: Keys.fromKeyRegister,
                child: Column(
                  children: [
                    TextFormField(
                      controller: RegistertionController.numberController,
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Phone Number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: RegistertionController.emailController,
                      autovalidateMode: AutovalidateMode.always,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: RegistertionController.passwordController,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Password';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: Get.width,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (Keys.fromKeyRegister.currentState!.validate()) {
                      Keys.fromKeyRegister.currentState!.save();
                      // Get.to(() => HomePage());
                      final registertion = Registertion(
                        mobileNumber:
                            RegistertionController.numberController.text,
                        email: RegistertionController.emailController.text,
                        password:
                            RegistertionController.passwordController.text,
                      );
                      _registertionController.postRegister(registertion);
                    }
                  },
                  child: Text('Registration now'),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              TextButton(
                onPressed: () {},
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
