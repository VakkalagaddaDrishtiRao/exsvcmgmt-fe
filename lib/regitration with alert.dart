import 'package:app/Services/services.dart';
import 'package:app/updatepassword.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // bool _isRegistered = false;

  // void _register() {
    // setState(() {
    //   _isRegistered = true;
    // });
    // print(numberController.text);
    // print(nameController.text);
    // print(emailController.text);
    // print(mobileController.text);
    // _showAlertDialog(context);
  // }

  // void _showAlertDialog(BuildContext context) {
  //   // Create button
  //   Widget okButton = TextButton(
  //     child: const Text("OK", style: TextStyle(color: Color.fromRGBO(245, 237, 220, 1)),),
  //     style: TextButton.styleFrom(
  //       backgroundColor: const Color.fromRGBO(31, 110, 66, 1), // Button Background Color
  //     ),
  //     onPressed: () {
  //       Navigator.of(context).pop();
  //     },
  //   );

  //   // Create AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     backgroundColor: const Color.fromRGBO(245, 237, 220, 1),
  //     title: const Text(
  //       "Registration Successful",
  //       style: TextStyle(color: Color.fromRGBO(31, 110, 66, 1)),
  //     ),
  //     content: const Text(
  //       "YOUR REGISTRATION IS COMPLETE. KINDLY WAIT FOR YOUR VERIFICATION. THANK YOU.",
  //       style: TextStyle(color: Color.fromRGBO(31, 110, 66, 1)),
  //     ),
  //     actions: [
  //       okButton,
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
  final UserService _userService = UserService();
  void _register() async {
  final response = await _userService.registerUser(
    numberController.text,
    nameController.text,
    mobileController.text,
    emailController.text,
    passwordController.text,
  );

  if (response.statusCode == 201) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.success,
        title: "Registration Successful",
        text: "Please Login In",
      ),
    );
  } else {
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.danger,
        title: "Registration Failed",
        text: "",
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 237, 220, 1),
      appBar: AppBar(
        title: const Text(
          'Registration Page',
          style: TextStyle(color: Color.fromRGBO(245, 237, 220, 1)),
        ),
        backgroundColor: const Color.fromRGBO(245, 237, 220, 1),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color.fromRGBO(14, 84, 45, 1),
                Color.fromRGBO(17, 93, 51, 1),
                Color.fromRGBO(31, 110, 66, 1),
                Color.fromRGBO(32, 118, 30, 1),
                Color.fromRGBO(32, 118, 30, 1),
                Color.fromRGBO(31, 110, 66, 1),
                Color.fromRGBO(17, 93, 51, 1),
                Color.fromRGBO(14, 84, 45, 1),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text('Army Number'),
              const SizedBox(height: 5),
              TextField(
                controller: numberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Army Number',
                ),
              ),
              const SizedBox(height: 10),
              const Text('Name'),
              const SizedBox(height: 5),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name',
                ),
              ),
              const SizedBox(height: 10),
              const Text('Email'),
              const SizedBox(height: 5),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email',
                ),
              ),
              const SizedBox(height: 10),
              const Text('Phone Number'),
              const SizedBox(height: 5),
              TextField(
                controller: mobileController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Phone Number',
                ),
                
              ),
              const SizedBox(height: 10),
              const Text('Password'),
              const SizedBox(height: 5),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: MaterialButton(
                  onPressed: _register,
                  color: const Color.fromRGBO(31, 110, 66, 1),
                  textColor: const Color.fromRGBO(245, 237, 220, 1),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(height: 10),
               Padding(
                      padding: const EdgeInsets.symmetric(horizontal:35),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: (
                        ){Navigator.pop(context);},
                        color: const Color.fromRGBO(31,110, 66, 1),
                        textColor:const Color.fromRGBO(245,237, 220, 1),
                        child:const Text('Back to Login'),
                      
                      ),
                    ),
              const SizedBox(height: 20),
              // if (_isRegistered)
              //   const Text(
              //     'Registered',
              //     style: TextStyle(fontSize: 24, color: Colors.green),
              //     textAlign: TextAlign.center,
              //   ),
                
            ],
          ),
        ),
      ),
    );
  }
}
