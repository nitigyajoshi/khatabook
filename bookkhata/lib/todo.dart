class TODO{
  var id;
  var taskName,phone,date,due_amount;
  var isComlete,productname;


  TODO({this.isComlete,this.taskName,this.phone,this.id,this.date,this.due_amount,this.productname});



  Map<String, dynamic> toMap(){

   Map<String, dynamic> map = {
     "taskName": this.taskName,
     "isComplete":this.isComlete,
       "date":this.date,
       "phone":this.phone,
       "due_amount":this.due_amount,
       "productname":this.productname

   };

   return map;



  }




}