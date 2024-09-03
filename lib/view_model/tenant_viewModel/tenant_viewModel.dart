
import 'package:flutter/cupertino.dart';

class TenantHomeViewModel with ChangeNotifier{
  var time;


  myTime(){
      time = DateTime.now();
    notifyListeners();
  }

}