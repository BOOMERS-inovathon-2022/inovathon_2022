import 'city.dart';

class Address {
  late String? id;
  late String street;
  late String number;
  late String cep;
  late String district;
  late City city;

  Address({
    this.id,
    required this.street,
    required this.number,
    required this.cep,
    required this.district,
    required this.city,
  });
}
