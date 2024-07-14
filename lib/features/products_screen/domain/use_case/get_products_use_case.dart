
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:route_task/features/products_screen/domain/repository/product_repo.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/product_model.dart';

@injectable
class GetProductsUseCase{
ProductRepo repo;
GetProductsUseCase(this.repo);
Future<Either<Failure, ProductModel>> call()=>repo.getProducts();

}