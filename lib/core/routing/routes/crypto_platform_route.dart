import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/screens/crypto_platform_screen/crypto_platform_screen.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/screens/crypto_widget_list_screen/crypto_widget_list_screen.dart';
import 'package:flutter_ui_challenges/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

enum CryptoPlatformRoute {
  cryptoWidgetList('crypto_widget_list', 'Crypto Widget List'),
  ;

  const CryptoPlatformRoute(this.path, this.title);

  final String path;
  final String title;
}

final cryptoPlatformRoute = GoRoute(
  path: AppRoute.cryptoPlatform.path,
  name: AppRoute.cryptoPlatform.name,
  builder: (_, __) => const CryptoPlatformScreen(),
  routes: [
    GoRoute(
      path: CryptoPlatformRoute.cryptoWidgetList.path,
      name: CryptoPlatformRoute.cryptoWidgetList.name,
      builder: (_, __) => const CryptoWidgetListScreen(),
    ),
  ],
);
