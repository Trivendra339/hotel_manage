
import 'package:flutter/cupertino.dart';

class RoomDataViewModel with ChangeNotifier{
   bool _power_On_Of = false;

  bool power_On_Of() => _power_On_Of;

  bool powerBtn(){
  _power_On_Of =! _power_On_Of;


   notifyListeners();
    return _power_On_Of;

  }

}