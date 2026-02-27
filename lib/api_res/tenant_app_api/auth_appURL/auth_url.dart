

class TenantAuthUrl{
  static const baseUrl = "https://cs-chcff8hfbahvdyd9.southindia-01.azurewebsites.net";

  static const registerEndPoint =  baseUrl + "/api/Account/register";
  static const loginEndPoint = baseUrl + "/api/Account/login";
  static const forgetEndPoint = baseUrl + "/api/Account/forgetpassword";
  static const resetEndPoint = baseUrl + "/api/Account/resetpassword";

  static const userCountEndPoint = baseUrl + "/api/Account/GetUsers";

}

class TenantAppUrl{

}