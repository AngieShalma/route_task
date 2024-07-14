import '../models/product_model.dart';

abstract class ProductDs{
  Future<ProductModel> getProducts();

}