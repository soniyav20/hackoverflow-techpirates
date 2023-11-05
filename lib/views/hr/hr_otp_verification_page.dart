import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_inc/services/service_imp.dart';
import 'package:project_inc/view_model/changes.dart';
import 'package:project_inc/views/hr_view_employees.dart';
import 'package:provider/provider.dart';

import '../../models/hr.dart';

class HrOtpVerificationPage extends StatefulWidget {
  const HrOtpVerificationPage({Key? key}) : super(key: key);

  @override
  _HrOtpVerificationPageState createState() => _HrOtpVerificationPageState();
}

class _HrOtpVerificationPageState extends State<HrOtpVerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  String? _verificationId;
  bool _verificationCompleted = false;
  ServiceImp imp = ServiceImp();

  @override
  void initState() {
    super.initState();
    _getPhoneNumberAndSendOTP();
  }

  Future<void> _getPhoneNumberAndSendOTP() async {
    setState(() {});
    _verifyPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    Hr? hr = context.read<MyModel>().state.hr;

    return Scaffold(
      appBar: AppBar(
        title: Text('hr OTP Verification'),
        backgroundColor: Color.fromRGBO(53, 85, 235, 1),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(hr?.phoneno ?? "--"),
            SizedBox(height: 20),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.phone,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                hintText: 'Enter the OTP you received',
                hintStyle: TextStyle(color: Colors.blue),
                filled: true,
                fillColor: Colors.blue[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _verificationCompleted ? null : _signInWithOTP,
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // ElevatedButton(
            //   onPressed: () {
            //     // imp.signin();
            //     // Handle the Sign Up action if needed
            //   },
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.red,
            //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //   ),
            //   child: Text(
            //     'Sign Up',
            //     style: TextStyle(
            //       fontSize: 16,
            //       // fontWeight: FontWeight bold,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> _verifyPhoneNumber() async {
    await context.read<MyModel>().getHr();
    print(hrid);
    // Use the phone number obtained in initState
    final String phoneNumber =
        context.read<MyModel>().state.hr?.phoneno.trim() ?? '';

    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential credential) async {
      await FirebaseAuth.instance.signInWithCredential(credential);
      setState(() {
        _verificationCompleted = true;
      });
    };
    PhoneVerificationFailed verificationFailed = (FirebaseAuthException e) {
      print('Verification Failed: ${e.message}');
    };

    PhoneCodeSent codeSent = (String verificationId, int? resendToken) {
      setState(() {
        _verificationId = verificationId;
      });
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      setState(() {
        _verificationId = verificationId;
      });
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<void> _signInWithOTP() async {
    final String verificationCode = _otpController.text.trim();

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: verificationCode,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to the next page, for example, hrDetailsPage
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HRViewEmployee()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      print('Sign-in Failed: $e');
    }
  }
}
