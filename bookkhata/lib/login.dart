import 'dashboard.dart';

import 'package:flutter/material.dart';
import 'registor.dart';
import 'package:firebase_auth/firebase_auth.dart';
class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Scaffold(
      backgroundColor: Colors.white60,appBar: AppBar(
      backgroundColor: Colors.yellow,title:
      Text('Khata book 🛒',style:TextStyle(fontSize: 19,color: Colors.black)))
      
      ,body:log()),
      
      
    );
  }
}
class log extends StatefulWidget {
  const log({ Key? key }) : super(key: key);

  @override
  _logState createState() => _logState();
}

class _logState extends State<log> {
  var email,password;
  bool loading=false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: ListView(children: [
Column(
  children: [
    Text('👥',style: TextStyle(fontSize: 70),),
TextField(

decoration: InputDecoration(
hintText: 'enter email'




),
onChanged: (value){


email=value;
},


),
SizedBox(height: 15,),


        TextField(
    
       obscureText: true,
    
    decoration: InputDecoration(
    
    hintText: 'enter password'
    
    
    
    
    
    
    
    
    
    ),
    
    onChanged: (value){
    
    
    
    password=value;
    
    
    
    },
    
    
    
    
    
    ),



  

SizedBox(height: 15,),

     ElevatedButton(onPressed: ()async{
  
   setState(() {
           loading=true;
            });

try{

 var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
  setState(() {
          loading=false;
          });
  if(user!=null){



     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Dashboard()));
  }


                        
}
catch(e){

   setState(() {
                            loading=false;
                          });

                          print(e.toString());
}
  
  
     }
  , child: Text('Login',style: TextStyle(color: Colors.black),)),






SizedBox(height: 15,),
Text('Are you new to this app ?'),

ElevatedButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=> Registor()));
}
, child: Text('Registor Now',style: TextStyle(color: Colors.black),))


  ],
)



      ],
        
      ),
    );
  }
}