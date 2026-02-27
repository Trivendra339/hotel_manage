import 'package:manage_hotel/api_res/tenant_app_api/auth_appURL/auth_url.dart';
import 'package:manage_hotel/services/network/baseApiServices.dart';
import 'package:manage_hotel/services/network/network_api_services.dart';

class TenantAuthRepository {

  BaseApiServices _authApiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async{
       dynamic response = await _authApiServices.postApiResponse(TenantAuthUrl.loginEndPoint, data);
       return response;

  }

  Future<dynamic> signUp(dynamic data) async{
      try{
        dynamic response = await _authApiServices.postApiResponse(TenantAuthUrl.registerEndPoint, data);
        return response;
      }catch(e){
        throw e;
      }
  }

  Future<dynamic> forgetApi(dynamic data) async{
    try{
      dynamic response = await _authApiServices.postApiResponse(TenantAuthUrl.forgetEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }

    // dynamic response = await _authApiServices.postApiResponse(TenantAuthUrl.forgetEndPoint, data);
    // return response;

  }

  Future<dynamic> resetPassApi(dynamic data) async{
    try{
      dynamic response = await _authApiServices.postApiResponse(TenantAuthUrl.resetEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }


  Future<dynamic> userCount() async{
      dynamic response = await _authApiServices.getApiResponse(TenantAuthUrl.userCountEndPoint);
      return response;
  }

}