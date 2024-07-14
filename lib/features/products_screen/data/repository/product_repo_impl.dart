import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/features/products_screen/data/data_source/product_ds.dart';
import 'package:route_task/features/products_screen/data/models/product_model.dart';
import 'package:route_task/features/products_screen/domain/repository/product_repo.dart';

import '../../../../core/errors/failures.dart';
@Injectable(as:ProductRepo )
class ProductRepoImpl implements ProductRepo{
  ProductDs productDs;
  ProductRepoImpl(this.productDs);
  @override
  Future<Either<Failure, ProductModel>> getProducts() async{
    try{
      var result =await productDs.getProducts();
      return Right(result);
    }catch(e){
      print(e.toString());
      return Left(RemoteFailure(e.toString()));
    }
  }

}