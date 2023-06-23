import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import 'login_controller/login_controller.dart';
import '../../../utils/image_constants.dart';

class Login extends StatelessWidget {
  Login({super.key});

  LoginController lc = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          var height = constraints.maxHeight;
          var width = constraints.maxWidth;

          return Stack(
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
                padding: EdgeInsets.only(
                  top: height * 0.05,
                  left: width * 0.15,
                ),
                child: const Text(
                  'Please Login Now',
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 100, 231, 243),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: height * 0.24,
                  left: width * 0.3,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 200,
                    height: 30,
                    padding: const EdgeInsets.only(left: 7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 2,
                        color: Colors.red,
                      ),
                    ),
                    child: TextFormField(
                      controller: lc.loginid.value,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'PS',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: height * 0.15,
                  left: width * 0.3,
                ),
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
                padding: EdgeInsets.only(
                  bottom: height * 0.01,
                  left: width * 0.1,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: InkWell(
                          onTap: () {
                            // if (lc.loginid.value.text != '00202032' &&
                            //     lc.loginpass.value.text != '5656') {
                            //   Get.snackbar('Incorrect Login Or Password',
                            //       'Please check your id or password',
                            //       duration: const Duration(milliseconds: 1500));
                            // } else {
                            Get.toNamed(AppRoutes.mobileMenu);
                            // }
                          },
                          child: Image.asset(
                            ImageConstants.enterImg,
                            height: height * 0.1,
                            width: width * 0.3,
                          ))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 8.0,
                  right: width * 0.1,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      onTap: () =>
                          Platform.isWindows ? exit(0) : SystemNavigator.pop,
                      child: Image.asset(
                        ImageConstants.closeImg,
                        height: height * 0.1,
                        width: width * 0.3,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
