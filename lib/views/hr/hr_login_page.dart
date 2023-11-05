import 'package:flutter/material.dart';
import 'package:project_inc/services/service_imp.dart';
import 'package:project_inc/view_model/changes.dart';
import 'package:project_inc/views/hr/hr_otp_verification_page.dart';
import 'package:provider/provider.dart';

class HrLoginPage extends StatefulWidget {
  const HrLoginPage({Key? key}) : super(key: key);

  @override
  State<HrLoginPage> createState() => _HrLoginPageState();
}

class _HrLoginPageState extends State<HrLoginPage> {
  TextEditingController idController = TextEditingController();
  ServiceImp imp = new ServiceImp();
  TextEditingController passwordController = TextEditingController();

  Future<void> _continueButtonPressed() async {
    String id = idController.text;
    String password = passwordController.text;

    final check = await imp.checkHr(id, password);
    print(check);

    // if (check == false) {
    //   await context.read<MyModel>().getHr();
    //   print(context.read<MyModel>().state.hr?.phoneno);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return HrOtpVerificationPage();
          },
        ),
      );
    // } else {}
  }
// method() async {
//     ServiceImp imp=new ServiceImp();
//    String empp= await  imp.addEmp( "+ 91 9363173016", "Je;;p");
//    empid=empp;
// }

  @override
  Widget build(BuildContext context) {
    // method();
    return Scaffold(
      appBar: AppBar(
        title: Text('HR Login'),
        backgroundColor: Color.fromRGBO(53, 85, 235, 1),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'HR ID'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _continueButtonPressed,
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
