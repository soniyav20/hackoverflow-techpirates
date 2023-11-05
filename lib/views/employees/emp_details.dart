import 'package:flutter/material.dart';
import 'package:project_inc/services/service_imp.dart';
import 'package:project_inc/views/chat_page.dart';

import '../../models/employee.dart';
import 'emp_upload_details_page.dart';

class EmployeeDetailsPage extends StatefulWidget {
  final String empId;

  EmployeeDetailsPage({required this.empId});

  @override
  _EmployeeDetailsPageState createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {
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

  void updateEmployeeDetails() async {
    String mail = emailController.text;
    String phoneno = phoneController.text;
    String street = streetController.text;
    String doorno = doornoController.text;
    String city = cityController.text;
    String state = stateController.text;
    int pincode = int.tryParse(pincodeController.text) ?? 0;
    String gender = genderController.text;
    String qualification = qualificationController.text;
    double percent = double.tryParse(percentController.text) ?? 0.0;
    String fathername = fatherNameController.text;
    String mothername = motherNameController.text;
    DateTime dob = DateTime.tryParse(dobController.text) ?? DateTime.now();
    String adhar = adharController.text;
    String emergency = emergencyController.text;

    await imp.editEmp(
      mail,
      phoneno,
      street,
      doorno,
      city,
      state,
      pincode,
      gender,
      qualification,
      percent,
      fathername,
      mothername,
      dob,
      adhar,
      emergency,
    );

    // Optionally, show a success message or navigate back to the previous screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Employee details updated successfully.'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Fetch the employee details and populate the text fields
    fetchEmployeeDetails();
  }

  void fetchEmployeeDetails() async {
    try {
      // Fetch the employee details using your service
      Employee employee = await imp.getEmpDetails();

      // Populate the text fields with the employee details
      idController.text = employee.id;
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
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Text fields for employee details
          TextField(
            controller: idController,
            decoration: InputDecoration(labelText: 'Employee ID'),
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(labelText: 'Phone Number'),
          ),
          TextField(
            controller: genderController,
            decoration: InputDecoration(labelText: 'Gender'),
          ),
          TextField(
            controller: educationController,
            decoration: InputDecoration(labelText: 'Education'),
          ),
          TextField(
            controller: fatherNameController,
            decoration: InputDecoration(labelText: 'Father Name'),
          ),
          TextField(
            controller: motherNameController,
            decoration: InputDecoration(labelText: 'Mother Name'),
          ),
          TextField(
            controller: dobController,
            decoration: InputDecoration(labelText: 'Date of Birth'),
          ),
          TextField(
            controller: adharController,
            decoration: InputDecoration(labelText: 'Aadhar Number'),
          ),
          TextField(
            controller: emergencyController,
            decoration: InputDecoration(labelText: 'Emergency Contact'),
          ),
          TextField(
            controller: hrIdController,
            decoration: InputDecoration(labelText: 'HR ID'),
          ),
          SizedBox(height: 20),

          // Save button to update employee details
          ElevatedButton(
            onPressed: updateEmployeeDetails,
            child: Text('Save'),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UploadDocumentsPage()),
              );
            },
            tooltip: 'Upload Documents',
            child: Icon(Icons.upload),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Chat()), 
              );
            },
            tooltip: 'Chat with HR',
            child: Icon(Icons.chat_bubble),
          ),
        ],
      ),
    );
  }
}
