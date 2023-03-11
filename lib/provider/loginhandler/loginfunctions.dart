import 'package:hive/hive.dart';
import 'package:inter_coffee/provider/loginhandler/loginmodel.dart';

class loginhandler {
  final box = Hive.box<loginStorage>('session');
  void storeData(loginStorage session) {
    box.put("session", session);
  }

  loginStorage? getData() {
    return box.get("session");
  }

  void deleteData() {
    final data = box.get("session");
    data!.delete();
  }

  String gettokken() {
    return box.get("session")!.token;
  }
}
