import 'package:hive/hive.dart';
part 'loginmodel.g.dart';

@HiveType(typeId: 0)
class loginStorage extends HiveObject {
  @HiveField(0)
  late String phonenumber;
  @HiveField(1)
  late String token;
  @HiveField(2)
  late String role;
  @HiveField(3)
  late String userId;
}
