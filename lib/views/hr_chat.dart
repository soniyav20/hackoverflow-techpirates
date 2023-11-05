import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:project_inc/services/service_imp.dart';
import 'package:project_inc/view_model/changes.dart';
import 'package:provider/provider.dart';

import '../ciphers/encryptor.dart';

class HRChat extends StatefulWidget {
  final String empid;
  const HRChat({Key? key, required this.empid}) : super(key: key);

  @override
  State<HRChat> createState() => _HRChatState();
}

class _HRChatState extends State<HRChat> {
  Future<void> method() async {
    empid = widget.empid;
    await context.read<MyModel>().getMessages();
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

  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    BuiltList? list = context.read<MyModel>().state.messages;
    return RefreshIndicator(
      onRefresh: () {
        _refresh();
        return Future(() => null);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Talk to you Employee"),
          backgroundColor: Color.fromRGBO(53, 85, 235, 1),
        ),
        body: (list == null || list.isEmpty)
            ? Center(child: Text("Nothing Yet"))
            : Padding(
                padding: const EdgeInsets.only(bottom: 150),
                child: ListView.builder(
                  reverse: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          !list[index].isempSender ? 100 : 0,
                          8,
                          !list[index].isempSender ? 0 : 100,
                          8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: !list[index].isempSender
                              ? BorderRadius.horizontal(
                                  left: Radius.circular(30),
                                )
                              : BorderRadius.horizontal(
                                  right: Radius.circular(30),
                                ),
                          color: list[index].isempSender
                              ? Colors.grey
                              : Color.fromRGBO(53, 85, 235, 1),
                        ),
                        width: MediaQuery.of(context).size.width / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text( decrypt(list[index].message, encryptionKey),
                                style: TextStyle(color: Colors.white),

                              ),
                              Text(
                                list[index].time.substring(0, 16),
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
        floatingActionButton: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextField(
                    controller: message,
                    decoration: InputDecoration(
                      hintText: "Message here",
                      labelText: 'Message',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(53, 85, 235, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () async {
                  ServiceImp imp = new ServiceImp();
                  await imp.addMessage(hrid, empid, false, message.text);
                  await context.read<MyModel>().getMessages();
                  message.clear();

                  setState(() {});
                },
                icon: Icon(Icons.send))
          ],
        ),
      ),
    );
  }
}
