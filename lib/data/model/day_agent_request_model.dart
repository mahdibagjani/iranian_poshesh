import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_agent_request_model.g.dart';

@JsonSerializable()
class DayAgentRequestModel extends Equatable{
  final String tab;
  final int page;

  const DayAgentRequestModel({required this.page, required  this.tab,});

  factory DayAgentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DayAgentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$DayAgentRequestModelToJson(this);

  @override
  List<Object?> get props =>[tab,page];

}
