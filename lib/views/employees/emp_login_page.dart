import 'package:flutter/material.dart';
import 'package:project_inc/services/service_imp.dart';
import 'package:project_inc/views/employees/emp_otp_verification_page.dart';

class EmployeeLoginPage extends StatefulWidget {
  const EmployeeLoginPage({Key? key}) : super(key: key);

  @override
  State<EmployeeLoginPage> createState() => _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {
  TextEditingController idController = TextEditingController();
  ServiceImp imp = new ServiceImp();
  TextEditingController passwordController = TextEditingController();

  Future<void> _continueButtonPressed() async {
    String id = idController.text;
    String password = passwordController.text;

    final check = await imp.checkEmp(id, password);
    print(check);

    if (check == true) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return EmployeeOtpVerificationPage();
          },
        ),
      );
    } else {}
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
        title: Text('Employee Login'),
        backgroundColor: Color.fromRGBO(53, 85, 235, 1),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'Employee ID'),
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
