import 'package:injectable/injectable.dart';
import 'package:route_task/features/products_screen/data/data_source/product_ds.dart';
import 'package:route_task/features/products_screen/data/models/product_model.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_points.dart';
@Injectable(as:ProductDs )
class ProductDsImpl implements ProductDs{
  @override
  Future<ProductModel> getProducts() async{
    ApiManager apiManager=ApiManager();
    var response=await apiManager.getData(EndPoints.products);
    ProductModel productModel=ProductModel.fromJson(response.data);
    return productModel;
  }

}