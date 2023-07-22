import 'package:fevent/app.dart';
import 'package:fevent/locator.dart';

import 'package:flutter/material.dart';

Future main() async {
  await ConfigApp.initializeApp();
  runApp(const MyApp());
}
