import '../../ui/ui.dart';

class CurrencyMoney {
  static const String _customPattern = '\u00a4 #,##0.00';

  static String get _locale {
    return 'pt_BR';
  }

  static String print(double? value) {
    return CurrencyTextInputFormatter(
            customPattern: _customPattern, locale: _locale, symbol: 'R\$')
        .format(value?.toStringAsFixed(2) ?? '');
  }

  static String initial(double? value) {
    return CurrencyTextInputFormatter(
      customPattern: _customPattern,
      locale: _locale,
    ).format(value?.toStringAsFixed(2) ?? '');
  }

  static CurrencyTextInputFormatter get formatter {
    return CurrencyTextInputFormatter(
      customPattern: _customPattern,
      locale: _locale,
    );
  }

  static String original(String value) {
    return CurrencyTextInputFormatter().format(value);
  }
}
