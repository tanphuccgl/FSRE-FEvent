import 'package:intl/intl.dart';

class CalendarUtils {
  List<DateTime> getDaysInWeek(DateTime dateTime) {
    List<DateTime> days = [];
    int delta = dateTime.weekday - DateTime.monday;
    if (delta < 0) {
      delta += 7;
    }
    for (var i = 0; i < 7; i++) {
      var day = dateTime.subtract(Duration(days: delta - i));
      days.add(day);
    }

    return days;
  }

  String formatDaysInWeek(List<DateTime> days) {
    DateFormat dateFormat = DateFormat('d/M/yyyy', "vi_VN");
    String startDay = days.first.day.toString();
    String endDay = dateFormat.format(days.last);

    return '$startDay - $endDay';
  }

  String formatDate(DateTime date) {
    return DateFormat('E\nd', "vi_VN").format(date);
  }
}
