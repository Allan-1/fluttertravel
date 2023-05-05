import 'package:flutter/material.dart';
import 'package:mytravel/api/loginapi.dart';
import 'package:mytravel/screens/main_screen.dart';

import 'loginscreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool obscurePass = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Username'),
              const SizedBox(
                height: 20,
              ),
              TextField(
                autofocus: true,
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: "Username",
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Email'),
              const SizedBox(
                height: 20,
              ),
              TextField(
                autofocus: true,
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "user@mail.com",
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Password'),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: obscurePass,
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Your Password',
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePass = !obscurePass;
                        });
                      },
                      icon: obscurePass
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {}, child: const Text('Forgot password ?')),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(15)),
                  onPressed: () {
                    // signupApi(usernameController.text, passwordController.text, emailController.text);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                            (route) => false);
                  },
                  child: const Text('Signup'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Already have an account ?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text('Register ?'))
                ],
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Safiri uses cookies for analytics and personalized content. By using Safiri services you agree to the use of cookies',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
