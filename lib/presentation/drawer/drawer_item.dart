import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hacka_ubyfol/presentation/drawer/drawer_provider.dart';
import 'package:hacka_ubyfol/theme/colors.dart';
import 'package:hacka_ubyfol/theme/typography.dart';
import 'package:url_launcher/url_launcher.dart';

class GDDrawerItem extends StatelessWidget {
  final DrawerItem drawerItem;
  final bool isSelected;
  const GDDrawerItem({Key? key, required this.drawerItem, this.isSelected=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(drawerItem.externalNavigation!=null){
          _launchURL(drawerItem.externalNavigation!);

        }

      },
      child: Container(
        decoration: BoxDecoration(
            color: isSelected? UbyColors.background : UbyColors.white,
            border: isSelected? const Border(
                left: BorderSide(
                    width: 4, color: UbyColors.s1))
                : const Border(top: BorderSide.none)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(drawerItem.icon,
                      size: drawerItem.size??24),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8),
                    child: Text(
                      drawerItem.title,
                      style: UbyTypographyMedium.body_2
                          .copyWith(color: UbyColors.b200),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL(String navigationPath,
    {LaunchMode mode = LaunchMode.inAppBrowserView}) async {
  final uri = Uri.parse(navigationPath);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: mode);
  } else {
    throw 'Could not launch $navigationPath';
  }
}
