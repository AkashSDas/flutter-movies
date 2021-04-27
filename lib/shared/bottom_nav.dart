import 'package:flutter/material.dart';
import 'package:flutter_movies/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNav extends StatefulWidget {
  /// Adding this field because the bottom navigation bar
  /// on changing routes doesn't update the icon and label
  /// colors, so by giving the selectedIndex field which will
  /// tell which icon and label to color as selected.
  ///
  /// Example for the problem
  /// If I'm in HomeScreen and the bottom nav colors the
  /// scroll icon, if I click to the player btn then it will
  /// go to the player screen but the bottom nav widget in
  /// player screen won't show player icon colored, parted of
  /// the reason is because they are different bottom navs.
  ///
  /// Don't try below options:
  /// Updating the selectedIndex when btn is clicked (useful when
  /// the bottom nav is same but here the bottom is changing)
  ///
  /// selectedIndex will tell which icon and label to show colored,
  /// depending which screen you are in and the icon and label
  /// representing that.
  final int selectedIndex;

  AppBottomNav(this.selectedIndex);

  @override
  _AppBottomNavState createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
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
        currentIndex: widget.selectedIndex,
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
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/player');
        break;
      case 2:
        // Navigator.pushNamed(context, '/pick-camera-images');
        break;
    }
  }
}
