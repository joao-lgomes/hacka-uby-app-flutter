
import 'package:flutter/material.dart';
import 'package:hacka_ubyfol/presentation/drawer/drawer_item.dart';
import 'package:hacka_ubyfol/presentation/drawer/drawer_provider.dart';
import 'package:hacka_ubyfol/theme/colors.dart';
import 'package:hacka_ubyfol/theme/typography.dart';
import 'package:provider/provider.dart';

class UbyDrawer extends StatelessWidget {
  final int indexOfItemSelected;

  const UbyDrawer({Key? key, required this.indexOfItemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DrawerItem> drawerItems =
    Provider.of<DrawerProvider>(context, listen: false).drawerItems;
    return Drawer(
      elevation: 0,
      backgroundColor: UbyColors.white,
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.5,
                      color: UbyColors.g100,
                    ),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: UbyColors.black,
                        size: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "Voltar",
                          style: UbyTypographySemiBold.body_3
                              .copyWith(color: UbyColors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: drawerItems
                          .map((drawerItem) => GDDrawerItem(
                        drawerItem: drawerItem,
                        isSelected:
                        drawerItems.indexOf(drawerItem) ==
                            indexOfItemSelected,
                      ))
                          .toList(growable: false)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
