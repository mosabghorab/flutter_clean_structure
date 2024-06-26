import 'package:new_streamline/src/app/data/models/base_model.dart';
import 'package:new_streamline/src/app/data/models/entities/order.dart';

class OrderListModel extends BaseModel {
  List<Order>? data;

  OrderListModel({
    super.status,
    super.code,
    super.message,
    super.datasourceType,
    super.datasource,
    this.data,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        status: json["Status"],
        code: json["Code"],
        message: json["Message"],
        datasourceType: json["DatasourceType"],
        datasource: json["Datasource"],
        data: json["Data"] == null
            ? []
            : List<Order>.from(json["Data"]!.map((x) => Order.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
    });
}
