import 'dart:convert';
import 'dart:math';
import 'package:app/Database/database_helper.dart';
import 'package:app/Services/services.dart';
import 'package:app/withprofile.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'regitration with alert.dart';
import 'forgot password.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController captchaController = TextEditingController();

  String randomString = "";
  bool isVerified = false;
  bool fetching=false;

  void buildCaptcha() {
    const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    const length = 6;
    final random = Random();
    randomString = String.fromCharCodes(
      List.generate(length, (index) => letters.codeUnitAt(random.nextInt(letters.length))),
    );
    setState(() {});
    print("The random string is $randomString");
  }

  @override
  void initState() {
    super.initState();
    buildCaptcha();
  }

  void handleLogin() {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email')),
      );
      return;
    }
    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter password')),
      );
      return;
    }
    if (captchaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter captcha value')),
      );
      return;
    }
    if (captchaController.text == randomString) {
      // Handle the login logic here
      print(emailController.text);
      print(passwordController.text);
      setState(() {
        isVerified = true;
      });
      // Perform the login action
      // For example, navigate to the next screen or show a success message
    } else {
      setState(() {
        isVerified = false;
      });
      // Show an error message if the CAPTCHA is not verified
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect CAPTCHA value')),
      );
    }
  }

  final UserService _userService = UserService();

  void _login() async {
  final response = await _userService.loginUser(
    emailController.text,
    passwordController.text,
  );

  if (response.statusCode == 200) {
    final String token = response.body;
    await DatabaseHelper().saveToken(token);
    String? token1=await DatabaseHelper().getToken();
    final response1 = await _userService.getUserData(token);
    Map<String, dynamic> data = jsonDecode(response1.body);
    await DatabaseHelper().saveUserData(data);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.success,
        title: "Login Successful",
        text: "Welcome back!",
      ),
    );
  } else {
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.danger,
        title: "Login Failed",
        text: response.body,
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 237, 220, 1),
      // appBar: AppBar(
      //   title: const Text(
      //     'Ex Servicemen Management Portal',
      //     style: TextStyle(color: Color.fromRGBO(245, 237, 220, 1)),
      //   ),
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.centerRight,
      //         end: Alignment.centerLeft,
      //         colors: [
      //           Color.fromRGBO(14, 84, 45, 1),
      //           Color.fromRGBO(17, 93, 51, 1),
      //           Color.fromRGBO(31, 110, 66, 1),
      //           Color.fromRGBO(32, 118, 30, 1),
      //           Color.fromRGBO(32, 118, 30, 1),
      //           Color.fromRGBO(31, 110, 66, 1),
      //           Color.fromRGBO(17, 93, 51, 1),
      //           Color.fromRGBO(14, 84, 45, 1),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.green),
                            hintText: 'Enter Email',
                            prefixIcon: Icon(Icons.email),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 2.0),
                            ),
                          ),
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter email' : null;
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.green),
                            hintText: 'Enter Password',
                            prefixIcon: Icon(Icons.password),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 2.0),
                            ),
                          ),
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter Password' : null;
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              randomString,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: buildCaptcha,
                            icon: const Icon(Icons.refresh),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: TextFormField(
                          controller: captchaController,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 2.0),
                            ),
                            hintText: 'Enter Captcha Value',
                            labelText: 'Enter Captcha Value',
                            labelStyle: TextStyle(color: Colors.green),
                          ),
                          onChanged: (value) {
                            setState(() {
                              isVerified = false;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      fetching==true?
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'OTP',
                            labelStyle: TextStyle(color: Colors.green),
                            hintText: 'Enter OTP',
                            prefixIcon: Icon(Icons.email),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 2.0),
                            ),
                          ),
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter OTP' : null;
                          },
                        ),
                      ):SizedBox(),
        
                    
                        
                      
                          const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed:  (){
                            _login();
                      
                        } ,
                          color: const Color.fromRGBO(31, 110, 66, 1),
                          textColor: const Color.fromRGBO(245, 237, 220, 1),
                          child: const Text('Login'),
                        ),
                      ),
                        
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const forgotpassword()),
                          );
                        },
                        child: const Text('Forgot Password?', style: TextStyle(color: Colors.green)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const  RegisterPage()),
                          );
                        },
                        child: const Text("Don't have an account? Sign Up", style: TextStyle(color: Colors.green)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}