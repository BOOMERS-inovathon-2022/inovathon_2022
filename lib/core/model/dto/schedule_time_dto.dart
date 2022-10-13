import 'package:flutter/material.dart';

class ScheduleTimeDTO {
  TimeOfDay time;
  bool isAvailable;

  ScheduleTimeDTO({required this.time, required this.isAvailable});
}
