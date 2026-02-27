
import 'package:flutter/cupertino.dart';

class TenantHomeViewModel with ChangeNotifier{
  late DateTime time;
  final FocusNode textFieldFocus = FocusNode();

  void removeFocus(){
    textFieldFocus.unfocus();
    notifyListeners();
  }

  Stream<DateTime> dateTime(){
    return Stream<DateTime>.periodic(Duration(seconds: 1), (x) {
      return time = DateTime.now();
    });

  }

  void myTime(DateTime value){
      time = value;
    notifyListeners();
  }

  @override
  void dispose(){
    super.dispose();
    textFieldFocus.dispose();
  }

}