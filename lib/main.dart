import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_flutter_guide/pages/account_page.dart';
import 'package:supabase_flutter_guide/pages/login_page.dart';
import 'package:supabase_flutter_guide/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    // TODO: Replace credentials with your own
    url: 'https://dbcbbaiqjhiotqgvxits.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyNDc0MTAyNCwiZXhwIjoxOTQwMzE3MDI0fQ.ZUOgvILUoIoAcOTIfCkApJ19jR3HxZv9SZlswjSv0L4',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.green,
          ),
        ),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/account': (_) => const AccountPage(),
      },
    );
  }
}
