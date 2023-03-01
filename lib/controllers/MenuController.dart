import 'package:flutter/material.dart';

enum MenuItems {
  dashboard,
  transaction,
  task,
  documents,
  store,
  notification,
  profile,
  settings
}

class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  MenuItems _selectedMenuItem = MenuItems.store;

  get selectedMenuItem => _selectedMenuItem;
  set setMenuItem(MenuItems item) {
    _selectedMenuItem = item;
    notifyListeners();
  }

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void toggleDrawer() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState?.openDrawer();
    }
  }
}
