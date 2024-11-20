import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AnnonceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnnonceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          IconlyLight.arrow_left_2,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
