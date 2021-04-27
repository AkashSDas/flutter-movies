import 'package:flutter/material.dart';
import 'package:flutter_movies/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.11,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 4,
              color: Colors.black38,
            )
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Style.space,
          vertical: Style.space * 2,
        ),
        child: _buildBottomNav(context),
      );

  /// BUILDER FUNCTIONS
  Widget _buildBottomNav(BuildContext context) => BottomNavigationBar(
        items: _navItems(),
        onTap: (int idx) => _onTap(idx, context),
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Style.orange,
        unselectedItemColor: Style.textColor1,
        elevation: 0,
      );

  /// FUNCTIONS
  List<BottomNavigationBarItem> _navItems() => [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.scroll),
          label: 'Scroller',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.music),
          label: 'Player',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.search),
          label: 'Searcher',
        ),
      ];

  void _onTap(int idx, BuildContext context) async {
    switch (idx) {
      case 0:
        // do nothing since it's the default home screen
        break;
      case 1:
        // Navigator.pushNamed(context, '/pick-gallery-images');
        break;
      case 2:
        // Navigator.pushNamed(context, '/pick-camera-images');
        break;
    }
  }
}
