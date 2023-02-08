// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, unrelated_type_equality_checks

import 'package:es_learning_one/constants.dart';
import 'package:es_learning_one/screens/auth_screens/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _emailController = TextEditingController();
  var _nameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();

  bool remmberMe = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefulatPadding),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(
                    "assets/icons/sign-up-icon1.svg",
                    height: 130,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Create An Account",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text(
                    "Please fill the details and create account",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        My_Text_Input(
                          label: "Name",
                          icon: Icons.person_2_outlined,
                          type: TextInputType.name,
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Filed name";
                            }
                            return null;
                          },
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        My_Text_Input(
                          label: "Email",
                          icon: Icons.email_outlined,
                          type: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains("@") ||
                                value.contains("-") ||
                                value.contains(" ") ||
                                !value.contains(".com")) return "Filed Email";
                            return null;
                          },
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        My_Text_Input(
                          label: "Password",
                          icon: Icons.lock_outlined,
                          type: TextInputType.visiblePassword,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 8) return "Filed Password";
                            return null;
                          },
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        My_Text_Input(
                          label: "Confirm password",
                          icon: Icons.lock_outlined,
                          type: TextInputType.visiblePassword,
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 8 ) {
                              return "password is'n correct";
                            }
                            return null;
                          },
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Checkbox(
                            activeColor: Colors.black54,
                            value: remmberMe,
                            onChanged: (val) {
                              setState(() {
                                remmberMe = val!;
                              });
                            },
                          ),
                          Text("Remmamber Me",
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CostamBtn(
                    wight: size.width,
                    title: "LOGIN",
                    color: kPrimaryColor,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Login_With_Google_Btn(
                    btnColor: kBackItemsColor,
                    textColor: Color.fromARGB(255, 95, 95, 95),
                    width: size.width * 0.45,
                    icon: "assets/icons/google-logo.svg",
                    title: "Google",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      InkWell(
                        onTap: () {
                          print(_confirmPasswordController);
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ));
                        },
                        child: Text(
                          "  Log In",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: kBackgoundColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
