import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/datamodel.dart';

ValueNotifier<List<studentmodel>> studentListNotifier = ValueNotifier([]);



void addstudent(studentmodel value){
  studentListNotifier.value.add(value);
  studentListNotifier. notifyListeners();
}