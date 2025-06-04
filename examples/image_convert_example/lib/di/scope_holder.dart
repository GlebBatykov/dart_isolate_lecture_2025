import 'package:yx_scope/yx_scope.dart';

import 'scope_container.dart';

class AppScopeHolder extends ScopeHolder<AppScopeContainer> {
  @override
  AppScopeContainer createContainer() => AppScopeContainer();
}
