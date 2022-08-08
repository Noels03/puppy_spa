// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier%202.dart';
import 'package:intl/intl%202.dart';
import 'package:puppy_spa/models/note.dart';
import 'package:puppy_spa/ui/theme.dart';
import 'package:puppy_spa/ui/widgets/button.dart';
import 'package:puppy_spa/ui/widgets/input_field.dart';

class AppLogPage extends StatefulWidget {
  const AppLogPage({Key? key}) : super(key: key);

  @override
  State<AppLogPage> createState() => _AppLogPageState();
}

class _AppLogPageState extends State<AppLogPage> {
  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _serviceController = TextEditingController();
  final TextEditingController _dogSizeController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = '9:30 PM';
  String dropdownvalue = 'Select service';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Appointment Log",
                style: headingStyle,
              ),
              InputField(
                title: 'Pet Name',
                hint: ' ',
                controller: _petNameController,
              ),
              InputField(
                title: 'Owner Name',
                hint: ' ',
                controller: _ownerNameController,
              ),
              InputField(
                title: 'Type',
                hint: 'Breed of Dog',
                controller: _typeController,
              ),
              InputField(
                title: 'Date',
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: Icon(Icons.calendar_today_outlined),
                  color: Colors.grey,
                  onPressed: () {
                    print('hi there');
                    _getCalenderDate();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: "Appointment Time",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getAppTime(isStartTime: true);
                        },
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: InputField(
                      title: "Appointment End",
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getAppTime(isStartTime: false);
                        },
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InputField(
                title: "Service",
                hint: "Select service type",
                controller: _serviceController,
                widget: DropdownButton(
                    value: "Bath & Brush",
                    items: [
                      DropdownMenuItem(
                          child: Text('Bath & Brush'), value: 'Bath & Brush'),
                      DropdownMenuItem(
                          child: Text('Bath, Brush, & Trim'),
                          value: 'Bath, Brush & Trim'),
                      DropdownMenuItem(
                          child: Text('Full Grooming'), value: 'Full Grooming'),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    }),
              ),
              InputField(
                title: "Size of Dog",
                hint: "Select size",
                controller: _dogSizeController,
                widget: DropdownButton(
                    value: "Toy",
                    items: [
                      DropdownMenuItem(child: Text('Toy'), value: 'Toy'),
                      DropdownMenuItem(child: Text('Small'), value: 'Small'),
                      DropdownMenuItem(child: Text('Medium'), value: 'Medium'),
                      DropdownMenuItem(child: Text('Large'), value: 'Large'),
                      DropdownMenuItem(
                          child: Text('Extra Large'), value: 'Extra Large'),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    }),
              ),
              SizedBox(
                height: 18,
              ),
              InputField(
                title: 'Notes',
                hint: ' ',
                controller: _notesController,
              ),
              SizedBox(
                height: 18,
              ),
              AppLog(label: 'Create Appointment', onTap: () => _validateData()),
            ],
          ),
        ),
      ),
    );
  }

  _validateData() {
    if (_petNameController.text.isNotEmpty &&
        _ownerNameController.text.isNotEmpty) {
      // _addAppDB();
      Get.back();
    } else if (_petNameController.text.isEmpty ||
        _ownerNameController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        icon: Icon(Icons.warning_amber_rounded),
      );
    }
  }

  // _addAppDB() async {
  //   int value = await _taskController.addApp(
  //     task: Note(
  //       petName: _petNameController.text,
  //       ownerName: _ownerNameController.text,
  //       type: _typeController.text,
  //       date: DateFormat.yMd().format(_selectedDate),
  //       startTime: _startTime,
  //       endTime: _endTime,
  //       service: _serviceController.text,
  //       dogSize: _dogSizeController.text,
  //       notes: _notesController.text,
  //       isCompleted: 0,
  //     ),
  //   );
  //   print("My id is "+"$value");
  // }

  _appBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
        ),
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

  _getCalenderDate() async {
    DateTime? _pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));

    if (_pickDate != null) {
      setState(() {
        _selectedDate = _pickDate;
      });
    } else {
      print('nope');
    }
  }

  _getAppTime({required bool isStartTime}) async {
    var timePicked = await _showTimePicker();
    String _formatTime = timePicked.format(context);
    if (timePicked == null) {
      print('Time canceled');
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        ));
  }
}
