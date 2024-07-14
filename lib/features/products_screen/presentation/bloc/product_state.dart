part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({

  @Default(RequestStatus.init)  RequestStatus getProductStatus,


    ProductModel?productModel,

    Failure?ProductFailure,


}) = _ProductState;
}
