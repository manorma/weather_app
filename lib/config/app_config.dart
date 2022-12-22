import 'package:common/common.dart';

enum Flavor {
  DEVELOPMENT,
  RELEASE,
}

class Config {
  static Flavor appFlavor = Flavor.DEVELOPMENT;

  static String get title {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return AppConstant.appName;
      case Flavor.DEVELOPMENT:
        return AppConstant.appNameDev;
    }
  }

  static bool get isDebug {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return false;
      case Flavor.DEVELOPMENT:
      default:
        return true;
    }
  }
}
