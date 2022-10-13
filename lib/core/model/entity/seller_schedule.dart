import 'package:inovathon_2022/core/model/entity/time_interval.dart';
import 'package:inovathon_2022/core/model/entity/user_seller.dart';
import 'package:inovathon_2022/core/model/enums/day_of_week_enum.dart';

class SellerSchedule {
  late UserSeller userSeller;
  late TimeInterval workingTime;
  late List<TimeInterval> breakTimes;
  late DayOfWeekEnum dayOfWeek;
  late bool isTaken;

  SellerSchedule({
    required this.userSeller,
    required this.workingTime,
    required this.breakTimes,
    required this.dayOfWeek,
    required this.isTaken,
  });
}
