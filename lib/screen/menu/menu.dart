import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:punjabsuper/screen/menu/recievables.dart';
import 'package:punjabsuper/screen/menu/transferables.dart';

import '../../routes/app_routes.dart';
import '../../utils/image_constants.dart';

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
  void changeMouseCursor() {
    setState(() {
      isBasicMouseCursor = !isBasicMouseCursor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrainst) {
          var height = constrainst.maxHeight;
          var width = constrainst.maxWidth;
          return
              // MouseRegion(
              //   cursor: isBasicMouseCursor
              //       ? SystemMouseCursors.basic
              //       : SystemMouseCursors.click,
              //   onHover: (PointerEvent event) {
              //     Offset localPosition = event.localPosition;
              //     var x = localPosition.dx;
              //     var y = localPosition.dy;
              //     var xPercentage = (x / width) * 100;
              //     var yPercentage = (y / height) * 100;
              //     print('$xPercentage $yPercentage');
              //     if (xPercentage > 20 &&
              //         xPercentage < 40 &&
              //         yPercentage > 82 &&
              //         yPercentage < 94) {
              //       changeMouseCursor();
              //     }
              //   },
              //   child:
              InkWell(
            mouseCursor: isBasicMouseCursor
                ? SystemMouseCursors.basic
                : SystemMouseCursors.click,
            onTapDown: (TapDownDetails details) {
              Offset postion = details.globalPosition;
              var x = postion.dx;
              var y = postion.dy;
              var xPercentage = (x / width) * 100;
              var yPercentage = (y / height) * 100;

              //Select All Recievable minX = 26 minY = 86 maxX = 35 maxY = 90
              if (xPercentage > 26 &&
                  xPercentage < 35 &&
                  yPercentage > 86 &&
                  yPercentage < 90) {
                // changeMouseCursor();
                showToast(
                  'Clicked On Recievables',
                  context: context,
                );
                print('$xPercentage $yPercentage');
              }

              // Check for Transferables
              // Recievable reciev reject
              // Transferable reject
            },
            child: Stack(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                // Images for Navigation:
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
                Positioned(
                  right: width * 0.18,
                  top: height * 0.295,
                  child: Image.asset(
                    width: width * 0.11,
                    height: height * 0.201,
                    ImageConstants.luckyImg,
                    fit: BoxFit.fill,
                  ),
                ),

                Positioned(
                  right: width * 0.07,
                  top: height * 0.08,
                  child: Image.asset(
                    width: width * 0.09,
                    height: height * 0.09,
                    ImageConstants.tokenIdImg,
                    fit: BoxFit.fill,
                  ),
                ),

                Positioned(
                  right: width * 0.07,
                  top: height * 0.19,
                  child: Image.asset(
                    width: width * 0.09,
                    height: height * 0.09,
                    ImageConstants.reportImg,
                    fit: BoxFit.fill,
                  ),
                ),

                Positioned(
                  right: width * 0.062,
                  top: height * 0.3,
                  child: Image.asset(
                    width: width * 0.11,
                    height: height * 0.09,
                    ImageConstants.winnerImg,
                    fit: BoxFit.fill,
                  ),
                ),

                Positioned(
                  right: width * 0.062,
                  top: height * 0.41,
                  child: Image.asset(
                    width: width * 0.11,
                    height: height * 0.09,
                    ImageConstants.reportImg,
                    fit: BoxFit.fill,
                  ),
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
                )
              ],
            ),
          );
          // );
        },
      ),
    );
  }
}
