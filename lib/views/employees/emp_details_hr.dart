import 'package:flutter/material.dart';
import 'package:project_inc/services/service_imp.dart';
import 'package:project_inc/view_model/changes.dart';
import 'package:provider/provider.dart';

import '../../models/employee.dart';
import 'emp_upload_details_page.dart';

class EmployeeDetailsPageHR extends StatefulWidget {
  final String empId;

  EmployeeDetailsPageHR({required this.empId});

  @override
  _EmployeeDetailsPageHRState createState() => _EmployeeDetailsPageHRState();
}

class _EmployeeDetailsPageHRState extends State<EmployeeDetailsPageHR> {
  ServiceImp imp = ServiceImp();
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController adharController = TextEditingController();
  TextEditingController emergencyController = TextEditingController();
  TextEditingController hrIdController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController doornoController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController percentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch the employee details and populate the text fields
    fetchEmployeeDetails();
  }

  void fetchEmployeeDetails() async {
    try {
      empid = widget.empId;
      // Fetch the employee details using your service
      await context.read<MyModel>().getEmp();
      Employee? employee = context.read<MyModel>().state.emp;

      // Populate the text fields with the employee details
      idController.text = employee!.id;
      nameController.text = employee.name;
      passwordController.text = employee.password;
      emailController.text = employee.mail ?? '';
      phoneController.text = employee.phoneno;
      genderController.text = employee.gender ?? '';
      educationController.text = employee.education?.qualification ?? '';
      fatherNameController.text = employee.fathername ?? '';
      motherNameController.text = employee.mothername ?? '';
      dobController.text = employee.dob?.toString() ?? '';
      adharController.text = employee.adhar ?? '';
      emergencyController.text = employee.contacts?.phoneno ?? '';
      hrIdController.text = employee.hrid ?? '';

      // Address details
      streetController.text = employee.address?.street ?? '';
      doornoController.text = employee.address?.doorno ?? '';
      cityController.text = employee.address?.city ?? '';
      stateController.text = employee.address?.state ?? '';
      pincodeController.text = employee.address?.pincode.toString() ?? '';
      qualificationController.text = employee.education?.qualification ?? '';
      percentController.text = employee.education?.percent.toString() ?? '';
    } catch (error) {
      // Handle errors here
      print('Error fetching employee details: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
        backgroundColor: Color.fromRGBO(53, 85, 235, 1),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Text fields for employee details
          TextField(
            enabled: false,
            controller: idController,
            decoration: InputDecoration(labelText: 'Employee ID'),
          ),
          TextField(
            enabled: false,
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            enabled: false,
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          TextField(
            enabled: false,
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            enabled: false,
            controller: phoneController,
            decoration: InputDecoration(labelText: 'Phone Number'),
          ),
          TextField(
            enabled: false,
            controller: genderController,
            decoration: InputDecoration(labelText: 'Gender'),
          ),
          TextField(
            enabled: false,
            controller: educationController,
            decoration: InputDecoration(labelText: 'Education'),
          ),
          TextField(
            enabled: false,
            controller: fatherNameController,
            decoration: InputDecoration(labelText: 'Father Name'),
          ),
          TextField(
            enabled: false,
            controller: motherNameController,
            decoration: InputDecoration(labelText: 'Mother Name'),
          ),
          TextField(
            enabled: false,
            controller: dobController,
            decoration: InputDecoration(labelText: 'Date of Birth'),
          ),
          TextField(
            enabled: false,
            controller: adharController,
            decoration: InputDecoration(labelText: 'Aadhar Number'),
          ),
          TextField(
            enabled: false,
            controller: emergencyController,
            decoration: InputDecoration(labelText: 'Emergency Contact'),
          ),
          TextField(
            enabled: false,
            controller: hrIdController,
            decoration: InputDecoration(labelText: 'HR ID'),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            color: Color.fromRGBO(53, 85, 235, 1),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UploadDocumentsPage()),
              );
            },
            tooltip: 'Upload Documents',
            icon: Icon(Icons.upload),
          ),
          // SizedBox(height: 16),
          // FloatingActionButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Chat()),
          //     );
          //   },
          //   backgroundColor: Color.fromRGBO(53, 85, 235, 1),
          //   tooltip: 'Chat with HR',
          //   child: Icon(Icons.chat_bubble),
          // ),
        ],
      ),
    );
  }
}
