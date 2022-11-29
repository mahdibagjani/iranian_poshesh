// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_agent_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayAgentResponseModel _$DayAgentResponseModelFromJson(
        Map<String, dynamic> json) =>
    DayAgentResponseModel(
      current: json['current'] as int,
      pageCount: json['page_count'] as int,
      pageSize: json['page_size'] as int,
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayAgentResponseModelToJson(
        DayAgentResponseModel instance) =>
    <String, dynamic>{
      'current': instance.current,
      'page_count': instance.pageCount,
      'page_size': instance.pageSize,
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      id: json['id'] as int,
      orderId: json['order_id'] as String,
      fileType: json['file_type'] as String,
      visitLocation: json['visit_location'] as String,
      applicantUserFullName: json['applicant_user_full_name'] as String,
      applicantUserPhoneNumber: json['applicant_user_phone_number'] as String,
      creatorUserType: json['creator_user_type'] as String,
      healthCertificateUpload: json['health_certificate_upload'] as bool,
      visitDate: json['visit_date'] as String,
      visitTime: json['visit_time'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'file_type': instance.fileType,
      'visit_location': instance.visitLocation,
      'applicant_user_full_name': instance.applicantUserFullName,
      'applicant_user_phone_number': instance.applicantUserPhoneNumber,
      'creator_user_type': instance.creatorUserType,
      'health_certificate_upload': instance.healthCertificateUpload,
      'visit_date': instance.visitDate,
      'visit_time': instance.visitTime,
      'status': instance.status,
    };
