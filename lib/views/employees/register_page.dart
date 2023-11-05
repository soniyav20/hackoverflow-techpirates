// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:project_inc/views/home_page.dart';
// import '../../services/service_imp.dart';
// import '../../services/services.dart';
// import '../services/service_imp.dart';
// import '../services/services.dart';
//
// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key}) : super(key: key);
//
//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   final TextEditingController _phoneNumberController = TextEditingController();
//   final TextEditingController _otpController = TextEditingController();
//
//   String? _verificationId;
//   bool _verificationCompleted = false;
//
//   void _showSnackBar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(message),
//     ));
//   }
//
//   void _registerUser(BuildContext context) {
//     String email = emailController.text;
//     String password = passwordController.text;
//     String confirmPassword = confirmPasswordController.text;
//
//     if (email.isEmpty || !email.contains('@')) {
//       _showSnackBar(context, 'Invalid email address');
//     } else if (password.length < 6) {
//       _showSnackBar(context, 'Password must be at least 6 characters long');
//     } else if (password != confirmPassword) {
//       _showSnackBar(context, 'Passwords do not match');
//     } else {
//       Services obj = ServiceImp();
//       try {
//         obj.signup(
//           name: nameController.text,
//           mail: emailController.text,
//           pass: passwordController.text,
//         );
//       } catch (e) {
//         _showSnackBar(context, e.toString());
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 20),
//               Text(
//                 'Register Now',
//                 style: TextStyle(
//                   fontSize: 30,
//                   color: Colors.red,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: nameController,
//                 cursorColor: Colors.red,
//                 decoration: InputDecoration(
//                   hintText: 'Name',
//                   hintStyle: TextStyle(color: Colors.blue),
//                   filled: true,
//                   fillColor: Colors.blue[50],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.red),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: emailController,
//                 cursorColor: Colors.red,
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   hintStyle: TextStyle(color: Colors.blue),
//                   filled: true,
//                   fillColor: Colors.blue[50],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.red),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: passwordController,
//                 cursorColor: Colors.red,
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   hintStyle: TextStyle(color: Colors.blue),
//                   filled: true,
//                   fillColor: Colors.blue[50],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.red),
//                   ),
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: confirmPasswordController,
//                 cursorColor: Colors.red,
//                 decoration: InputDecoration(
//                   hintText: 'Confirm Password',
//                   hintStyle: TextStyle(color: Colors.blue),
//                   filled: true,
//                   fillColor: Colors.blue[50],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.red),
//                   ),
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(height: 40),
//               TextField(
//                 controller: _phoneNumberController,
//                 keyboardType: TextInputType.phone,
//                 cursorColor: Colors.red,
//                 decoration: InputDecoration(
//                   hintText: 'Phone Number',
//                   hintStyle: TextStyle(color: Colors.blue),
//                   filled: true,
//                   fillColor: Colors.blue[50],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.red),
//                   ),
//                 ),
//               ),
//               // TextField(
//               //   controller: _phoneNumberController,
//               //   keyboardType: TextInputType.phone,
//               //   decoration: InputDecoration(
//               //     labelText: 'Phone Number',
//               //   ),
//               // ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _verificationCompleted ? null : _verifyPhoneNumber,
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 child: Text(
//                   'Verify OTP',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               TextField(
//               controller: _otpController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'OTP',
//               )),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _verificationCompleted ? null : _signInWithOTP,
//                 child: Text('Verify OTP'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   _registerUser(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 child: Text(
//                   'Sign Up',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   'Back to Login',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.red,
//                   ),
//                 ),
//               ),
//           ],
//           ),
//         ),
//       ),
//     );
//   }
//   Future<void> _verifyPhoneNumber() async {
//     final String phoneNumber = _phoneNumberController.text.trim();
//     PhoneVerificationCompleted verificationCompleted =
//         (PhoneAuthCredential credential) async {
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       setState(() {
//         _verificationCompleted = true;
//       });
//     };
//     PhoneVerificationFailed verificationFailed =
//         (FirebaseAuthException e) {
//       print('Verification Failed: ${e.message}');
//     };
//
//     PhoneCodeSent codeSent =
//         (String verificationId, int? resendToken) {
//       setState(() {
//         _verificationId = verificationId;
//       });
//     };
//
//     PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//         (String verificationId) {
//       setState(() {
//         _verificationId = verificationId;
//       });
//     };
//
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       timeout: const Duration(seconds: 60),
//       verificationCompleted: verificationCompleted,
//       verificationFailed: verificationFailed,
//       codeSent: codeSent,
//       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//     );
//   }
//
//   Future<void> _signInWithOTP() async {
//     final String verificationCode = _otpController.text.trim();
//
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId!,
//         smsCode: verificationCode,
//       );
//
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {return Home();}),
//       );
//     } catch (e) {
//       print('Sign-in Failed: $e');
//     }
//   }
// }