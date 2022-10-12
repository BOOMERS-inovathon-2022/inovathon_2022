import 'package:inovathon_2022/core/entity/time_interval.dart';
import 'package:inovathon_2022/core/entity/user_seller.dart';

class SellerSchedule {
  late UserSeller userSeller;

  late TimeInterval workingTime;
  late List<TimeInterval> breakTimes;
  late String dayOfWeek;
}
