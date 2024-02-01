import 'package:intl/intl.dart';

class DateTimeUtils {
  String dateModifier({required String date, bool needTimeFormat = false}) {
    return needTimeFormat
        ? DateFormat('E,MMMM d,y').add_jm().format(DateTime.parse(date))
        : DateFormat.yMMMMd('en_US').format(DateTime.parse(date));
  }

  String removeTimeFromDataTime({required DateTime date}) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  String mmddyyyyDateFormat({required DateTime date}) {
    return DateFormat('MM-dd-yyyy').format(date);
  }
}
