import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:inovathon_2022/core/model/entity/seller_schedule.dart';
import 'package:inovathon_2022/core/model/entity/time_interval.dart';
import 'package:inovathon_2022/core/model/entity/user_seller.dart';
import 'package:inovathon_2022/core/model/enums/day_of_week_enum.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/components/seller_tag.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/seller_details/seller_details_page.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/seller_schedule/seller_schedule_page.dart';
import 'package:inovathon_2022/ui/theme/colors.dart';

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
        endTime: const TimeOfDay(hour: 20, minute: 0),
      ),
      deliveryMinutesCD: 50,
      breakTimes: [
        TimeInterval(
          startTime: const TimeOfDay(hour: 10, minute: 0),
          endTime: const TimeOfDay(hour: 13, minute: 0),
        )
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Perfil do Produtor',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
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
                              "Manoel Gomes",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
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
                          ],
                        ),
                        RatingBar.builder(
                          initialRating: 4,
                          ignoreGestures: true,
                          minRating: 1,
                          itemSize: 25,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: kStarRatingColor,
                          ),
                          onRatingUpdate: (rating) => 0,
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
            ],
          ),
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
