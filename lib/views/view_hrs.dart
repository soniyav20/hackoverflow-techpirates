import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:project_inc/services/service_imp.dart';
import 'package:project_inc/view_model/changes.dart';
import 'package:provider/provider.dart';

class ViewHrs extends StatefulWidget {
  const ViewHrs({Key? key}) : super(key: key);

  @override
  State<ViewHrs> createState() => _ViewHrsState();
}

class _ViewHrsState extends State<ViewHrs> {
  Future<void> method() async {
    hrid = '1111';
    empid = '1111';
    await context.read<MyModel>().getHrlist();
    setState(() {});
  }

  void _refresh() {
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
    BuiltList? list = context.read<MyModel>().state.hrs;

    return Scaffold(
      appBar: AppBar(
        title: Text("View HRs"),
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
                    child: Card(
                      child: Column(
                        children: [
                          Text(list[index].name),
                          Text(list[index].id),
                          Text(list[index].phoneno)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
