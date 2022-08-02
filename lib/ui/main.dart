import 'dart:async';

import 'package:chuck_norris_joke/di/service_locator.dart';
import 'package:chuck_norris_joke/ui/home_screen.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  await setupLocator();
  return runZonedGuarded(() async {
    runApp(HomeScreen());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}
