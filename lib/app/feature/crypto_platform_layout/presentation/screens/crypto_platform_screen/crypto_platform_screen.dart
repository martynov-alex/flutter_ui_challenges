import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/core/routing/routes/crypto_platform_route.dart';
import 'package:go_router/go_router.dart';

/// Основной экран Crypto Platform.
class CryptoPlatformScreen extends StatelessWidget {
  const CryptoPlatformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Platform'),
        actions: [
          IconButton(
            icon: const Icon(Icons.widgets),
            onPressed: () =>
                context.goNamed(CryptoPlatformRoute.cryptoWidgetList.name),
          ),
        ],
      ),
      body: const Center(child: Text('Crypto Platform Screen')),
    );
  }
}
