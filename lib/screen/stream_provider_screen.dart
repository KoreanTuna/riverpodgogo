import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodgogo/riverpod/stream_provider.dart';

import '../layout/default_layout.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(muiltipleStreamProvider);
    return DefaultLayout(
      title: "FutureProviderScreen",
      body: Center(
          child: state.when(
        data: (data) {
          return Text(data.toString());
        },
        error: (err, stack) => Text(err.toString()),
        loading: () => CircularProgressIndicator(),
      )),
    );
  }
}
