import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:manage_hotel/repository/tenant_repo/auth_repo/auth_repository.dart';
import 'package:manage_hotel/utils/routes/routes_name.dart';
import 'package:manage_hotel/utils/utils.dart';
import 'package:manage_hotel/view_model/splash_user_viewModel/user_view_model.dart';


class TenantAuthViewModel with ChangeNotifier{
  final _myRepo = TenantAuthRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context)async{
    setLoading(true);

    await _myRepo.loginApi(data).then((value){
      setLoading(false);

     if(kDebugMode){
       Utils.flushBarMessage(message: "Login done", context: context);
       print("view model login data get");
       print(value.toString());
       UserViewModel().saveUser(value);
     }

     // Future<void> getSavaUser() => UserViewModel().saveUser(value);
    }).onError((error, stackTrace){
      setLoading(false);
     if(kDebugMode){
       Utils.flushBarMessage(message: error.toString(), context: context);
     print(error.toString());
     print("ok yaha error ka pata chalega");
     }
    });
  }

  Future<void> forgetApi(dynamic data, BuildContext context)async{
    setLoading(true);

    await _myRepo.forgetApi(data).then((value){
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarMessage(message: "forget done", context: context);
        print("view model login data get");
        print(value.toString());

        Navigator.pushNamed(context, AppRouteName.resetPassScreen);
      }
    }).onError((error, stackTrace){
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarMessage(message: error.toString(), context: context);
        print(error.toString());
        print("ok yaha error ka pata chalega");
      }
    });
  }

  Future<void> signUp(dynamic data, BuildContext context)async{
    setLoading(true);

    await _myRepo.signUp(data).then((value){
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarMessage(message: "SignUp done", context: context);
        print(value.toString());
        print("view model signUp data get");
      }
    }).onError((error, stackTrace){
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarMessage(message: error.toString(), context: context);
        print(error.toString());
        print("ok yaha error ka pata chalega");
      }
    });
  }

  Future<void> userCount()async{
   await _myRepo.userCount();
  }

  Future<void> resetPassApi(dynamic data, BuildContext context)async{
    setLoading(true);

    await _myRepo.resetPassApi(data).then((value){
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarMessage(message: "resetPassApi done", context: context);
        print(value.toString());
        print("view model resetPassApi data get");
      }
    }).onError((error, stackTrace){
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarMessage(message: error.toString(), context: context);
        print(error.toString());
        print("ok yaha error ka pata chalega");
      }
    });
  }



}
