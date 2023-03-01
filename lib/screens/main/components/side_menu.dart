import 'package:admin_pannel_p1/controllers/MenuController.dart';
import 'package:flutter/material.dart';

import 'side_menu_items.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(children: [
          DrawerHeader(
            child: Image.asset('assets/images/logo.png'),
          ),
          const DrawerTile(
            title: "Dashbord",
            color: Colors.white54,
            svgImage: "assets/icons/menu_dashbord.svg",
            menuItems: MenuItems.dashboard,
          ),
          const DrawerTile(
            title: "Transaction",
            svgImage: "assets/icons/menu_tran.svg",
            menuItems: MenuItems.transaction,
          ),
          const DrawerTile(
            title: "Task",
            svgImage: "assets/icons/menu_task.svg",
            menuItems: MenuItems.task,
          ),
          const DrawerTile(
            title: "Documents",
            svgImage: "assets/icons/menu_doc.svg",
            menuItems: MenuItems.documents,
          ),
          const DrawerTile(
            title: "Store",
            svgImage: "assets/icons/menu_store.svg",
            menuItems: MenuItems.store,
          ),
          const DrawerTile(
            title: "Notification",
            svgImage: "assets/icons/menu_notification.svg",
            menuItems: MenuItems.notification,
          ),
          const DrawerTile(
            title: "Profile",
            svgImage: "assets/icons/menu_profile.svg",
            menuItems: MenuItems.profile,
          ),
          const DrawerTile(
            title: "Settings",
            svgImage: "assets/icons/menu_setting.svg",
            menuItems: MenuItems.settings,
          )
        ]),
      ),
    );
  }
}
