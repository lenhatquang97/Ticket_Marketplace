import 'package:flutter/material.dart';
import 'package:ticket_marketplace/provider/manage_page_screen.dart';
import 'package:ticket_marketplace/screens/authentication/welcome.dart';
import 'package:ticket_marketplace/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageChange()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.black,
            secondaryHeaderColor: const Color(0xff0057E9),
            fontFamily: GoogleFonts.shareTech().fontFamily),
        home: const WelcomeScreen(),
      ),
    );
  }
}
