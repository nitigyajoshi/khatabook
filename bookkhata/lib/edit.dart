import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import 'todo.dart';

class EditScreen extends StatefulWidget {
 // final TODO todo;
 var todo;
 
  String documentId;

 
  EditScreen({this.todo, this.documentId=""});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  String todoTask="nk";
  String phone="jkjk",date="hjh",dueamount="jkj";
  FirebaseFirestore _store = FirebaseFirestore.instance;


  @override
  void initState() {
    // TODO: implement initState
    todoTask = widget.todo.taskName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit'),),
      body: Column(




        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'name',

            ),

            onChanged: (value){
              todoTask = value;
            },

          ),
           TextField(
            decoration: InputDecoration(
              hintText: 'phone no',

            ),

            onChanged: (value){
              phone = value;
            },

          ),
 TextField(
            decoration: InputDecoration(
              hintText: 'due amount',

            ),

            onChanged: (value){
            dueamount = value;
            },

          ),
TextField(
            decoration: InputDecoration(
              hintText: 'date',

            ),

            onChanged: (value){
              date= value;
            },

          ),
          IconButton(icon: Icon(Icons.add),onPressed: () async {
            TODO todo = TODO(taskName: todoTask, isComlete:widget.todo.isComlete);
            await _store.collection("todo").doc(widget.documentId).update({
              "name":todoTask,
               "phone":phone,
               "due amount":dueamount,
               "date":date,

            });


              Navigator.pop(context);


          },),


        ],

      ),
    );
  }
}