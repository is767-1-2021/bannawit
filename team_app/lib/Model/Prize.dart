import 'package:flutter/cupertino.dart';

class CheckPrize extends ChangeNotifier {
  List<Prize>? _checkPrize;
  get checkPrize => this._checkPrize;

 set checkPrize( value) => {this._checkPrize = value, notifyListeners()};
}
class Prize {
  final String prizeName;
  final List<String> numbers;
  const Prize({
    Key? key,
    required this.prizeName,
    required this.numbers,
  });
}