import 'package:http/http.dart';
import 'package:todolist/infrastructure/enums/network_status_enum.dart';

class BaseData<Temp>{
  Status? status;
  Temp? data;
  String? message;

  BaseData(this.status,this.data,this.message);

  BaseData.loading() : status = Status.LOADING;

  BaseData.completed(this.data) : status = Status.COMPLETED;

  BaseData.error(this.message) : status = Status.ERROR;

}