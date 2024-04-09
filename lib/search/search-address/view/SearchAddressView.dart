import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

class SearchAddressView extends StatefulWidget {
  @override
  State<SearchAddressView> createState() => _SearchAddressViewState();
}

class _SearchAddressViewState extends State<SearchAddressView> {
  TextEditingController _searchController = TextEditingController();
  List<String> cities = [];
  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    // Load city data asynchronously when the page is first loaded
    loadCities();
  }

  Future<void> loadCities() async {
    // Load the JSON file
    String citiesJson = await rootBundle.loadString('assets/json/city.json');
    Map<String, dynamic> citiesMap = json.decode(citiesJson);

    // Extract city names from the JSON map and convert them to strings
    cities = citiesMap.values.map((value) => value.toString()).toList();

    // Initialize filteredCities with all cities
    filteredCities.addAll(cities);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    border: Border.all(color: kGrey300Color)),
                width: 310.w,
                height: 45.h,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      width: 250.w,
                      child: TextField(
                        controller: _searchController,
                        // onChanged: (value) {
                        //   // Delay filtering to avoid frequent rebuilds
                        //   Future.delayed(Duration(milliseconds: 300), () {
                        //     filterCities(value);
                        //   });
                        // },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Search City',
                          hintStyle:
                              TextStyle(color: kGrey400Color, fontSize: 15.sp),
                          focusColor: kTextBlackColor,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        filterCities(_searchController.text);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: Icon(
                          Icons.search,
                          color: kGrey400Color,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildCityList(),
        ),
      ),
    );
  }

  void filterCities(String query) {
    setState(() {
      filteredCities = cities
          .where((city) => city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  List<Widget> _buildCityList() {
    return filteredCities.map((city) {
      return Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop(city);
            },
            child: Container(
              margin: EdgeInsets.only(left: 20.w, top: 10.h),
              width: 380.w,
              height: 45.h,
              child: Body1Text(city, kTextBlackColor),
            ),
          ),
          Container(
            width: 300.w,
            height: 1.h,
          )
        ],
      );
    }).toList();
  }
}
