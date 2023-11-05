import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:project_inc/view_model/changes.dart';
import 'package:project_inc/views/employees/emp_details_hr.dart';
import 'package:provider/provider.dart';

class ViewEmployee extends StatefulWidget {
  const ViewEmployee({Key? key}) : super(key: key);

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {
  Future<void> method() async {
    await context.read<MyModel>().getTotalEmplist();
    setState(() {});
  }

  Future<void> _refresh() async {
    await context.read<MyModel>().getTotalEmplist();
    setState(() {});
    return null;
  }

  @override
  void initState() {
    method();
    setState(() {});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BuiltList? list = context.read<MyModel>().state.employees;

    return RefreshIndicator(
      onRefresh: () {
        _refresh();
        return Future(() => null);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("View Employees"),
          backgroundColor: Color.fromRGBO(53, 85, 235, 1),
        ),
        body: (list == null || list.isEmpty)
            ? Center(child: Text("Nothing Yet"))
            : Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmployeeDetailsPageHR(
                                empId: list[index].id,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Text(list[index].name),
                              Text(list[index].id),
                              Text(list[index].phoneno)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
