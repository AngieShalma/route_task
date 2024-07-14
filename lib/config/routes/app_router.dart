
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_task/features/products_screen/presentation/pages/products_screen.dart';

import '../../core/components/reusable_components.dart';


class AppRoutesName{
  static const String productScreen="/";

}

class AppRoute{
 static Route onGenerate(RouteSettings settings){
   switch(settings.name){
     case AppRoutesName.productScreen:
       return MaterialPageRoute(builder: (context) => ProductScreen());

     default :
       return MaterialPageRoute(builder: (context) => unDefinedRoute());

   }
 }

}
