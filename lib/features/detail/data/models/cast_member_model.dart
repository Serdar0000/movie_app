import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_member_model.freezed.dart';

@freezed
class CastMemberModel with _$CastMemberModel {
  const factory CastMemberModel({
    required int id,
    required String name,
    required String? character,
    required String? profilePath,
    required int order,
  }) = _CastMemberModel;

  factory CastMemberModel.fromJson(Map<String, dynamic> json) {
    return CastMemberModel(
      id: json['id'] as int,
      name: json['name'] as String,
      character: json['character'] as String?,
      profilePath: json['profile_path'] as String?,
      order: json['order'] as int? ?? 0,
    );
  }
}
