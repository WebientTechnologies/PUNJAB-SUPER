import 'dart:io';

bool isRunningOnMobile() {
  if (Platform.isAndroid || Platform.isIOS) {
    return true; // Running on mobile app (Android or iOS)
  } else {
    return false; // Running on desktop application
  }
}
