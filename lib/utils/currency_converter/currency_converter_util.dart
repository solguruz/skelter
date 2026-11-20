import 'package:skelter/utils/currency_converter/domain/usecases/get_exchange_rate.dart';

/// A utility class for currency conversion.
///
/// This class provides methods to convert currency values using the remote API.
class CurrencyConverterUtil {
  const CurrencyConverterUtil(this._getExchangeRate);

  final GetExchangeRate _getExchangeRate;

  /// Converts [amount] from [fromCurrency] to [toCurrency].
  ///
  /// [amount] is the value to convert.
  /// [fromCurrency] is the currency code of the amount (e.g., 'USD').
  /// [toCurrency] is the target currency code (e.g., 'INR').
  ///
  /// Returns the converted amount as `double`.
  /// Returns `0.0` if conversion fails or an error occurs.
  ///
  /// Example:
  /// ```dart
  /// final converted = await currencyConverterUtil.convert(
  ///   amount: 100,
  ///   fromCurrency: "USD",
  ///   toCurrency: "INR",
  /// );
  /// ```
  Future<double> convert({
    required num amount,
    required String fromCurrency,
    required String toCurrency,
  }) async {
    if (fromCurrency == toCurrency) return amount.toDouble();

    try {
      final result = await _getExchangeRate(
        ExchangeRateParams(fromCurrency: fromCurrency, toCurrency: toCurrency),
      );

      return await result.fold((failure) => 0.0, (rate) {
        final exchangeRate = rate.rates[toCurrency];
        if (exchangeRate == null) {
          return 0.0;
        }
        return amount * exchangeRate;
      });
    } catch (_) {
      return 0.0;
    }
  }
}
