import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/product_model.dart';

abstract class ProductRepo{
  Future<Either<Failure,ProductModel>>getProducts();

}