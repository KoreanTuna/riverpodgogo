import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodgogo/layout/default_layout.dart';

import '../riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));
    print("build");
    return DefaultLayout(
        title: "CodeGenerationScreen",
        body: Center(
          child: Column(
            children: [
              Text("state 1 : $state1"),
              state2.when(
                data: (data) {
                  return Text(
                    data.toString(),
                    textAlign: TextAlign.center,
                  );
                },
                error: (err, stack) => Text(err.toString()),
                loading: () => Center(child: CircularProgressIndicator()),
              ),
              state3.when(
                data: (data) {
                  return Text(
                    data.toString(),
                    textAlign: TextAlign.center,
                  );
                },
                error: (err, stack) => Text(err.toString()),
                loading: () => Center(child: CircularProgressIndicator()),
              ),
              Text('State4: $state4'),
              Consumer(
                builder: (context, ref, child) {
                  final state5 = ref.watch(gStateNotifierProvider);

                  return Row(
                    children: [
                      Text("State5: $state5"),
                      if (child != null) child,
                    ],
                  );
                },
                child: Row(
                  children: [Text("Hello")],
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ref.read(gStateNotifierProvider.notifier).increment();
                      },
                      child: Text("Increment")),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(gStateNotifierProvider.notifier).decrement();
                    },
                    child: Text("Decrement"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.invalidate(gStateNotifierProvider);
                    },
                    child: Text("Invalidate"),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
