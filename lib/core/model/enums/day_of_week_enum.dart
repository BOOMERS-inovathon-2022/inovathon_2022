// ignore_for_file: constant_identifier_names

enum DayOfWeekEnum { SUN, MON, TUE, WED, THU, FRY, SAT }

extension DayOfWeekEnumExtension on DayOfWeekEnum {
  static const Map<DayOfWeekEnum, String> values = {
    DayOfWeekEnum.SUN: 'SUN',
    DayOfWeekEnum.MON: 'MON',
    DayOfWeekEnum.TUE: 'TUE',
    DayOfWeekEnum.WED: 'WED',
    DayOfWeekEnum.THU: 'THU',
    DayOfWeekEnum.FRY: 'FRY',
    DayOfWeekEnum.SAT: 'SAT',
  };

  static const Map<DayOfWeekEnum, String> descriptions = {
    DayOfWeekEnum.SUN: 'Domingo',
    DayOfWeekEnum.MON: 'Segunda-feira',
    DayOfWeekEnum.TUE: 'Terça-feira',
    DayOfWeekEnum.WED: 'Quarta-Feira',
    DayOfWeekEnum.THU: 'Quinta-feira',
    DayOfWeekEnum.FRY: 'Sexta-feira',
    DayOfWeekEnum.SAT: 'Sábado',
  };

  static const Map<DayOfWeekEnum, String> abbreviation = {
    DayOfWeekEnum.SUN: 'Dom',
    DayOfWeekEnum.MON: 'Seg',
    DayOfWeekEnum.TUE: 'Ter',
    DayOfWeekEnum.WED: 'Qua',
    DayOfWeekEnum.THU: 'Qui',
    DayOfWeekEnum.FRY: 'Sex',
    DayOfWeekEnum.SAT: 'Sáb',
  };

  String? get value => values[this];

  String? get description => descriptions[this];

  static DayOfWeekEnum? fromRaw(String raw) => values.entries.firstWhere((e) => e.value == raw).key;
}
