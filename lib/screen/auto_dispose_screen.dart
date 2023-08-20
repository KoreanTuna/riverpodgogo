import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodgogo/layout/default_layout.dart';

import '../riverpod/auto_dispose_modifier_provider.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifierProvider);
    return DefaultLayout(
        title: "AutoDisposeModifierScreen",
        body: Center(
          child: state.when(
            data: (data) {
              return Text(data.toString());
            },
            error: (error, stackTrace) => Text("Error: $error"),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ));
  }
}
