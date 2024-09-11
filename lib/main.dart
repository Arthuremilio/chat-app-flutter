import 'package:flutter/material.dart';
import 'package:chatapp/screens/chat.dart';
import 'utils/app-routes.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'package:firebase_core/firebase_core.dart';

const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyDwuc1TUb5GVh1RzxIOV1Z5nnf7kBbxxFA",
    authDomain: "chat-2c564.firebaseapp.com",
    projectId: "chat-2c564",
    storageBucket: "chat-2c564.appspot.com",
    messagingSenderId: "901267914018",
    appId: "1:901267914018:web:3f93a426946aceb2d7397b");

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: firebaseConfig);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      initialRoute: AppRoutes.LOGIN,
      routes: {
        AppRoutes.LOGIN: (ctx) => LoginScreen(),
        AppRoutes.REGISTER: (ctx) => RegisterScreen(),
        AppRoutes.CHAT: (ctx) => chatScreen(),
      },
    );
  }
}
