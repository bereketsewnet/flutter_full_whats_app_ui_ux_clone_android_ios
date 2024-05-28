import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/login.jpg',
              width: MediaQuery.sizeOf(context).width * 0.7,
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 39,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'LogIn',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.teal),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 38,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'SignUp',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              width: MediaQuery.sizeOf(context).width * 0.8,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        border: InputBorder.none,
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.65,
                    child: Divider(
                      color: Colors.white.withOpacity(
                        0.5,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.password_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: Colors.white,
                          size: 20,
                        ),
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              color: Colors.white,
              textColor: Colors.teal,
              elevation: 10,
              onPressed: () {},
              child: const Text('LOGIN'),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.teal,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.30,
                  child: const Divider(
                    color: Colors.teal,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.30,
                  child: const Divider(
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.teal,
                  child: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                    size: 27,
                  ),
                ),
                SizedBox(width: 15),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.teal,
                  child: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                    size: 27,
                  ),
                ),
                SizedBox(width: 15),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.teal,
                  child: FaIcon(
                    FontAwesomeIcons.apple,
                    color: Colors.white,
                    size: 27,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
