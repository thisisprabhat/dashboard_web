import 'package:admin_pannel_p1/animations/fade_in.dart';
import 'package:admin_pannel_p1/controllers/MenuController.dart';
import 'package:admin_pannel_p1/screens/dashboard/dashboard_screen.dart';
import 'package:admin_pannel_p1/screens/store/store.dart';
import 'package:admin_pannel_p1/screens/task/task_page.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CurrentPage extends StatelessWidget {
  const CurrentPage({super.key});

  Widget currentPage(BuildContext context) {
    final currentSelectedMenu =
        context.watch<MenuController>().selectedMenuItem;
    if (currentSelectedMenu == MenuItems.dashboard) {
      return const FadeIn(child: DashboardScreen());
    }
    if (currentSelectedMenu == MenuItems.store) {
      return const FadeIn(child: StorePage());
    }
    if (currentSelectedMenu == MenuItems.task) {
      return const FadeIn(
        child: TaskPage(),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return currentPage(context);
  }
}
