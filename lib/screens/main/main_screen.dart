import 'package:admin_pannel_p1/controllers/MenuController.dart';
import 'package:admin_pannel_p1/helper/page_changer.dart';
import 'package:admin_pannel_p1/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../responsive.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      key: context.read<MenuController>().scaffoldKey,
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenu(),
              ),
            const Expanded(
              flex: 5,
              child: CurrentPage(),
            ),
          ],
        ),
      ),
    );
  }
}
