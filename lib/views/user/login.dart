// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagetotext/String/key.dart';
import 'package:imagetotext/controller/login_controller.dart';
import 'package:imagetotext/model/login_model.dart';
import 'package:imagetotext/views/user/home.dart';
import 'package:imagetotext/views/user/registertion.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(15),
        child: Container(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                "Login Page ",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Form(
                key: Keys.fromkeyLogin,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      controller: LoginController.emailController,
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
                      autovalidateMode: AutovalidateMode.always,
                      controller: LoginController.passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else {
                          return null;
                        }
                      },
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
                      if (Keys.fromkeyLogin.currentState!.validate()) {
                        Keys.fromkeyLogin.currentState!.save();
                        final _login = Login(
                          email: LoginController.emailController.text,
                          password: LoginController.passwordController.text,
                        );
                        _loginController.loginPost(_login);
                        // Get.to(() => HomePage());
                      }
                    },
                    child: Text('Login')),
              ),
              SizedBox(
                height: 32,
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => Registertionpage());
                },
                child: Text('Regitertion Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
