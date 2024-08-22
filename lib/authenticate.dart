import 'dart:math';
import 'package:flutter/material.dart';
import 'regitration with alert.dart';
import 'withprofile.dart';

void main() {
  runApp(const authenticate());
}

class authenticate extends StatefulWidget {
  const authenticate({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<authenticate> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  String randomString = "";
  bool isOtpVerified = false;

  void buildCaptcha() {
    const letters = "1234567890"; // Use only numbers for OTP
    const length = 6;
    final random = Random();
    randomString = String.fromCharCodes(
      List.generate(length, (index) => letters.codeUnitAt(random.nextInt(letters.length))),
    );
    setState(() {});
    print("The random OTP is $randomString"); // Simulate sending OTP
  }

  @override
  void initState() {
    super.initState();
    buildCaptcha(); // Generate OTP when the app starts
  }

  void handleLogin() {
    if (mobileController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter mobile number')),
      );
      return;
    }
    if (otpController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter OTP')),
      );
      return;
    }
    if (randomString == otpController.text) {
      setState(() {
        isOtpVerified = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(245, 237, 220, 1),
        appBar: AppBar(
          title: const Text('Ex Servicemen Management Portal', style: TextStyle(color: Color.fromRGBO(245, 237, 220, 1))),
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
        body: Column(
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
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Mobile Number',
                          labelStyle: TextStyle(color: Colors.green),
                          hintText: 'Enter Mobile Number',
                          prefixIcon: Icon(Icons.phone),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0),
                          ),
                        ),
                        controller: mobileController,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter OTP',
                          labelStyle: const TextStyle(color: Colors.green),
                          hintText: 'Enter OTP',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: isOtpVerified ? Colors.green : Colors.red, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: isOtpVerified ? Colors.green : Colors.red, width: 2.0),
                          ),
                        ),
                        controller: otpController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const  HomePage()),
                        );
                        },
                        color: const Color.fromRGBO(31, 110, 66, 1),
                        textColor: const Color.fromRGBO(245, 237, 220, 1),
                        child: const Text('Verify'),
                      ),
                    ),
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
                  ],
                ),
              ),
            ),
            if (isOtpVerified)
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified, color: Colors.green),
                  Text("Verified"),
                ],
              )
            else
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red),
                  Text("Not Verified"),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
