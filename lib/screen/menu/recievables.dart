import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'menu_controller/menu_controller.dart' as M;

class Recievables extends StatelessWidget {
  Recievables({super.key});
  M.MenuController menuController = Get.put(M.MenuController());

  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    var height = Get.height;
    return Container(
      width: width * 0.4,
      height: 100,
      color: Colors.white,
      child: SingleChildScrollView(
        child: DataTable(
          dataRowHeight: 20,
          headingRowColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              return Colors.grey[100]!;
            },
          ),
          border: TableBorder.all(
            color: Colors.grey,
            width: 2,
            style: BorderStyle.solid,
          ),
          headingTextStyle: GoogleFonts.openSans(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          columns: const [
            DataColumn(
              label: Text(
                'Account No',
              ),
            ),
            DataColumn(
              label: Text(
                'Amount',
              ),
            ),
            DataColumn(
              label: Text(
                'Type',
              ),
            ),
          ],
          rows: [
            ...menuController.recievables.value.map((ele) {
              return DataRow(
                color:
                    MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    print('Hovered');
                    return Colors.grey[200]!;
                  } else {
                    return Colors.grey[100]!;
                  }
                }),
                cells: [
                  DataCell(
                    Text(
                      ele.accountNumber.toString(),
                    ),
                  ),
                  DataCell(
                    Text(
                      ele.amount.toString(),
                    ),
                  ),
                  DataCell(
                    Text(
                      ele.type.toString(),
                    ),
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
