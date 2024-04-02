import 'package:intl/intl.dart';

extension MonthYearFormat on DateTime {
  String toMonthYearFormat() {
    return DateFormat('MMMM yyyy').format(this);
  }
}
