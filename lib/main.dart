import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_app/bloc/product_list_bloc.dart';
import 'package:phone_app/product_add/bloc/product_add_bloc.dart';
import 'package:phone_app/product_detail/bloc/product_detail_bloc.dart';
import 'package:phone_app/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ProductListBloc(),
      ),
      BlocProvider(
        create: (context) => ProductDetailBloc(),
      ),
      BlocProvider(create: (context) => ProductAddBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.urbanistTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}
