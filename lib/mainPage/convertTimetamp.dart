import 'package:intl/intl.dart';

String ConvertTimeTamp(int time){
  final timestamp = time;
  final DateTime date2 = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formattedDate = DateFormat('kk:mm').format(date2);
  return formattedDate;
}