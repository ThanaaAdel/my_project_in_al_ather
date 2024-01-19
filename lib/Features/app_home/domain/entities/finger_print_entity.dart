import 'package:hive/hive.dart';

part 'finger_print_entity.g.dart';

@HiveType(typeId: 2)
class FingerPrintEntity {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final String timeIn;
  @HiveField(2)
  final String timeOut;
  @HiveField(3)
  final int hours;
  @HiveField(4)
  final int minutes;

  FingerPrintEntity(
      {required this.date,
      required this.timeIn,
      required this.timeOut,
      required this.hours,
      required this.minutes});
}
