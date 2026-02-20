import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_member_entity.freezed.dart';

@freezed
class CastMemberEntity with _$CastMemberEntity {
  const factory CastMemberEntity({
    required int id,
    required String name,
    required String? character,
    required String? profilePath,
    required int order,
  }) = _CastMemberEntity;
}
