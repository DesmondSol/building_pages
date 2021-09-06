import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject{
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  int phoneNo;

  @HiveField(4)
  String qrCode;

  Transaction(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNo,
      required this.qrCode});
}
