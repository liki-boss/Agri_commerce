import 'package:baskets_repository/src/entities/share_details_entity.dart';
import 'package:equatable/equatable.dart';

class ShareDetails extends Equatable {
  final Map<double, int> share;

  const ShareDetails({required this.share});

  @override
  List<Object?> get props => [share];

  @override
  String toString() => 'ShareDetails: { '
      'share: $share }';

  ShareDetails copyWith({Map<double, int>? share}) =>
      ShareDetails(share: share ?? this.share);

  ShareDetailsEntity toEntity() => ShareDetailsEntity(share);

  static ShareDetails fromEntity(ShareDetailsEntity entity) =>
      ShareDetails(share: entity.share);
}
