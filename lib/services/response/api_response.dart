
import 'package:hotel_manage/services/response/status.dart';

class ApiResponse<T>{
  Status? status ;
  T? data ;
  String? message ;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING ;

  ApiResponse.completed() : status = Status.COMPLETED ;

  ApiResponse.error() : status = Status.ERROR ;

  @override
  String toSting()=> "Status : $status \n message : $message \n data : $data";
}