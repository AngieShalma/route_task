import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../injection.dart';
import '../bloc/product_bloc.dart';
import '../widgets/product_item.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductBloc>()..add(GetProductsEvent()),
      child: BlocBuilder<ProductBloc, ProductState>(

        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
             leadingWidth: 100.w,
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SvgPicture.asset('assets/images/route.svg',),
              ),
            ),

            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 5.h),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFF004182)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFF004182)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xFF06004E),
                              ),
                              hintText: 'what do you search for?',
                              hintStyle: TextStyle(
                                color: Color(0x9906004E),
                                fontSize: 14.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.shopping_cart,
                          size: 30.0.sp,
                          color: Color(0xff004182),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                  Expanded(
                    child: GridView.builder(
                    itemCount: state.productModel?.products?.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (192 / 250),
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w),
                    itemBuilder: (context, index) {
                      return ProductItem(
                          productModel: state.productModel, index: index);
                    },
                ),
                  )

              ],
            ),
          );
        },
      ),
    );



  }
}
