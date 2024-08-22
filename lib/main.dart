import 'package:flutter/material.dart';
import 'utils/app-routes.dart';
import 'screens/login.dart';
import 'screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
          accentColor: Colors.green,
        ).copyWith(
          primary: Colors.red,
          secondary: Colors.amber,
        ),
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red), // Borda vermelha
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red), // Borda vermelha quando habilitado
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.red), // Borda vermelha quando focado
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.yellow), // Borda vermelha em caso de erro
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    Colors.yellow), // Borda vermelha em caso de erro e focado
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Cor de fundo do botão
            foregroundColor: Colors.white, // Cor do texto do botão
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => LoginScreen(),
        AppRoutes.REGISTER: (ctx) => RegisterScreen(),
      },
    );
  }
}
