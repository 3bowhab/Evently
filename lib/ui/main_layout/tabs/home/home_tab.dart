import 'package:evently/ui/main_layout/tabs/home/widgets/appbar_title.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/mode_changer.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/language_changer.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: AppbarTitle(),
        actions: [
          ModeChanger(),
          LanguageChanger(),
        ],
      ),
      body: Container(),
    );
  }
}
