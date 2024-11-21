import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/home/sub_features/search_laptop/view/components/illustration_search_component.dart';
import 'package:lappyhub/features/home/sub_features/search_laptop/view/components/search_app_bar_component.dart';
import 'package:lappyhub/features/home/sub_features/search_laptop/view/components/search_laptop_list_component.dart';
import 'package:lappyhub/features/home/sub_features/search_laptop/view/components/search_not_found_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

import '../../../../constants/home_assets_constant.dart';
import '../../controllers/home_search_laptop_controller.dart';

class SearchLaptopScreen extends StatelessWidget {
  SearchLaptopScreen({Key? key}) : super(key: key);

  final assetsConstant = HomeAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      appBar: SearchAppBarComponent(
        searchController: HomeSearchLaptopController.to.searchController,
        hint: 'Cari Laptop...',
        icon: assetsConstant.searchIcon,
        onBackPressed: () => Get.back(),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            HomeSearchLaptopController.to.searchOnSubmitted(value);
          }
        },
      ),
      body: Obx(
        () {
          if (HomeSearchLaptopController.to.isSearching.value == 'loading') {
            return Center(
              child: CircularProgressIndicator(
                color: ColorStyle.primary,
              ),
            );
          }
          if (HomeSearchLaptopController.to.searchController.text.isEmpty &&
              HomeSearchLaptopController.to.searchResults.isEmpty) {
            return IllustrationSearchComponent(
              image: assetsConstant.illustrationSearchImage,
            );
          }
          if (HomeSearchLaptopController.to.searchResults.isEmpty) {
            return SearchNotFoundComponent(
              image: assetsConstant.searchNotFoundImage,
            );
          }
          return SearchLaptopListComponent(
            laptopList: HomeSearchLaptopController.to.searchResults,
          );
        },
      ),
    );
  }
}
