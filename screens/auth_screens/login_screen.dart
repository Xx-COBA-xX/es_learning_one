// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_final_fields, unused_field, camel_case_types, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

import 'package:es_learning_one/constants.dart';
import 'package:es_learning_one/screens/auth_screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var remmberMe = false;
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefulatPadding),
          child: Container(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SvgPicture.asset(
                        'assets/icons/login-icon.svg',
                        height: 150,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Welcome Log In",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text("Please Log in to continue using our app",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: kTextColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  )),
                      SizedBox(
                        height: 45,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            My_Text_Input(
                              isPassword: false,
                              label: "Email",
                              icon: Icons.email_outlined,
                              type: TextInputType.emailAddress,
                              controller: _emailController,
                              validator: (value) {
                                if (value == null ||
                                    !value.contains("@") ||
                                    value.isEmpty ||
                                    !value.contains(".com") ||
                                    value.contains("-") ||
                                    value.contains(" ")) {
                                  return "Filed Email";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            My_Text_Input(
                              isPassword: true,
                              label: "Password",
                              icon: Icons.lock_outlined,
                              type: TextInputType.visiblePassword,
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null ||
                                    value.length < 8 ||
                                    value.isEmpty) {
                                  return "Filed Password";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                          InkWell(
                            onTap: () {},
                            child: Text("Forget Password?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.black)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CostamBtn(
                        wight: size.width,
                        title: "LOGIN",
                        color: kPrimaryColor,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            return print("Work!!");
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "OR Login by",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Login_With_Google_Btn(
                        btnColor: kBackItemsColor,
                        textColor: Color.fromARGB(255, 95, 95, 95),
                        width: 170,
                        icon: "assets/icons/google-logo.svg",
                        title: "Google",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) {
                              return SignUpScreen();
                            },
                          ));
                        },
                        child: Text(
                          "  Sign Up",
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
