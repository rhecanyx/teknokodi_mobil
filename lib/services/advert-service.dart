import 'package:firebase_admob/firebase_admob.dart';
import 'dart:io' show Platform;

class AdvertService {
  static final AdvertService _instance = AdvertService._internal();
  factory AdvertService() => _instance;
  MobileAdTargetingInfo _targetingInfo;
  final String _bannerAd = Platform.isAndroid ? 'ca-app-pub-1416813895909014/1881033086' : 'ca-app-pub-1416813895909014/1881033086';
  AdvertService._internal() {
    _targetingInfo = MobileAdTargetingInfo();
  }

  showBanner() {
    BannerAd banner = BannerAd(
        adUnitId: _bannerAd,
        size: AdSize.smartBanner,
        targetingInfo: _targetingInfo
    );

    banner
        ..load()
        ..show();

    banner.dispose();
  }
}

