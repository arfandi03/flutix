part of 'models.dart';

class FlutixTransaction extends Equatable {
  final String userID, title, subtitle, picture;
  final int amount;
  final DateTime time;

  FlutixTransaction(
      {@required this.userID,
      @required this.title,
      @required this.subtitle,
      this.amount = 0,
      @required this.time,
      this.picture});

  @override
  List<Object> get props => [userID, title, subtitle, amount, time, picture];
}
