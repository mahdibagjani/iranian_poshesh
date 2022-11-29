// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_agent_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayAgentRequestModel _$DayAgentRequestModelFromJson(
        Map<String, dynamic> json) =>
    DayAgentRequestModel(
      page: json['page'] as int,
      tab: json['tab'] as String,
    );

Map<String, dynamic> _$DayAgentRequestModelToJson(
        DayAgentRequestModel instance) =>
    <String, dynamic>{
      'tab': instance.tab,
      'page': instance.page,
    };
