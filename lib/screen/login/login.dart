import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:punjabsuper/routes/app_routes.dart';
import 'package:punjabsuper/screen/login/login_controller/login_controller.dart';
import 'package:punjabsuper/utils/image_constants.dart';

class Login extends StatelessWidget {
  Login({super.key});

  var width = Get.width;
  var height = Get.height;
  LoginController lc = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              ImageConstants.loginImg,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.045, left: width * 0.15),
            child: const Text(
              'Please Login Now',
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 100, 231, 243),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: height * 0.28, left: width * 0.32),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 200,
                height: 30,
                padding: const EdgeInsets.only(left: 7),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2, color: Colors.red)),
                child: TextFormField(
                  controller: lc.loginid.value,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'PS',
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: height * 0.19, left: width * 0.32),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 200,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2, color: Colors.red)),
                child: TextFormField(
                  controller: lc.loginpass.value,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                      onTap: () {
                        if (lc.loginid.value.text != '00202032' &&
                            lc.loginpass.value.text != '5656') {
                          Get.snackbar('Incorrect Login Or Password',
                              'Please check your id or password',
                              duration: const Duration(milliseconds: 1500));
                        } else {
                          Get.toNamed(AppRoutes.menu);
                        }
                      },
                      child: Image.asset(ImageConstants.enterImg))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0, right: width * 0.19),
            child: Align(
              alignment: Alignment.bottomRight,
              child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                      onTap: () =>
                          Platform.isWindows ? exit(0) : SystemNavigator.pop,
                      child: Image.asset(ImageConstants.closeImg))),
            ),
          )
        ],
      ),
    );
  }
}
