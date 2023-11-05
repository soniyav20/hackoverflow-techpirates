import 'package:flutter/material.dart';
import 'package:project_inc/services/service_imp.dart';
class ChangePasswordEmp extends StatefulWidget {
  const ChangePasswordEmp({Key? key}) : super(key: key);

  @override
  State<ChangePasswordEmp> createState() => _ChangePasswordEmpState();
}

class _ChangePasswordEmpState extends State<ChangePasswordEmp> {
  TextEditingController idController =new TextEditingController();
  TextEditingController passwordController =new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _continueButtonPressed,
              child: Text('Continue'),
            ),
          ],
        ),
      ),

    );
  }
  Future<void> _continueButtonPressed() async {
    String id = idController.text;
    String password = passwordController.text;
    ServiceImp imp=new ServiceImp();
    final check = await imp.changeEmpPass( password);

    // if (check == false) {
    //   await context.read<MyModel>().getHr();
    //   print(context.read<MyModel>().state.hr?.phoneno);
    Navigator.of(context).pop();
    // } else {}
  }
}
