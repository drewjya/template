import 'dart:async';

import 'package:template/template.dart';

extension CacheFor<T> on AutoDisposeRef<T> {
  void cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, link.close);

    onDispose(timer.cancel);
  }
}
