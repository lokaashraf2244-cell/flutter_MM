import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'loginscreen.dart';
import 'theme_cubit.dart';
import 'app_theme.dart';
import 'theme_state.dart';
import 'product_cubit.dart';
import 'product_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),

        BlocProvider<ProductCubit>(
          create: (context) => ProductCubit(ProductService()),
        ),
      ],

      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: state.isDark
                ? Apptheme().darktheme()
                : Apptheme().lighttheme(),

            home: const loginscreen(),
          );
        },
      ),
    );
  }
}
