// ignore_for_file: implementation_imports, unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter, unused_import, prefer_equal_for_default_values

import 'dart:js';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget%202.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:puppy_spa/models/note.dart';
import 'package:puppy_spa/services/theme_services.dart';
import 'package:puppy_spa/ui/app_log_page.dart';
import 'package:puppy_spa/ui/theme.dart';
import 'package:puppy_spa/ui/widgets/button.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  get style => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addAppLog(),
          _addDatePicker(),
           _showWaitList(),
        //  _bottomNavigationBar(),
        ],
      ),
    );
  }

  _showWaitList() {
    return Container(
        width: 100,
        height: 50,
        color: Colors.green,
        margin: const EdgeInsets.only(bottom: 10));
  }

  _addDatePicker() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 15),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: mainClr,
        dateTextStyle: GoogleFonts.vollkorn(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        dayTextStyle: GoogleFonts.vollkorn(
            textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        )),
        monthTextStyle: GoogleFonts.vollkorn(
            textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        )),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _addAppLog() {
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  'Today',
                  style: headingStyle,
                )
              ],
            ),
          ),
          AppLog(
              label: 'Appointment Log',
              onTap: () async {
                await Get.to(() => AppLogPage());
              }),
        ]));
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
        },
        child: Icon(Icons.nightlight_round, size: 20),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("images/dog.png"),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}


  // BottomNavigationBar:
  //     backgroundColor: Colors.blueGrey,
  //     unselectedItemColor: Colors.white.withOpacity(0.7),
  //     selectedItemColor: Colors.white,
  //       items: [
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.pets),
  //         label: 'Waiting List',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.chrome_reader_mode, size: 28),
  //         label: 'Previous Clients',
  //       ),
  //       ]
  //   );
  // }
