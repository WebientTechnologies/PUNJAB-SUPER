import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingDialog extends StatefulWidget {
  final height;
  final width;
  final ratio;
  const SettingDialog({
    super.key,
    this.height,
    this.width,
    this.ratio,
  });

  @override
  State<SettingDialog> createState() => _SettingDialogState();
}

class _SettingDialogState extends State<SettingDialog> {
  bool password = true;
  Widget radioButton(groupValue, index) {
    return Radio(
      value: true,
      groupValue: groupValue,
      fillColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          // Set the inactive color
          if (states.contains(MaterialState.disabled)) {
            return Colors.white;
          }
          return Colors.white;
        },
      ),
      activeColor: Colors.white,
      onChanged: (val) {
        onChanged(val, index);
      },
    );
  }

  Widget button(label, onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: widget.height * 0.05,
        width: widget.width * 0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Color.fromARGB(255, 31, 12, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void onChanged(val, index) {
    setState(() {
      if (index == 0) {
        password = true;
      } else {
        password = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.53,
      width: widget.width * 0.45,
      padding: const EdgeInsets.all(20),
      color: const Color.fromARGB(255, 31, 12, 1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'CHANGE PASSWORD',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // Radio buttons

            Padding(
              padding: EdgeInsets.only(right: widget.width * 0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      radioButton(password, 0),
                      const Text(
                        'Change Password',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      radioButton(!password, 1),
                      const Text(
                        'Change Pin',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Text Fields :
            if (password)
              ChangePassword(
                height: widget.height,
                width: widget.width,
              )
            else
              ChangePin(
                height: widget.height,
                width: widget.width,
              ),
            const SizedBox(
              height: 20,
            ),

            // Buttons:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button('SUBMIT', () {}),
                const SizedBox(
                  width: 20,
                ),
                button('CANCEL', () {
                  Get.back();
                }),
              ],
            ),

            // Response :
            Container(
              height: widget.height * 0.07,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.only(top: widget.height * 0.02),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    "RESPONSE : ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.width * 0.01,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePassword extends StatefulWidget {
  final height;
  final width;
  const ChangePassword({
    super.key,
    this.height,
    this.width,
  });

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String currentPassword = "";
  String newPassword = "";
  String confirmPassword = "";
  Widget textField(label, index, value) {
    return Padding(
      padding: EdgeInsets.only(top: widget.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: widget.width * 0.01,
            ),
          ),
          Container(
            height: widget.height * 0.05,
            width: widget.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              initialValue: value,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(
                  10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textField('CURRENT PASSWORD', 0, currentPassword),
        textField('NEW PASSWORD', 1, newPassword),
        textField('CONFIRM PASSWORD', 2, confirmPassword),
      ],
    );
  }
}

class ChangePin extends StatefulWidget {
  final height;
  final width;
  const ChangePin({
    super.key,
    this.height,
    this.width,
  });

  @override
  State<ChangePin> createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  String currentPin = "";
  String newPin = "";
  String confirmPin = "";
  Widget textField(label, index, value) {
    return Padding(
      padding: EdgeInsets.only(top: widget.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: widget.width * 0.01,
            ),
          ),
          Container(
            height: widget.height * 0.05,
            width: widget.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              initialValue: value,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(
                  10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textField('CURRENT PIN', 0, currentPin),
        textField('NEW PIN', 1, newPin),
        textField('CONFIRM PIN', 2, confirmPin),
      ],
    );
  }
}
