enum Status {LOADING, COMPLETED, ERROR}

class ApiResponse<T>{
  Status? status ;
  T? data ;
  String? message ;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING ;

  ApiResponse.completed() : status = Status.COMPLETED ;

  ApiResponse.error() : status = Status.ERROR ;

  String toSting() {
    return "Status : $status \n message : $message \n data : $data";
  }
}