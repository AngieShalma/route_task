import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


import '../../../../core/enums/enums.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/product_model.dart';
import '../../domain/use_case/get_products_use_case.dart';

part 'product_event.dart';

part 'product_state.dart';

part 'product_bloc.freezed.dart';
@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {

  GetProductsUseCase getProductsUseCase;

  ProductBloc( {

    required this.getProductsUseCase})
      : super(const ProductState()) {

    on<GetProductsEvent>((event,emit)async{
      emit(state.copyWith(getProductStatus: RequestStatus.loading));

      var result=await getProductsUseCase();
          result.fold((l)  {
            emit(state.copyWith(getProductStatus:RequestStatus.failure,ProductFailure: l));
          }, (r)  {
            emit(state.copyWith(getProductStatus: RequestStatus.success,productModel:r));
          });
    });

  }
}
