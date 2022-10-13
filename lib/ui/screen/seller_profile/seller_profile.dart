import 'package:flutter/material.dart';
import 'package:inovathon_2022/core/model/entity/seller_schedule.dart';
import 'package:inovathon_2022/core/model/entity/time_interval.dart';
import 'package:inovathon_2022/core/model/entity/user_seller.dart';
import 'package:inovathon_2022/core/model/enums/day_of_week_enum.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/components/seller_tag.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/seller_details/seller_details_page.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/seller_schedule/seller_schedule_page.dart';

class SellerProfile extends StatefulWidget {
  final UserSeller? seller; // TODO - não pode ser null

  const SellerProfile({Key? key, required this.seller}) : super(key: key);

  @override
  State<SellerProfile> createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  List<SellerSchedule> schedules = [
    SellerSchedule(
        dayOfWeek: DayOfWeekEnum.MON,
        isTaken: false,
        userSeller: null,
        workingTime: TimeInterval(
            startTime: const TimeOfDay(hour: 9, minute: 0),
            endTime: const TimeOfDay(hour: 19, minute: 0)),
        deliveryMinutesCD: 30,
        breakTimes: [TimeInterval(
            startTime: const TimeOfDay(hour: 10, minute: 0),
            endTime: const TimeOfDay(hour: 13, minute: 0))])
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 110,
                    height: 110,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://i1.sndcdn.com/artworks-lq81iGn8UqOkdpTt-IawAKw-t500x500.jpg",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Manoel Gomes", // TODO - corrigir overflow
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                          ),
                          SizedBox(
                            width: 33,
                            // height: 20,
                            child: Image(
                              image: NetworkImage(
                                "https://cdn-icons-png.flaticon.com/512/7595/7595571.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          SellerTag(
                            tag: "Produtos Orgânicos",
                            color: Color.fromARGB(255, 145, 224, 127),
                          ),
                          SizedBox(width: 5),
                          SellerTag(
                            tag: "Blue Pen",
                            color: Color.fromARGB(255, 113, 151, 236),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            tabBar(),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [const SellerDetailsPage(), SellerSchedulePage(schedule: schedules)],
              ),
            ),

            // SizedBox(
            //   height: 40,
            // )
          ]),
        ),
      ),
    );
  }

  Widget tabBar() => TabBar(
        controller: _controller,
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Text("Sobre mim"),
          Text("Horários"),
        ],
      );
}
