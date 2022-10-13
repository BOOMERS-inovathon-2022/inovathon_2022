import 'package:inovathon_2022/core/model/entity/time_interval.dart';
import 'package:inovathon_2022/core/model/entity/user_seller.dart';
import 'package:inovathon_2022/core/model/enums/day_of_week_enum.dart';

class SellerSchedule {
  late UserSeller? userSeller; // TODO - não pode ser null
  late TimeInterval workingTime;
  late List<TimeInterval> breakTimes;
  late DayOfWeekEnum dayOfWeek;
  late bool isTaken;
  late int deliveryMinutesCD;

  SellerSchedule({
    this.userSeller, // TODO - não pode ser null
    required this.workingTime,
    required this.breakTimes,
    required this.dayOfWeek,
    required this.isTaken,
    required this.deliveryMinutesCD,
  });
}
