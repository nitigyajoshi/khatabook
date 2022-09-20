import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dashboard.dart';
class Registor extends StatefulWidget {
  const Registor({ Key? key }) : super(key: key);

  @override
  _RegistorState createState() => _RegistorState();
}

class _RegistorState extends State<Registor> {
var email,password;

    FirebaseAuth _auth = FirebaseAuth.instance;
    bool loading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.yellow,title:
      Text('Registor Page',style:TextStyle(fontSize: 14,color: Colors.black))),body:
       ListView(children: [
    
    
        Column(
    children: [
    SizedBox(height: 25,),
    
      TextField(
    
    decoration: InputDecoration(
    hintText: 'enter full name'
    ),
    onChanged: (value){
    },
    ),
      SizedBox(height: 15,),
    
    TextField(
    
    decoration: InputDecoration(
    hintText: 'enter email'
    ),
    onChanged: (value){
      email=value;
    },
    ),SizedBox(height: 15,),
    TextField(
    
    decoration: InputDecoration(
    hintText: 'enter password'
    ),
    onChanged: (value){
      password=value;
    },
    ),SizedBox(height: 15,),
    TextField(
    
    decoration: InputDecoration(
    hintText: 'enter phone number'
    ),
    onChanged: (value){
    },
    ),SizedBox(height: 15,),
    loading?Text('loading'):ElevatedButton(onPressed: ()async{
    
setState(() {
      loading=true;
       });

try{
var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                          setState(() {
                            loading=false;
                          });
if(user!=null){

Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));

}

}
catch(e){
setState(() {
                            loading=false;
                          });

                          print(e.toString());







}
    }
    , child: Text('Confirm Registor',style: TextStyle(color: Colors.black),))
    
    ],
    
    
    
    
        )
      ],
        
      ),
    );
  }
}