import 'package:flutter/material.dart';
import 'package:route_task/features/products_screen/presentation/pages/products_screen.dart';

import 'injection.dart';
import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}


