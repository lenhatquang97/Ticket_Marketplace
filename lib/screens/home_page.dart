import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ticket_marketplace/constants/constants.dart';
import 'package:ticket_marketplace/provider/manage_page_screen.dart';
import 'package:ticket_marketplace/screens/more/more_page.dart';
import 'package:ticket_marketplace/screens/overview/overview_page.dart';
import 'package:ticket_marketplace/screens/profile/profile_page.dart';
import 'package:ticket_marketplace/screens/search/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const List<Widget> _widgetOptions = <Widget>[
    OverviewPage(),
    SearchPage(),
    ProfilePage(),
    MorePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<PageChange>(
      builder: (context, pageChange, _) => Scaffold(
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
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.ticketAlt),
              activeIcon: FaIcon(FontAwesomeIcons.ticketAlt),
              label: 'Tickets',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_outlined),
              activeIcon: Icon(Icons.menu),
              label: 'More',
            )
          ],
          currentIndex: pageChange.currentPage,
          onTap: (val) {
            pageChange.currentPage = val;
          },
        ),
      ),
    );
  }
}
