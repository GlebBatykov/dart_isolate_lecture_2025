import 'package:flutter/material.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

import 'di/scope_container.dart';
import 'di/scope_holder.dart';
import 'ui/app.dart';

void main() {
  final appScopeHolder = AppScopeHolder();

  appScopeHolder.create();

  runApp(ScopeProvider<AppScope>(
    holder: appScopeHolder,
    child: const App(),
  ));
}
