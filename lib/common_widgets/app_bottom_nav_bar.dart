import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/gen/assets.gen.dart';
import 'package:swastha_ai/routes/paths.dart';

class AppBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const AppBottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            switch (index) {
              case 0:
                context.go(Paths.dashboard);
                break;
              case 1:
                context.go(Paths.journal);
                break;
              case 2:
                context.go(Paths.therapist);
                break;
              case 3:
                context.go(Paths.profile);
                break;
            }
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.home,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 0 ? AppColors.primary : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.journal,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 1 ? AppColors.primary : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Journal',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.therapist,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 2 ? AppColors.primary : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Therapist',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.profile,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 3 ? AppColors.primary : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
