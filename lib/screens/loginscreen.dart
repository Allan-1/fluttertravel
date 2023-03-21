import 'package:flutter/material.dart';
import 'package:mytravel/screens/main_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Email'),
              const SizedBox(
                height: 20,
              ),
              TextField(
                autofocus: true,
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
                width: MediaQuery.of(context).size.width*0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(15)),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen()), (route) => false);
                  },
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  const Text('Don\'t have an account'),
                  // TextButton(
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, Routes.signupScreen);
                  //     },
                  //     child: const Text('Register ?'))
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
