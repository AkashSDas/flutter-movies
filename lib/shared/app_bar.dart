import 'package:flutter/material.dart';
import 'package:flutter_movies/style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(95);

  @override
  Widget build(BuildContext context) => _buildWrapper(context);

  /// Build functions

  Widget _buildWrapper(BuildContext context) => Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: Style.space,
          vertical: Style.space * 2,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2), blurRadius: 1, color: Colors.black38)
          ],
        ),
        child: _buildAppBar(context),
      );

  Widget _buildAppBar(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text('Flutter \n Movies', style: Style.logoTextStyle)],
      );
}
