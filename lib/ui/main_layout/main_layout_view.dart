import 'package:evently/core/constants/app_images.dart';
import 'package:evently/core/constants/app_padding.dart';
import 'package:evently/core/responsive/responsive_config.dart';
import 'package:evently/ui/main_layout/tabs/favorite/favorite_tab.dart';
import 'package:evently/ui/main_layout/tabs/home/home_tab.dart';
import 'package:evently/ui/main_layout/tabs/profile/profile_tab.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  int currentIndex = 0;
  List<Widget> tabs = [HomeTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig.init(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, size: 32),
      ),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        child: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          destinations: [
            NavigationDestination(
              icon: ImageIcon(AssetImage(Assets.iconsHomeUnselected)),
              selectedIcon: ImageIcon(AssetImage(Assets.iconsHomeSelected)),
              label: AppLocalizations.of(context)!.home,
            ),

            NavigationDestination(
              icon: ImageIcon(AssetImage(Assets.iconsHeartUnselected)),
              selectedIcon: ImageIcon(AssetImage(Assets.iconsHeartSelected)),
              label: AppLocalizations.of(context)!.favorite,
            ),
            
            NavigationDestination(
              icon: ImageIcon(AssetImage(Assets.iconsUserUnselected)),
              selectedIcon: ImageIcon(AssetImage(Assets.iconsUserSelected)),
              label: AppLocalizations.of(context)!.profile,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(padding: AppPadding.view, child: tabs[currentIndex]),
      ),
    );
  }
}
