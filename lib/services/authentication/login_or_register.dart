import 'package:flutter/material.dart';
import 'package:login_register_ui/pages/login_page.dart';
import 'package:login_register_ui/pages/register_page.dart';

class ShowLoginOrRegisterPage extends StatefulWidget {
  const ShowLoginOrRegisterPage({super.key});

  @override
  State<ShowLoginOrRegisterPage> createState() =>
      _ShowLoginOrRegisterPageState();
}

class _ShowLoginOrRegisterPageState extends State<ShowLoginOrRegisterPage> {
  bool showLogin = true;
  void togglePage() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return  LoginPage(changePage: togglePage,);
    } else {
      return  RegisterPage(changePage: togglePage,);
    }
  }
}
