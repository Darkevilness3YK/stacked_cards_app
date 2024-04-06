import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_cards_app/pages/contact_list_page.dart';
import 'package:stacked_cards_app/widgets/theme/default_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme(),
      home: const ContactListPage(),
    );
  }
}
