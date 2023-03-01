import 'package:admin_pannel_p1/controllers/MenuController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    required this.title,
    this.color = Colors.white54,
    required this.svgImage,
    required this.menuItems,
  }) : super(key: key);

  final String title;
  final String svgImage;
  final Color color;
  final MenuItems menuItems;

  @override
  Widget build(BuildContext context) {
    bool isMenuSelected =
        context.watch<MenuController>().selectedMenuItem == menuItems;
    return ListTile(
      onTap: () => context.read<MenuController>().setMenuItem = menuItems,
      leading: SvgPicture.asset(
        svgImage,
        color: isMenuSelected ? Colors.white : color,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: isMenuSelected ? Colors.white : color,
            fontSize: isMenuSelected ? 18 : 14),
      ),
    );
  }
}
