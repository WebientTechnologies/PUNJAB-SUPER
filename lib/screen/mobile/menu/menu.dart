import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punjabsuper/screen/desktop/menu/recievables.dart';
import 'package:punjabsuper/screen/desktop/menu/transferables.dart';
import 'package:punjabsuper/screen/desktop/menu/widgets/setting_dialog.dart';
import 'package:punjabsuper/screen/desktop/menu/widgets/token-id_report.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/image_constants.dart';

class Menu extends StatefulWidget {
  const Menu({
    super.key,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var isBasicMouseCursor = true;
  bool isLuckyPattaHovered = false;
  bool _value1 = false;
  bool _value2 = false;
  // void changeMouseCursor() {
  //   setState(() {
  //     isBasicMouseCursor = !isBasicMouseCursor;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrainst) {
          var height = constrainst.maxHeight;
          var width = constrainst.maxWidth;
          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  ImageConstants.menuImg,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.02,
                  left: width * 0.15,
                ),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'PS00202032',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.02, right: width * 0.1),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '937.00',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
              // Lucky Patti:
              Positioned(
                right: width * 0.18,
                top: height * 0.08,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.luckyPatta);
                  },
                  child: Image.asset(
                    width: width * 0.11,
                    height: height * 0.2,
                    ImageConstants.pattiImg,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Lucky 100 PS
              Positioned(
                right: width * 0.18,
                top: height * 0.295,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.lucky100PS);
                  },
                  child: Image.asset(
                    width: width * 0.11,
                    height: height * 0.201,
                    ImageConstants.luckyImg,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Token Image
              Positioned(
                right: width * 0.07,
                top: height * 0.08,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return Dialog(
                            child: TokenIDReport(
                              height: height,
                              width: width,
                              ratio: width / height,
                            ),
                          );
                        });
                  },
                  child: Image.asset(
                    width: width * 0.09,
                    height: height * 0.09,
                    ImageConstants.tokenIdImg,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Report Image
              Positioned(
                right: width * 0.07,
                top: height * 0.19,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return Dialog(
                            child: TokenIDReport(
                              height: height,
                              width: width,
                              ratio: width / height,
                            ),
                          );
                        });
                  },
                  child: Image.asset(
                    width: width * 0.09,
                    height: height * 0.09,
                    ImageConstants.reportImg,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Winner Image
              Positioned(
                right: width * 0.062,
                top: height * 0.3,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return Dialog(
                            child: TokenIDReport(
                              height: height,
                              width: width,
                              ratio: width / height,
                            ),
                          );
                        });
                  },
                  child: Image.asset(
                    width: width * 0.11,
                    height: height * 0.09,
                    ImageConstants.winnerImg,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              //  Setting Image
              Positioned(
                right: width * 0.062,
                top: height * 0.41,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return Dialog(
                            child: SettingDialog(
                              height: height,
                              width: width,
                              ratio: width / height,
                            ),
                          );
                        });
                  },
                  child: Image.asset(
                    width: width * 0.11,
                    height: height * 0.09,
                    ImageConstants.settingImg,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // Recievables Recieve
              Positioned(
                left: width * 0.28,
                bottom: height * 0.33,
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    width: width * 0.12,
                    height: height * 0.04,
                    ImageConstants.recieveImg,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // Recievables Reject:
              Positioned(
                left: width * 0.4,
                bottom: height * 0.33,
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    width: width * 0.09,
                    height: height * 0.04,
                    ImageConstants.rejectImg,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // Transferable Reject:
              Positioned(
                right: width * 0.07,
                bottom: height * 0.33,
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    width: width * 0.09,
                    height: height * 0.04,
                    ImageConstants.rejectImg,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // Logout:
              Positioned(
                right: width * 0.07,
                bottom: height * 0.04,
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    width: width * 0.09,
                    height: height * 0.06,
                    ImageConstants.logoutImg,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // Recievable Select all:
              Positioned(
                right: width * 0.29,
                bottom: height * 0.0999,
                child: Checkbox(
                    value: _value1,
                    onChanged: (val) {
                      setState(() {
                        _value1 = val!;
                      });
                    }),
              ),

              // Transferable Select all:
              Positioned(
                left: width * 0.23,
                bottom: height * 0.0999,
                child: Checkbox(
                    value: _value2,
                    onChanged: (val) {
                      setState(() {
                        _value2 = val!;
                      });
                    }),
              ),

              // End ------------ //
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.08,
                  bottom: height * 0.19,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Recievables(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: width * 0.07,
                  bottom: height * 0.19,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Transferables(),
                ),
              ),
            ],
          );
          // );
        },
      ),
    );
  }
}
