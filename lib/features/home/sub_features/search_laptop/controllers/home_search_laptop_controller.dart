import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/laptop_model.dart';
import '../repositories/search_laptop_repository.dart';

class HomeSearchLaptopController extends GetxController {
  static HomeSearchLaptopController get to => Get.find();

  late final SearchLaptopRepository searchLaptopRepository;

  var query = ''.obs;
  final isSearching = 'idle'.obs;

  var searchResults = <LaptopModel>[].obs;

  final TextEditingController searchController = TextEditingController();
  final searchText = ''.obs;

  // Suggestions list
  var suggestions = [
    'MacBook Air',
    'Dell XPS',
    'HP Envy',
    'Asus ZenBook',
  ];

  @override
  void onInit() {
    super.onInit();
    searchLaptopRepository = SearchLaptopRepository();
  }

  /// Fungsi untuk search laptop on submit
  Future<void> searchOnSubmitted(String query) async {
    try {
      isSearching.value = 'loading';
      final results = await searchLaptopRepository.fetchSearchResults(query);
      searchResults.value = results;
      isSearching.value = 'success';
    } catch (e) {
      log('Error Failed to fetch search results: $e');
    }
  }

  /// Fungsi untuk search laptop realtime
  Future<void> searchOnChanged() async {
    try {
      isSearching.value = 'loading';
      final results =
          await searchLaptopRepository.fetchSearchResults(query.value);
      searchResults.value = results;
      isSearching.value = 'success';
    } catch (e) {
      log('Not found Laptop: $e');
    }
  }

  /// Fungsi untuk pencarian real-time
  void onQueryChanged(String newQuery) {
    query.value = newQuery;
    if (newQuery.isEmpty || newQuery == '') {
      // Kosongkan hasil jika query kosong
      searchResults.clear();
      return;
    }
    // Debounce untuk mengurangi permintaan API berlebihan
    debounce(query, (_) => searchOnChanged(), time: Duration(milliseconds: 500));
  }
}
