import 'package:flutter/material.dart';

class NavKeys {
  static GlobalKey<NavigatorState> rootNavKey = GlobalKey();
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static GlobalKey<NavigatorState> homeNavKey = GlobalKey(
    debugLabel: 'homeNavKey',
  );
  static GlobalKey<NavigatorState> filmNavKey = GlobalKey(
    debugLabel: 'filmNavKey',
  );
  static GlobalKey<NavigatorState> profileNavKey = GlobalKey(
    debugLabel: 'profileNavKey',
  );
}
