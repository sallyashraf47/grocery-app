import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cource/screens/auth/forget_pass.dart';
import 'package:cource/screens/auth/register.dart';
import 'package:cource/services/global_methods.dart';

import '../../consts/contss.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/google_button.dart';
import '../../widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;
  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  void _submitFormOnLogin() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print('THe form is valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Swiper(
          duration: 800,
          autoplayDelay: 8000,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              Constss.authImagesPaths[index],
              fit: BoxFit.cover,
            );
          },
          autoplay: true,
          itemCount: Constss.authImagesPaths.length,
        ),
      // //  Container(
      //     color: Colors.black.withOpacity(0.7),
      //   ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
            Container(
                margin: const EdgeInsets.all(20),
                height: 600,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Color(0xff3C486B),
                        fontSize: (28),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Sign in with your email and password  \nor continue with social media",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff3C486B),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              borderSide: const BorderSide(
                                color: Colors.white10,
                              )),
                          prefixIcon: const Icon(Icons.email),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              borderSide: const BorderSide(
                                color: Colors.white10,
                              )),
                          prefixIcon: const Icon(Icons.lock),
                        ),
                      ),
                    ),
                    // TextButton(style: ButtonStyle(alignment: Alignment.topRight),
                    //     onPressed: () {
                    //
                    // }, child: const Text("Forget Password",textAlign: TextAlign.right,style: TextStyle(color:  Color(0xff3C486B),),)),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forget password?',
                          style: TextStyle(
                            color: Color(0xff3C486B),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(250, 50)),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xff3C486B),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("SignIn")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Dont have account?",
                          style: TextStyle(
                            color: Color(0xff3C486B),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Color(0xff3C486B),
                              ),
                            ))
                      ],
                    )
                  ],
                ))
          ),
        )
      ]),
    );
  }
}
