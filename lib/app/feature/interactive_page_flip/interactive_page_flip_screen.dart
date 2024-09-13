import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/feature/interactive_page_flip/page_flip_builder.dart';
import 'package:flutter_ui_challenges/core/assets/interactive_page_flip_vectors.dart';
import 'package:flutter_ui_challenges/core/localization/string_hardcoded.dart';
import 'package:vector_graphics/vector_graphics.dart';

class InteractivePageFlipScreen extends StatelessWidget {
  const InteractivePageFlipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interactive Page Flip'.hardcoded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Use Center as layout has unconstrained width (loose constraints),
        // together with SizedBox to specify the max width (tight constraints)
        // See this thread for more info:
        // https://twitter.com/biz84/status/1445400059894542337
        child: Center(
          child: SizedBox(
            height: 600,
            width: 300, // max allowed width
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return PageFlipBuilder(
      key: pageFlipKey,
      frontBuilder: (_) => LightHomePage(
        onFlip: () => pageFlipKey.currentState?.flip(),
      ),
      backBuilder: (_) => DarkHomePage(
        onFlip: () => pageFlipKey.currentState?.flip(),
      ),
      onFlipComplete: (isFrontSide) => debugPrint('front: $isFrontSide'),
    );
  }
}

class LightHomePage extends StatelessWidget {
  const LightHomePage({super.key, this.onFlip});
  final VoidCallback? onFlip;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
          headlineSmall: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 5),
          ),
          child: Column(
            children: [
              const ProfileHeader(prompt: 'Hello,\nsunshine!'),
              const Spacer(),
              const VectorGraphic(
                loader: AssetBytesLoader(InteractivePageFlipVectors.forestDay),
                semanticsLabel: 'Forest',
                width: 300,
                height: 300,
              ),
              const Spacer(),
              BottomFlipIconButton(onFlip: onFlip),
            ],
          ),
        ),
      ),
    );
  }
}

class DarkHomePage extends StatelessWidget {
  const DarkHomePage({super.key, this.onFlip});
  final VoidCallback? onFlip;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headlineSmall: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 5),
          ),
          child: Column(
            children: [
              const ProfileHeader(prompt: 'Good night,\nsleep tight!'),
              const Spacer(),
              const VectorGraphic(
                loader:
                    AssetBytesLoader(InteractivePageFlipVectors.forestNight),
                semanticsLabel: 'Forest',
                width: 300,
                height: 300,
              ),
              const Spacer(),
              BottomFlipIconButton(onFlip: onFlip),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.prompt});
  final String prompt;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Row(
        children: [
          Text(prompt, style: Theme.of(context).textTheme.headlineSmall),
          const Spacer(),
          const VectorGraphic(
            loader: AssetBytesLoader(InteractivePageFlipVectors.man),
            semanticsLabel: 'Profile',
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}

class BottomFlipIconButton extends StatelessWidget {
  const BottomFlipIconButton({super.key, this.onFlip});

  final VoidCallback? onFlip;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onFlip,
          icon: const Icon(Icons.flip),
        ),
      ],
    );
  }
}
