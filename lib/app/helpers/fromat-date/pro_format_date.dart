import 'package:intl/intl.dart';

String proFormatOnlyDate(dynamic dateToFormate) {
  final formatter = DateFormat('dd/MM/yyyy');

  if (dateToFormate.runtimeType != DateTime) {
    final dateAdjust = dateToFormate.toString().isEmpty
        ? DateTime.now().toString()
        : dateToFormate;
    return formatter.format(DateTime.parse(dateAdjust));
  } else {
    return formatter.format(dateToFormate);
  }
}

String proFormatDateAndHour(dynamic dateToFormate) {
  final formatter = DateFormat('d/MM/yyyy hh:mm:ss');

  if (dateToFormate.runtimeType != DateTime) {
    final dateAdjust = dateToFormate.toString().isEmpty
        ? DateTime.now().toString()
        : dateToFormate;
    return formatter.format(DateTime.parse(dateAdjust));
  } else {
    return formatter.format(dateToFormate);
  }
}

DateTime proFirstTimeOfDay(DateTime date) {
  final dateAdjustes = DateTime(date.year, date.month, date.day);

  return dateAdjustes;
}

DateTime proLastTimeOfDay(DateTime date) {
  final dateAdjustes = DateTime(date.year, date.month, date.day);

  return dateAdjustes
      .add(const Duration(days: 1))
      .subtract(const Duration(milliseconds: 1));
}
