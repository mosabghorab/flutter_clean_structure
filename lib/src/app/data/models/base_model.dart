import 'package:new_streamline/src/core/enums.dart';

class BaseModel {
  BaseModel({
    this.status,
    this.code,
    this.message,
    this.datasourceType,
    this.datasource,
  });

  bool? status;
  int? code;
  String? message;
  DatasourceType? datasourceType;
  Datasource? datasource;

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        status: json["Status"],
        code: json["Code"],
        message: json["Message"],
        datasourceType: json["DatasourceType"],
        datasource: json["Datasource"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Code": code,
        "Message": message,
        "DatasourceType": datasourceType,
        "Datasource": datasource,
      };
}
