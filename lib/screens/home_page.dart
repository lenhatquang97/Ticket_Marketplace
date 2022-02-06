import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ticket_marketplace/constants/constants.dart';
import 'package:ticket_marketplace/provider/connection_check.dart';
import 'package:ticket_marketplace/provider/manage_page_screen.dart';
import 'package:ticket_marketplace/screens/overview/overview_page.dart';
import 'package:ticket_marketplace/screens/profile/profile_page.dart';
import 'package:ticket_marketplace/screens/subtile/no_internet.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static final List<Widget> _widgetOptions = <Widget>[
    OverviewPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer2<PageChange, ConnectionCheck>(
        builder: (context, pageChange, connectionCheck, _) {
      if (!connectionCheck.isConnected) {
        return const NoInternet();
      }
      return Scaffold(
        body: _widgetOptions.elementAt(pageChange.currentPage),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: backgroundColor,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.ticketAlt),
              activeIcon: FaIcon(FontAwesomeIcons.ticketAlt),
              label: 'Tickets',
            )
          ],
          currentIndex: pageChange.currentPage,
          onTap: (val) {
            pageChange.currentPage = val;
          },
        ),
      );
    });
  }
}
