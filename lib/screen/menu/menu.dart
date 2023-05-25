import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/image_constants.dart';

class Menu extends StatelessWidget {
  Menu({
    super.key,
  });

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
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.065,
                  right: 0,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 400,
                    height: 350,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 0.0,
                                top: 0,
                              ),
                              child: SizedBox(
                                width: 160,
                                height: 150,
                                child: Image.asset(
                                  ImageConstants.pattiImg,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Column(
                              children: [],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.08, bottom: height * 0.2),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: width * 0.4,
                    height: 100,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: DataTable(dataRowHeight: 20, columns: const [
                        DataColumn(label: Text('Account No')),
                        DataColumn(label: Text('Amount')),
                        DataColumn(label: Text('Type')),
                      ], rows: const [
                        DataRow(cells: [
                          DataCell(Text('PS002020232')),
                          DataCell(Text('2')),
                          DataCell(Text('G')),
                        ]),
                      ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: width * 0.07, bottom: height * 0.2),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: width * 0.35,
                    height: 100,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: DataTable(dataRowHeight: 20, columns: const [
                        DataColumn(label: Text('To Account No')),
                        DataColumn(label: Text('Amount')),
                        DataColumn(label: Text('Type')),
                      ], rows: const []),
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
