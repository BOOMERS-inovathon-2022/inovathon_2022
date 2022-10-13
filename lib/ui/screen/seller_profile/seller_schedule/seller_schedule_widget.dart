import 'package:flutter/material.dart';
import 'package:inovathon_2022/core/model/dao/product_checkout_dto.dart';
import 'package:inovathon_2022/core/model/dto/schedule_time_dto.dart';
import 'package:inovathon_2022/core/model/enums/day_of_week_enum.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/components/title_divider.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/seller_schedule/seller_schedule_page.dart';
import 'package:inovathon_2022/ui/shared/shared_button.dart';
import 'package:inovathon_2022/ui/shared/shared_counter.dart';
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
            height: 90,
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
        if (sellerTimes.indexWhere((element) => element.time.hour < 12) != -1)
          ...getPeriodDivider(
              "Manhã", sellerTimes.where((element) => element.time.hour < 12).toList()),
        if (sellerTimes
                .indexWhere((element) => element.time.hour >= 12 && element.time.hour < 18) !=
            -1)
          ...getPeriodDivider(
              "Tarde",
              sellerTimes
                  .where((element) => element.time.hour >= 12 && element.time.hour < 18)
                  .toList()),
        if (sellerTimes
                .indexWhere((element) => element.time.hour >= 18 && element.time.hour < 23) !=
            -1)
          ...getPeriodDivider(
              "Noite",
              sellerTimes
                  .where((element) => element.time.hour >= 18 && element.time.hour < 23)
                  .toList()),
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

  getHourTag(ScheduleTimeDTO timeDTO) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: kBackgroundGreyColor, borderRadius: BorderRadius.circular(20)),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              isDismissible: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              isScrollControlled: true,
              context: context,
              builder: (context) => FractionallySizedBox(
                heightFactor: 0.85,
                child: ProductCheckoutModal([
                  ProductCheckoutDTO(
                    id: "",
                    name: "Alface",
                    measure: "Uni",
                    quantityPerSale: 1,
                    photoUrl:
                        "https://img2.gratispng.com/20180601/osx/kisspng-romaine-lettuce-red-leaf-lettuce-leaf-vegetable-sp-5b11388a3572b5.0460181615278552422189.jpg",
                    isOrganic: true,
                    price: 4.0,
                  ),
                  ProductCheckoutDTO(
                    id: "",
                    name: "Batata",
                    measure: "Kg",
                    quantityPerSale: 1,
                    photoUrl:
                        "https://static1.conquistesuavida.com.br/ingredients/5/54/52/05/@/24682--ingredient_detail_ingredient-2.png",
                    isOrganic: true,
                    price: 12.0,
                  ),
                  ProductCheckoutDTO(
                    id: "",
                    name: "Leite",
                    measure: "L",
                    quantityPerSale: 1,
                    photoUrl:
                        "https://static.wikia.nocookie.net/fallout/images/1/1b/Empty_milk_bottle.png/revision/latest?cb=20151224125130",
                    isOrganic: true,
                    price: 4.0,
                  ),
                ]),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              to24hours(timeDTO.time),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }

  String to24hours(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, "0");
    final min = time.minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }

  getPeriodDivider(String dividerTitle, List<ScheduleTimeDTO> timesPeriods) {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 0),
        child: TitleDivider(
          title: dividerTitle,
          endDivider: 270,
        ),
      ),
      GridView.builder(
        itemCount: timesPeriods.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => getHourTag(timesPeriods[index]),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120, mainAxisExtent: 60, crossAxisSpacing: 5),
      ),
      const SizedBox(
        height: 10,
      )
    ];
  }
}

class ProductCheckoutModal extends StatefulWidget {
  ProductCheckoutModal(this.productList, {super.key});

  List<ProductCheckoutDTO> productList;

  @override
  State<ProductCheckoutModal> createState() => _ProductCheckoutModalState();
}

class _ProductCheckoutModalState extends State<ProductCheckoutModal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Finalizar Pedido",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        const Divider(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: widget.productList.length,
            itemBuilder: ((context, index) {
              var product = widget.productList[index];
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Row(
                      children: [
                        Image.network(
                          product.photoUrl,
                          fit: BoxFit.fill,
                          width: 150,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                product.isOrganic
                                    ? Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.lightGreen,
                                        ),
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          "Orgânico",
                                          style: TextStyle(
                                            color: Colors.green[900],
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            Text(
                              "${product.quantityPerSale}${product.measure}, R\$${product.price.toStringAsFixed(2)}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            SharedCounter(
                              counter: product.quantity,
                              onSubtract: () {
                                setState(() {
                                  if (product.quantity > 0) {
                                    product.quantity--;
                                  }
                                });
                              },
                              onAdd: () {
                                setState(() {
                                  product.quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(height: 5),
                  ),
                ],
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SharedButton(text: "Comprar", onClickAction: () => null),
        )
      ],
    );
  }
}
