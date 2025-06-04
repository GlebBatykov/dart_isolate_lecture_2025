import 'package:flutter/material.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

import '../../../di/scope_container.dart';

class UseIsolateButton extends StatelessWidget {
  const UseIsolateButton({super.key});

  @override
  Widget build(BuildContext context) => ScopeBuilder<AppScope>.withPlaceholder(
        builder: (_, scope) {
          final stateHolder = scope.usageIsolateStateHolder;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Use isolate:',
                style: TextStyle(fontSize: 20),
              ),
              StreamBuilder(
                stream: stateHolder.stream.distinct(),
                initialData: stateHolder.getState(),
                builder: (_, snapshot) {
                  final value = snapshot.requireData;

                  return Checkbox(
                    value: value,
                    onChanged: (value) {
                      stateHolder.setState(value == true);
                    },
                  );
                },
              ),
            ],
          );
        },
      );
}
