import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/product_model.dart';



class ProductItem extends StatelessWidget {
  final int index;
  final ProductModel? productModel;
  const ProductItem(
  {required this.index, required this.productModel, super.key});

@override
Widget build(BuildContext context) {
  var product = productModel?.products?[index];
  return Padding(
    padding: EdgeInsets.only(
        left: index.isEven ? 16.w : 0, right: index.isOdd ? 16.w : 0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 2.w, color: Colors.blueGrey)),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),

                  child: CachedNetworkImage(
                    imageUrl: product?.images?.first ?? "",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,

                        ),
                      ),),
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),

                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      // margin: const EdgeInsets.only(left: 20),
                      padding: EdgeInsets.all(2.h.w),

                      margin: EdgeInsets.only(left: 6.w),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        // border:
                        //     Border.all(width: 2.w, color: Colors.blueGrey)
                      ),
                      child: Icon(
                        Icons.favorite_outline,
                        color: AppColors.blueColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.w,bottom: 2.h),
                    child: Text(
                      product?.brand ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text(
                      productModel?.products?[index].description ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //SizedBox(width: 8.w),
                        Text("EGP ${product?.price?.toStringAsFixed(2) ?? ""}",style: TextStyle(fontSize: 14.sp),),

                        Text("${((((product!.price)!*(product!.discountPercentage)!)/100)+(product!.price)!).toStringAsFixed(2)}EGP",
                          style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 14.sp),),
                      ],
                    ),
                  ),
                  //SizedBox(height: 2.h),
                  // const Spacer(),
                  Padding(
                    padding:
                    EdgeInsets.only(right: 1.w, bottom: 1.h,left: 8.w),
                    child: Row(
                      children: [
                        const Text("Review",style: TextStyle(fontSize: 12),),
                        SizedBox(width: 4.w),
                        Text("(${product?.rating.toString()})" ?? "",style: TextStyle(fontSize: 12)),
                        SizedBox(width: 4.w),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 8.w,),
                        //const Spacer(),
                        Expanded(
                          child: Container(

                              padding: EdgeInsets.all(5.w.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                color: AppColors.blueColor,
                              ),
                              child: const Icon(Icons.add, color: Colors.white)),
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    ),
  );
}
}