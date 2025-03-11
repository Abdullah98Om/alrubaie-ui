// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:alrubaie/utility/app_info.dart';

// import 'resturantAppInfo.dart';

String convertDate({required Timestamp timestamp, bool longTime = false}) {
  DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
  if (longTime) {
    String date =
        "${dateTime.year}-${dateTime.month}-${dateTime.day} , ${dateTime.hour % 12}:${dateTime.minute} ${dateTime.hour > 12 ? 'pm' : 'am'}";
    return date;
  } else {
    String date = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    return date;
  }
}

String convertDateTime({required DateTime dateTime, bool longTime = false}) {
  if (longTime) {
    String date =
        "${dateTime.year}-${dateTime.month}-${dateTime.day} , ${dateTime.hour % 12}:${dateTime.minute} ${dateTime.hour > 12 ? 'pm' : 'am'}";
    return date;
  } else {
    String date = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    return date;
  }
}

String convertPrice(int price) {
  switch (price) {
    case < 1000:
      return "$price $currency";

    default:
      String formattedNumber = NumberFormat('#,###').format(price);

      return "$formattedNumber $currency";
  }
}
