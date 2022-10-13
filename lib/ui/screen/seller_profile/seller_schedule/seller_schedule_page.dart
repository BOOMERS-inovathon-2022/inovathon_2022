import 'package:flutter/material.dart';
import 'package:inovathon_2022/core/model/entity/seller_schedule.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/seller_schedule/seller_schedule_widget.dart';

class SellerSchedulePage extends StatefulWidget {
  final List<SellerSchedule> schedule;

  const SellerSchedulePage({super.key, required this.schedule});

  @override
  State<SellerSchedulePage> createState() => SellerScheduleWidget();
}
