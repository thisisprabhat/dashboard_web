import 'package:admin_pannel_p1/controllers/MenuController.dart';
import 'package:admin_pannel_p1/network/remote/api/products_api.dart';
import 'package:admin_pannel_p1/network/remote/api/todo_api_call.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'controllers/product_controller.dart';
import 'controllers/todo_controllers.dart';
import 'screens/main/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductController()),
          ChangeNotifierProvider(create: (_) => MenuController()),
          ChangeNotifierProvider(create: (_) => ToDoController())
        ],
        builder: (context, child) => const MainScreen(),
      ),
    );
  }
}
