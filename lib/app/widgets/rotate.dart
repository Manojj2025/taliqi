import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';

rotate(isPortrait) {
  if (isPortrait) {
    Wakelock.enable();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  } else {
    Wakelock.disable();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }
}
