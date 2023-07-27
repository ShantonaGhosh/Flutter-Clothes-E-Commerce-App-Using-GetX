import 'package:clothes_ecommerce_app/views/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: LayoutBuilder(
        builder: (context, cons) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: cons.maxHeight),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    height: 260,
                    child: Image.asset('assets/images/login.jpg'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 8,
                            color: Color.fromARGB(255, 179, 221, 181),
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                        child: Column(
                          children: [
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  CustomTextField(
                                    controller: emailController,
                                    hinText: 'email...',
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Obx(
                                    () => CustomTextField(
                                      obSecureText: isObsecure.value,
                                      controller: passwordController,
                                      hinText: 'password...',
                                      prefixIcon: const Icon(
                                        Icons.key,
                                        color: Colors.black,
                                      ),
                                      sufixIcon: Obx(
                                        () => GestureDetector(
                                          onTap: () {
                                            isObsecure.value =
                                                !isObsecure.value;
                                          },
                                          child: Icon(
                                            isObsecure.value
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 26,
                                  ),
                                  CustomButton(
                                    onTap: () {
                                      Get.to(HomeScreen());
                                    },
                                    title: const Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Dont have an account?',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.to(const SignUpScreen());
                                        },
                                        child: const Text(
                                          'SignUp here',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Or',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Are you admin?',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'Click here',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
