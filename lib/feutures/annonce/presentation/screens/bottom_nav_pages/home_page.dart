import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/app_text_constants/text_string.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/device_utils.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/feutures/annonce/presentation/blocs/category_blocs/show_more_cubit.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/annonce/annonce_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isActive = true;
  @override
  void initState() {
    toggleBoolWithDelay();
    super.initState();
  }

  void toggleBoolWithDelay() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isActive = false;
      });
      print(
          "isActive is now $isActive");
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        children: [
          _categoriesSection(context, isdark),
          _section(context, "categories.Sponsorisé".tr(context)),
          _section(context, "categories.Entreprises en vedette".tr(context)),
          _section(context, "categories.Nouvelles annonces".tr(context)),
        ],
      ),
    );
  }

//--------[Categories Items Grid]------------//
  Widget _categoriesSection(BuildContext context, bool isdark) {
    return Padding(
      padding: EdgeInsets.all(context.setMinSize(16)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: context.setMinSize(400), // Adjust this height as needed
        ),
        child: BlocBuilder<ShowMoreCubit, bool>(
          builder: (context, showAll) {
            final items = getListOfCategories(context);
            final displayItems = showAll ? items : items.take(7).toList();

            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: displayItems.length + 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: DeviceUtils.valueDecider<int>(
                  context,
                  onMobile: 4,
                  others: 5,
                ),
                mainAxisSpacing: context.setMinSize(10),
                crossAxisSpacing: context.setMinSize(10),
              ),
              itemBuilder: (context, index) {
                if (index < displayItems.length) {
                  return _categoryItem(
                      context,
                      getListOfCategoriesIcons()[index],
                      displayItems[index],
                      isdark);
                } else {
                  return TextButton(
                    onPressed: () =>
                        context.read<ShowMoreCubit>().toggleShowAll(),
                    child: Text(
                      showAll
                          ? "Home_screen.showLess".tr(context)
                          : "Home_screen.showMore".tr(context),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: context.setSp(10),
                          fontWeight: FontWeight.bold,
                          color: isdark ? whileColor80 : blueColor),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

//--------[Category Item widget]------------//
  Widget _categoryItem(
      BuildContext context, String path, String name, bool isdark) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(
            context.setMinSize(15),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isdark ? whileColor10 : whileColor80.withOpacity(0.2),
          ),
          child: SvgPicture.asset(
            path,
            color: isdark ? lightGreyColor.withOpacity(0.8) : blueColor,
            height: context.setMinSize(25),
          ),
        ),
        SizedBox(
          height: context.setMinSize(4),
        ),
        Expanded(
          child: Text(
            name,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: context.setSp(10),
                color: isdark ? whileColor80 : whileColor60),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

//--------[The Other Sections]------------//
  Widget _section(BuildContext context, String sectionName) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.setMinSize(15),
        right: context.setMinSize(15),
        bottom: context.setMinSize(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$sectionName:",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: context.setMinSize(5)),
          Skeletonizer(
            enabled: isActive,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.all(8.0),
                child: AnnonceCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
