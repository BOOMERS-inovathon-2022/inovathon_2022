import 'package:flutter/material.dart';
import 'package:inovathon_2022/core/model/dto/schedule_time_dto.dart';
import 'package:inovathon_2022/core/model/enums/day_of_week_enum.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/seller_schedule/seller_schedule_page.dart';
import 'package:inovathon_2022/ui/theme/colors.dart';

class SellerScheduleWidget extends State<SellerSchedulePage> {
  List<ScheduleTimeDTO> sellerTimes = [];

  @override
  void initState() {
    generateTimes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SizedBox(
            height: 85,
            child: ListView.builder(
              itemCount: DayOfWeekEnum.values.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => getDayOfWeek(DayOfWeekEnum.values[index]),
            ),
          ),
        ),
        const Divider(
          thickness: 1,
          color: Colors.black,
        ),
      ],
    );
  }

  generateTimes() {
    for (var element in widget.schedule) {
      var endTime = element.workingTime.endTime;
      var tempTime = element.workingTime.startTime;

      while (timeToDouble(endTime) > timeToDouble(tempTime)) {
        sellerTimes.add(ScheduleTimeDTO(time: tempTime, isAvailable: true));
        tempTime = TimeOfDay.fromDateTime(DateTime(0, 0, 0, tempTime.hour, tempTime.minute)
            .add(Duration(minutes: element.deliveryMinutesCD)));
      }

      for (var breakTime in element.breakTimes) {
        var breakEnd = breakTime.endTime;
        var breakTemp = breakTime.startTime;
        while (timeToDouble(breakEnd) > timeToDouble(breakTemp)) {
          breakTemp = TimeOfDay.fromDateTime(
              DateTime(0, 0, 0, breakTemp.hour, breakTemp.minute).add(const Duration(minutes: 1)));
          sellerTimes.removeWhere(
              (sellerTime) => timeToDouble(sellerTime.time) == timeToDouble(breakTemp));
        }
      }
    }
  }

  double timeToDouble(TimeOfDay myTime) => myTime.hour + (myTime.minute / 60.0);

  getDayOfWeek(DayOfWeekEnum dayOfWeek) {
    bool isInList = widget.schedule.indexWhere((element) => element.dayOfWeek == dayOfWeek) != (-1);

    return Container(
      width: 75,
      margin: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: kBackgroundGreyColor, borderRadius: BorderRadius.circular(10)),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        child: InkWell(
          onTap: isInList ? () {} : null,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Text(
                dayOfWeek.abbreviation!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: isInList ? Colors.black : Colors.grey),
              ),
              Text("01/10",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: isInList ? Colors.black : Colors.grey))
            ]),
          ),
        ),
      ),
    );
  }
}
