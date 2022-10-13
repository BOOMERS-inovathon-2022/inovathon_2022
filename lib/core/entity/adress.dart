import 'city.dart';

class Adress {
  late String street;
  late String number;
  late String cep;
  late String district;
  late City city;

  Adress({
    required this.street,
    required this.number,
    required this.cep,
    required this.district,
    required this.city,
  });
}
