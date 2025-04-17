import 'package:ecom/common/common_styles.dart';

import 'package:ecom/common/widgets/layout/brandsGridView.dart';
import 'package:ecom/common/widgets/layout/category_view.dart';
import 'package:ecom/common/widgets/layout/gridView.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/features/shop/screens/widgets/tabBar.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: JAppBar(
          title: Text('Store'),
          showBackArrow: false,
          actions: [JCartCounterWidget(counter: 5, iconColor: Colors.black)],
        ),

        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(JSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: JSizes.defaultSpace),
                      //search button
                      JsearchWidget(
                        searchBackgroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        onTap: () {},
                      ),
                      SizedBox(height: JSizes.spacebtwnItems),
                      //section Heading
                      JsectionHeader(
                        sectionHeader: 'Featured Brands',
                        onPressed: () {},
                        hasSectionButton: true,
                        padding: EdgeInsets.zero,
                      ),

                      SizedBox(height: JSizes.spacebtwnItems),
                      //brand listing
                      JGridViewLayout(
                        mainAxisExtent: 72,
                        itemCount: 4,
                        itemBuilder:
                            (_, index) => JbrandsContainer(
                              brandName: 'NIKE',
                              onTap: () {},
                              brandImage: JImagesPath.glassesImage,
                              hasBorder: false,
                            ),
                      ),
                    ],
                  ),
                ),

                //Tab Bar
                bottom: JTabBar(),
              ),
            ];
          },
          body: TabBarView(
            children: [
              JCategoryView(),
              JCategoryView(),
              JCategoryView(),
              JCategoryView(),
              JCategoryView(),
              JCategoryView(),
              JCategoryView(),
              JCategoryView(),
            ],
          ),
        ),
      ),
    );
  }
}
