import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_quickstart/utils/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirectUser();
  }

  Future<void> _redirectUser() async {
    try {
      final session = await SupabaseAuth.instance.initialSession;
      if (session != null) {
        Navigator.of(context).pushReplacementNamed('/account');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    } catch (error) {
      // Error occured while recovering session, so redirect the user to the login page
      context.showErrorSnackBar(
          message: 'Error occured while refreshing session.');
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
