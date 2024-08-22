
// ignore_for_file: file_names

import 'package:flutter/material.dart';

void main(){
  runApp(const forgotpassword());
}

class forgotpassword extends StatefulWidget{
  const forgotpassword({super.key});

  @override

  _MyAppState createState()=> _MyAppState();
}

class _MyAppState extends State<forgotpassword>{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(245, 237, 220, 1),
        appBar: AppBar(
          title: const Text ('Ex Servicemen Management Portal', style: TextStyle(color: Color.fromRGBO(245, 237,220, 1)),),
           flexibleSpace: Container(
               decoration: const BoxDecoration(
               gradient: LinearGradient(
               begin: Alignment.centerRight, // Start direction
               end: Alignment.centerLeft, // End direction
               colors: [
                 Color.fromRGBO(14, 84, 45, 1), // Start Color
                 Color.fromRGBO(17, 93, 51, 1),
                 Color.fromRGBO(31, 110, 66, 1),
                 Color.fromRGBO(32, 118, 30, 1),
                 Color.fromRGBO(32, 118, 30, 1),
                 Color.fromRGBO(31, 110, 66, 1),
                 Color.fromRGBO(17, 93, 51, 1),
                 Color.fromRGBO(14, 84, 45, 1),// End Color
          ], // Customize your colors here
        ),
      ),
        ),
        ),
        body: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Reset Password',
              style:TextStyle(
                fontSize: 35,
                color:Colors.green,
                fontWeight: FontWeight.bold
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:30),
                child: Form(child: Column(
                  children:[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                                  color: Colors.green),
                          hintText: 'Enter Password',
                          prefixIcon: Icon(Icons.password),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0),
                    ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0),
                    ),
                        ),
                        onChanged: (String value){
                        },
                        validator: (value){
                          return value!.isEmpty?'Please enter new password':null;
                        },
                      ),
                    ),
                    const SizedBox(height:30),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                                  color: Colors.green),
                          hintText: 'Re Enter Password',
                          prefixIcon: Icon(Icons.password),
                          enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.green, width: 2.0),
                    ),
                          focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.green, width: 2.0),
                    ),
                          ),
                          
                      
                        onChanged: (String value){
                        },
                       validator: (value){
                          return value!.isEmpty?'Please confirm Password':null;
                        },
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:35),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: (
                        ){},
                        color: const Color.fromRGBO(31,110, 66, 1),
                        textColor:const Color.fromRGBO(245,237, 220, 1),
                        child:const Text('Reset'),
                      
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
                  ]
                ),
                ),
              ),
          ],
        )
      )
    );
  }
  }
