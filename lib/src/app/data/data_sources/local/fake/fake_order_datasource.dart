import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:new_streamline/src/app/data/models/order_list_model.dart';
import 'package:new_streamline/src/core/assets/assets_constants.dart';
import 'package:new_streamline/src/core/enums.dart';
import 'package:new_streamline/src/core/helpers/logs_helper.dart';

class FakeOrderDatasource {
  // get all.
  Future<OrderListModel> getAll() async {
    try {
      final result = jsonDecode(await rootBundle
          .loadString(AssetsConstants.fakeOrderListData))['Data'];
      final OrderListModel orderListModel = OrderListModel.fromJson({
        'Status': true,
        'Code': 200,
        'Message': 'Operation succeeded',
        'DatasourceType': DatasourceType.local,
        'Datasource': Datasource.fake,
        'Data': result,
      });
      LogsHelper.logSuccess(
          data: orderListModel.toJson().toString(),
          location: '${runtimeType.toString()} - getAll');
      return orderListModel;
    } catch (error) {
      LogsHelper.logError(
          error: error, location: '${runtimeType.toString()} - getAll');
      rethrow;
    }
  }
}
