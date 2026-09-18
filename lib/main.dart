import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/presentation/screens/loginscreen.dart';
import 'package:mm/core/cubit/theme/theme_cubit.dart';
import 'package:mm/core/utils/app_theme.dart';
import 'package:mm/core/cubit/theme/theme_state.dart';
import 'product_service.dart';
import 'presentation/cubit/product/product_cubit.dart';
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
