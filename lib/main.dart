import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodgogo/riverpod/provider_ovservers.dart';
import 'package:riverpodgogo/screen/home_screen.dart';

void main() {
  runApp(ProviderScope(
    observers: [
      Logger(),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  ));
}
