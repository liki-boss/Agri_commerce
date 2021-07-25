import 'package:equatable/equatable.dart';

class ShareDetailsEntity extends Equatable {
  final Map<double, int> share;

  const ShareDetailsEntity(this.share);

  @override
  List<Object?> get props => [share];

  @override
  String toString() => 'ShareDetailsEntity: { share: $share }';

  static ShareDetailsEntity fromShareMap(Map shareMap) =>
      ShareDetailsEntity(shareMap
          .map((weight, quantity) => MapEntry(double.parse(weight), quantity)));

  Map<String, Object> toShareMap() =>
      share.map((weight, quantity) => MapEntry(weight.toString(), quantity));
}
