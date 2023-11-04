import 'package:flutter/material.dart';
import 'package:project_inc/services/service_imp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddHrs(),
    );
  }
}

class AddHrs extends StatefulWidget {
  @override
  _AddHrsState createState() => _AddHrsState();
}

class _AddHrsState extends State<AddHrs> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add HRs'),
        backgroundColor: Color.fromRGBO(53, 85, 235, 1),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(53, 85, 235, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "+ 91 99********",
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(53, 85, 235, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  ServiceImp imp = new ServiceImp();
                  String id = await imp.addHR(
                      passwordController.text, nameController.text);

                  // Show an alert dialog when the button is clicked
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('HR information'),
                        content: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name: ${nameController.text}'),
                              Text('ID Created: ${id}'),
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Add HR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
