import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'todo.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'dart:async';
import 'edit.dart';
import 'edit.dart';
onBackgroundMessage(SmsMessage message) {
  debugPrint("onBackgroundMessage called");
}
class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {




 FirebaseFirestore _store = FirebaseFirestore.instance;









final Telephony telephony = Telephony.instance;

String _message = "";
 onMessage(SmsMessage message) async {
    setState(() {
      _message = message.body ?? "Error reading message body.";
    });
  }
onSendStatus(SendStatus status) {
    setState(() {
      _message = status == SendStatus.SENT ? "sent" : "delivered";
    });
  }
 Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    final bool? result = await telephony.requestPhoneAndSmsPermissions;

    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: onMessage, onBackgroundMessage: onBackgroundMessage);
    }

    if (!mounted) return;
  }













//bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;

//  String? _message, body;
//  late TextEditingController _controllerPeople, _controllerMessage;
 @override
 void initState() { 
   super.initState();
    initPlatformState();
 }
// Future<void> initPlatformState() async {
//     // _controllerPeople = TextEditingController();
//     // _controllerMessage = TextEditingController();
  
//   }
Future<void> _sendSMS(List<String> recipients) async {
    try {
      String _result = await sendSMS(

        
          message:"hello", recipients: recipients);
      setState(() => message[0] = _result);
    } 
    catch (error) {
      setState(() => message[0] = error.toString());
    }
  }

//telephony.sendSmsByDefaultApp(to: "1234567890", message: "May the force be with you!");
List<String>message=["9886480557"];

  bool isvisible=false;
  var taskname;
  var phone,date,due_amount,productname;
  @override

  Widget build(BuildContext context) {
    
    return Scaffold(appBar: AppBar(backgroundColor: Colors.orange,title: Text('DashBoard'),actions: [IconButton(onPressed: (){

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> login()));

    }, icon: Icon(Icons.home)),

IconButton(onPressed: (){
setState(() {
  
  isvisible=true;
});


}


, icon: Icon(Icons.add))



    ],),
      
   body: Column(
     children: [



Visibility(visible:isvisible ,child: 

Container(color:Colors.lightGreen,
child: Expanded(
  child:   Column(
  
    children: [
  
  
  
  SizedBox(height: 50,
  
    child:   TextField(decoration: InputDecoration(
  
    
  
    hintText: 'enter name'
  
    
  
    ),
  
    
  
    onChanged: (value){
  
    
  
    taskname=value;
  
    }
  
    
  
  
  
    ),
  
  ),
  
  SizedBox(height: 50,
  
    child:   TextField(decoration: InputDecoration(
  
    
  
    hintText: 'enter phone no'

    ),

    onChanged: (value){
  
    phone=value;
  
    }
  
    ),
  
  ),
  
  SizedBox(height: 50,
  
    child:   TextField(decoration: InputDecoration(
  
    
  
    hintText: 'due amout'
  
    
  
    ),
  
    
  
    onChanged: (value){
  
    
  
    due_amount=value;
  
    }
  
    
  
  
  
    ),
  
  ),
  
  
  
  
  
  SizedBox(height: 50,
  
    child:   TextField(decoration: InputDecoration(
  
    
  
    hintText: 'enter date'
  
    
  
    ),
  
    
  
    onChanged: (value){
  
    
  
    date=value;
  
    }
  
    
  
  
  
    ),
  
  ),
  
  
  SizedBox(height: 50,
    child: TextField(decoration: InputDecoration(
    
      
    
      hintText: 'enter product name'

      ),

      onChanged: (value){
    
      productname=value;
    
      }
    
      ),
  ),
  
  
  
  
  
  
  
  
    IconButton(icon: Icon(Icons.add),onPressed: () async {
  
                      setState(() {
  
                       isvisible = false;
  
                      });
  
  
  
                      _store.collection("todo").add({
  
  
  
                        "name":taskname,
  
                        "paid":false,
  
                        "due amount":due_amount,
  
                        "date":date,
  
                        "phone":phone,
  
  "product":productname,
  
                      });
  
                    },),  ],),
),
))
,     Expanded(
  child:   StreamBuilder<QuerySnapshot>
  
         (
  
           stream: _store.collection("todo").snapshots(),
  
           
  
           builder: (context,snaphshot){
  
  
  try{
  if(snaphshot.hasData){
  
    return ListView.builder(
  
          itemCount: snaphshot.data?.size,
  
  
  
                    itemBuilder: (context,position){

                      //var a= null;
  
                    //return a;
  
 
  
  var data=snaphshot.data?.docs;
  
  
  
  var serverTodo=data?[position];
  
  TODO _todo=TODO(taskName: serverTodo?["name"],isComlete: serverTodo?["paid"],phone: serverTodo?["phone"],date: serverTodo?["date"],due_amount: serverTodo?["due amount"],productname: serverTodo?["product"]);
 message.add(_todo.phone);
return Container(
  color: Colors.lime,
child: Column(
  children: [Card(child:Column(children: [Column(
 
children: [
  


 // Text(serverTodo?["name"]),


  Card(child: Text('Name: ${_todo.taskName}',style: TextStyle(fontSize: 25,color: Colors.black))),
Card(child: Text('phone:${_todo.phone}',style: TextStyle(fontSize: 25,color: Colors.black),)),
Card(child: Text('due amount: ${_todo.due_amount}',style: TextStyle(fontSize: 25,color: Colors.black))),
Card(child: Text('date: ${_todo.date}',style: TextStyle(fontSize: 25,color: Colors.black))),
Card(child: Text('product name:${_todo.productname}',style: TextStyle(fontSize: 25,color: Colors.black))),







],

  ),
  Row( mainAxisAlignment: MainAxisAlignment.center,
children: [
IconButton(onPressed: ()async{

 var response =  await   Navigator.push(context, MaterialPageRoute(builder: (context)=> EditScreen(
                          todo: _todo,
                          documentId: data![position].id,

                        )));

}, icon: Icon(Icons.edit)),


IconButton(onPressed: ()async{

telephony.sendSmsByDefaultApp(to: "9886480557", message: "May the force be with you!");
}

, icon:Icon(Icons.message)),

//////////////////////////////////

 IconButton(icon: Icon(Icons.delete), onPressed: () async {
                await _store.collection("todo").doc(data![position].id).delete();

                      }),

],
  )
  
  
  ],) ,)





  ],
),




);





                    }
  
          
  
           );
  
      
  
  }
      else{
 
  return Text('Loading');
} 
  }
  catch(e){
     
} 
  return Text('data');
 // var a=null;
  
        //   return a;
  
  
  
         
  
  
  
  
  
  
  
  
  
  
  
         }
  
  //Padding(
  
    //padding: const EdgeInsets.symmetric(horizontal: 10),
  
    // child:   IconButton(iconSize: 40,onPressed: ()
  
    
  
    // {
  
    
  
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> login()));
  
    
  
    // }, icon:Icon(Icons.home)),
  
  //),
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
             ),
),
     ],
   )   );
  }
}
/**

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_offline/model/to_do.dart';

import '../edit_screen.dart';
import 'add_task.dart';
class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {



 FirebaseFirestore _store = FirebaseFirestore.instance;

 bool isVisible = false;

String taskName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),

      actions: [IconButton(icon: Icon(Icons.add), onPressed: ()  {
    setState(() {
      isVisible = true;
    });



      })],
      ),

      body: Column(








        children: [



          Visibility(
            visible: isVisible,
            child: Container(

              child: Column(
                children: [


                  TextField(
                    decoration: InputDecoration(
                        hintText: 'add task'

                    ),

                    onChanged: (value){
                      taskName = value;
                    },

                  ),


                  IconButton(icon: Icon(Icons.add),onPressed: () async {
                    setState(() {
                      isVisible = false;
                    });

                    _store.collection("todo").add({

                      "name":taskName,
                      "isComplete":false,

                    });





                  },),


                ],


              ),

            ),
          ),


















          Expanded(

            child: StreamBuilder<QuerySnapshot>(
            stream: _store.collection("todo").snapshots(),

            builder: (context, snaphshot){
    if(snaphshot.hasData){


        return ListView.builder(

            itemCount: snaphshot.data.size,

              itemBuilder: (context,position){

                var data = snaphshot.data.docs;

              var serverTodo = data[position];

            TODO _todo = TODO(taskName:serverTodo["name"], isComlete: serverTodo["isComplete"] );


        return  Container(
                child: Column(children: [


                  Text(_todo.taskName),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      IconButton(icon: Icon(Icons.edit), onPressed: () async {

                        var response =  await   Navigator.push(context, MaterialPageRoute(builder: (context)=> EditScreen(
                          todo: _todo,
                          documentId: data[position].id,

                        )));



                      }),
                      IconButton(icon: Icon(Icons.delete), onPressed: () async {
                await _store.collection("todo").doc(data[position].id).delete();

                      }),


                    ],)


                ],)



            );




        });


    }

            },


        ),
          ),

    ]
      )





    );
  }
}




























 */