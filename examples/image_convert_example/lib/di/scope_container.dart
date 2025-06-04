import 'package:yx_scope/yx_scope.dart';

import '../data/state/image_page/image_items_state_holder.dart';
import '../data/state/image_page/usage_isolate_state_holder.dart';
import '../domain/managers/image_convert_manager.dart';
import '../domain/managers/image_page_manager.dart';
import '../domain/service/image_convert/image_convert_service.dart';

class AppScopeContainer extends _BaseAppScopeContainer {
  @override
  ImagePageManager get imagePageManager => _imageManagerDep.get;

  @override
  ImageItemsStateHolder get imageItemsStateHolder =>
      _imageItemsStateHolderDep.get;

  @override
  UsageIsolateStateHolder get usageIsolateStateHolder =>
      _usageIsolateStateHolderDep.get;

  @override
  List<Set<AsyncDep>> get initializeQueue => [
        {
          _imageConvertServiceDep,
          _imageItemsStateHolderDep,
          _usageIsolateStateHolderDep,
        },
      ];

  late final _imageManagerDep = dep(
    () => ImagePageManager(
      imageConvertService: _imageConvertServiceDep.get,
      imageItemsStateHolder: _imageItemsStateHolderDep.get,
      usageIsolateStateHolder: _usageIsolateStateHolderDep.get,
      imageConvertManager: _imageConvertManagerDep.get,
    ),
  );

  late final _imageConvertManagerDep = dep(
    () => const ImageConvertManager(),
  );

  late final _imageItemsStateHolderDep = rawAsyncDep(
    () => ImageItemsStateHolder(),
    init: (_) async {},
    dispose: (dep) async => dep.dispose(),
  );

  late final _imageConvertServiceDep = asyncDep(
    () => ImageConvertService(),
  );

  late final _usageIsolateStateHolderDep = rawAsyncDep(
    () => UsageIsolateStateHolder(),
    init: (_) async {},
    dispose: (dep) async => dep.dispose(),
  );
}

abstract interface class _BaseAppScopeContainer extends ScopeContainer
    implements AppScope {}

abstract interface class AppScope {
  ImagePageManager get imagePageManager;

  ImageItemsStateHolder get imageItemsStateHolder;

  UsageIsolateStateHolder get usageIsolateStateHolder;
}
