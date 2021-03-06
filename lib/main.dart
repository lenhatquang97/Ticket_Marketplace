import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_marketplace/constants/constants.dart';
import 'package:ticket_marketplace/provider/connection_check.dart';
import 'package:ticket_marketplace/provider/manage_page_screen.dart';
import 'package:ticket_marketplace/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:ticket_marketplace/utils/color_func.dart';
import 'package:ticket_marketplace/utils/user_storage.dart';

import 'screens/welcome/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final flag =
      await SecureStorage.readSecureData(SecureStorage.privateKeyHashed);
  runApp(MyApp(
    flag: flag,
  ));
}

class MyApp extends StatelessWidget {
  String? flag;
  MyApp({Key? key, this.flag}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageChange()),
        ChangeNotifierProvider(create: (_) => ConnectionCheck()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            backgroundColor: backgroundColor,
            scaffoldBackgroundColor: backgroundColor,
            textTheme: ThemeData.dark()
                .textTheme
                .apply(fontFamily: GoogleFonts.lato().fontFamily),
            primaryTextTheme: ThemeData.dark()
                .textTheme
                .apply(fontFamily: GoogleFonts.lato().fontFamily),
            primaryColor: backgroundColor,
            primarySwatch: buildMaterialColor(blueCustom),
            fontFamily: GoogleFonts.lato().fontFamily),
        home: (flag != null) ? const HomePage() : const WelcomeScreen(),
      ),
    );
  }
}
//flag != null is right
