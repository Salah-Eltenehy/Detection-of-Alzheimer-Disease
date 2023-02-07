import 'package:flutter/material.dart';

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/Constants.dart';
import '../../shared/functions/shared_function.dart';
import '../../shared/network/local/cache_helper.dart';
import '../SignIn/SignIn.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String searchValue = '';
  final List<String> _suggestions = [
    'youssef',
    'Salah',
    'Asmaa',
    'kholoud',
    'Donia',
    'Mustafa'
  ];

  Future<List<String>> _fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return _suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search workers',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: EasySearchBar(
            title: const Text('Alzheimer'),
            onSearch: (value) => setState(() => searchValue = value),
            actions: [
            ],
            // asyncSuggestions: (value) async => await _fetchSuggestions(value)
        ),
      ),
    );
  }
}
