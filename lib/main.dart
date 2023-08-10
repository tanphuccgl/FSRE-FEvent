import 'package:fevent/app.dart';
import 'package:fevent/locator.dart';

import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';

Future main() async {
  await ConfigApp.initializeApp();

  initializeDateFormatting('vi_VN', null).then((_) => runApp(const MyApp()));
}
