import 'package:intl/intl.dart';

abstract class DateTimeHelper {
  static String currentDate() {
    final today = DateTime.now();

    String formatted = DateFormat('EEEEE, MMMM dd').format(today);

    return formatted;
  }
}
