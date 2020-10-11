import 'package:intl/intl.dart';

class DevUtils {
  static String getFormatedDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String getDay({DateTime date, bool short = true}) {
    String weekDay;
    switch (DateFormat(DateFormat.WEEKDAY).format(date)) {
      case 'Sunday':
        weekDay = short ? 'Dom' : 'Domingo';
        break;
      case 'Monday':
        weekDay = short ? 'Seg' : 'Segunda-feira';
        break;
      case 'Tuesday':
        weekDay = short ? 'Ter' : 'Terça-feira';
        break;
      case 'Wednesday':
        weekDay = short ? 'Qua' : 'Quarta-feira';
        break;
      case 'Thursday':
        weekDay = short ? 'Qui' : 'Quinta-feira';
        break;
      case 'Friday':
        weekDay = short ? 'Sex' : 'Sexta-feira';
        break;
      case 'Saturday':
        weekDay = short ? 'Sab' : 'Sábado';
        break;
      default:
        weekDay = 'Hoje';
    }
    return weekDay;
  }
}
