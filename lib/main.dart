import 'package:crack_and_tell/app/app.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.initDependencies();
  runApp(CrackAndTell());
}