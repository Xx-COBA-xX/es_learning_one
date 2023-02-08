// ignore_for_file: prefer_const_constructors, must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, dead_code, sort_child_properties_last, sized_box_for_whitespace, unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class My_Text_Input extends StatefulWidget {
  My_Text_Input(
      {super.key,
      required this.label,

      required this.icon,
      required this.type,
      required this.controller,
      required this.validator,
      required this.isPassword});

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType type;
  final isPassword;
  String? Function(String?)? validator;

  @override
  State<My_Text_Input> createState() => _My_Text_InputState();
}

class _My_Text_InputState extends State<My_Text_Input> {
  @override
  var seePassword = true;
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(39),
          borderSide: BorderSide.none,
        ),
        hintText: widget.label,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    seePassword = !seePassword;
                  });
                },
                icon: seePassword
                    ? SvgPicture.asset(
                        "assets/icons/see-password.svg",
                      )
                    : SvgPicture.asset(
                        "assets/icons/hidden-password.svg",
                      ),
              )
            : null,
        hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        prefixIcon: Icon(
          widget.icon,
          size: 30,
          color: Colors.black87,
        ),
        filled: true,
        fillColor: kBackItemsColor,
      ),
      obscureText: (seePassword && widget.isPassword),
      controller: widget.controller,
      keyboardType: widget.type,
      style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
      maxLines: 1,
      validator: widget.validator,
    );
  }
}

class Login_With_Google_Btn extends StatelessWidget {
  Login_With_Google_Btn(
      {super.key,
      required this.btnColor,
      required this.width,
      required this.textColor,
      required this.title,
      required this.icon
      });

  double width;
  String title;
  Color btnColor;
  Color textColor;
  String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      child: FilledButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(btnColor),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, height: 30,),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: textColor,
                    fontSize: 22,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class CostamBtn extends StatelessWidget {
  String title;
  Color color;
  Function()? onPressed;
  double wight ;
  CostamBtn({
    required this.wight,
    required this.title,
    required this.color,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wight,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(39),
              ),
            )),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
