import 'package:new_streamline/src/app/data/data_sources/local/fake/fake_order_datasource.dart';
import 'package:new_streamline/src/app/data/models/order_list_model.dart';

class OrderRepository {
  final FakeOrderDatasource fakeOrderDatasource;

  OrderRepository({
    required this.fakeOrderDatasource,
  });

  // get all.
  Future<OrderListModel> getAll() {
    return fakeOrderDatasource.getAll();
  }
}
