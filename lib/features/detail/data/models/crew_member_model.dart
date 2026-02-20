import 'package:freezed_annotation/freezed_annotation.dart';

part 'crew_member_model.freezed.dart';

@freezed
class CrewMemberModel with _$CrewMemberModel {
  const factory CrewMemberModel({
    required int id,
    required String name,
    required String department,
    required String job,
    required String? profilePath,
  }) = _CrewMemberModel;

  factory CrewMemberModel.fromJson(Map<String, dynamic> json) {
    return CrewMemberModel(
      id: json['id'] as int,
      name: json['name'] as String,
      department: json['department'] as String? ?? '',
      job: json['job'] as String? ?? '',
      profilePath: json['profile_path'] as String?,
    );
  }
}
