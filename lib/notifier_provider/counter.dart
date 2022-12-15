
import 'package:flutter_riverpod/flutter_riverpod.dart';




final CounterproviderNotifire = FutureProvider.family<String,String>((ref,city)async{
  print("entetre");
    return  increment(city);
});



  String increment (data){
    if(data.toString() =="kartik"){
      return "yes ok";
    }else{

      print("increment1"+data.toString());
      print("increment"+data.toString());
      return "no ok";
    }

   }
