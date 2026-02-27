import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:manage_hotel/model/tenant_model/user_model.dart';
import 'package:manage_hotel/utils/app_export.dart';


class SplashServices{

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context)async{
    getUserData().then((value)async{

      if(value.token == 'null' || value.token == ''){
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushNamed(context, AppRouteName.loginScreen);
      }else{
        await Future.delayed(Duration(seconds: 2));
       Navigator.pushNamed(context, AppRouteName.tenantHomeScreen);

      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}