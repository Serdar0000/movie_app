import 'package:freezed_annotation/freezed_annotation.dart';

part 'crew_member_entity.freezed.dart';

@freezed
class CrewMemberEntity with _$CrewMemberEntity {
  const factory CrewMemberEntity({
    required int id,
    required String name,
    required String department,
    required String job,
    required String? profilePath,
  }) = _CrewMemberEntity;
}
