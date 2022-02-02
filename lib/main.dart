import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_marketplace/provider/manage_page_screen.dart';
import 'package:ticket_marketplace/screens/authentication/welcome.dart';
import 'package:ticket_marketplace/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:ticket_marketplace/utils/color_func.dart';
import 'package:bip39/bip39.dart' as bip39;

Future<void> main() async {
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
              backgroundColor: const Color(0xff101018),
              scaffoldBackgroundColor: const Color(0xff101018),
              textTheme: Typography(platform: TargetPlatform.android).white,
              primaryColor: const Color(0xff101018),
              primarySwatch: buildMaterialColor(const Color(0xff0049e4)),
              fontFamily: GoogleFonts.shareTech().fontFamily),
          home: const WelcomeScreen()),
    );
  }
}
