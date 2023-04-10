import 'package:json_table/json_table.dart';

List<JsonTableColumn> get jsonTableColumnBuilderWithtime {
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
    // JsonTableColumn('orderId',
    //     defaultValue: null,
    //     label: "Order Details"),
  ];
}
