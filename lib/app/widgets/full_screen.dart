import 'package:flutter/services.dart';

fullScreenToggle(isPortrait) {
  if (isPortrait) {
    // ignore: deprecated_member_use
    SystemChrome.setEnabledSystemUIOverlays([]);
  } else {
    // ignore: deprecated_member_use
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
}
