import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodgogo/layout/default_layout.dart';

import '../riverpod/family_modifier_provider.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(familyModifierProvider(3));
    return DefaultLayout(
      title: "FamilyModifierScreen",
      body: Center(
        child: Text(
          state.when(
            data: (data) => data.toString(),
            loading: () => "Loading...",
            error: (error, stackTrace) => "Error: $error",
          ),
        ),
      ),
    );
  }
}
