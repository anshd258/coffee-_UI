import 'package:json_table/json_table.dart';

List<JsonTableColumn> get JsonTableColumnBuilder {
  return [
    JsonTableColumn(
      'createdDate',
      defaultValue: null,
      label: "Date",
      valueBuilder: (value) {
        final createddate = DateTime.parse(value);
        final utcTime = DateTime.utc(
            createddate.year,
            createddate.month,
            createddate.day,
            createddate.hour,
            createddate.minute,
            createddate.second);
        final localTime = utcTime.toLocal();
        return "${localTime.day}-${localTime.month}-${localTime.year.toString().substring(2)} ${localTime.hour.toString().padLeft(2, '0')}:${localTime.minute.toString().padLeft(2, '0')}";
      },
    ),
    JsonTableColumn('orderNo', defaultValue: null, valueBuilder: (value) {
      if (value == null || value == "null" || value == "") {
        return "No Data Available";
      }
      return value.toString();
    }, label: "Order No"),
    JsonTableColumn('userId.name', defaultValue: null, label: "Order By"),
    JsonTableColumn('currentState', defaultValue: null, label: "Order Status"),
    JsonTableColumn('next_state_est_time', defaultValue: null,
        valueBuilder: (value) {
      if (value == "" || value == null || value == "null") {
        return "No Data Available";
      }
      final time = DateTime.parse(value);
      final deliveryTime = DateTime.utc(
          time.year, time.month, time.day, time.hour, time.minute, time.second);
      final currentTime = DateTime.utc(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          DateTime.now().hour,
          DateTime.now().minute,
          DateTime.now().second);
      // final leftTime = deliveryTime.difference(currentTime).inMinutes;
      // if (leftTime < 0 || leftTime > 30) {
      //   return "Over Due";
      // } else {
      //   return (leftTime).toString();
      // }
      return deliveryTime.difference(currentTime).inSeconds > 0
          ? "${deliveryTime.hour}:${deliveryTime.minute}"
          : "Over Due";
    }, label: "Estimated Time"),
  ];
}
