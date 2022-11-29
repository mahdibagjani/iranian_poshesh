import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/day_agent_response_entity.dart';

part 'day_agent_response_model.g.dart';

@JsonSerializable()
class DayAgentResponseModel extends DayAgentResponseEntity {
  DayAgentResponseModel({
    required this.current,
    required this.pageCount,
    required this.pageSize,
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  }) : super(
          current: current,
          pageCount: pageCount,
          pageSize: pageSize,
          count: count,
          next: next,
          previous: previous,
          results: results,
        );

  final int current;
  @JsonKey(name: 'page_count')
  final int pageCount;
  @JsonKey(name: 'page_size')
  final int pageSize;
  final int count;
  final String next;
  final String? previous;
  final List<ResultModel> results;

  factory DayAgentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DayAgentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DayAgentResponseModelToJson(this);
}

@JsonSerializable()
class ResultModel extends Result {
  ResultModel({
    required this.id,
    required this.orderId,
    required this.fileType,
    required this.visitLocation,
    required this.applicantUserFullName,
    required this.applicantUserPhoneNumber,
    required this.creatorUserType,
    required this.healthCertificateUpload,
    required this.visitDate,
    required this.visitTime,
    required this.status,
  }) : super(
          id: id,
          orderId: orderId,
          fileType: fileType,
          visitLocation: visitLocation,
          applicantUserFullName: applicantUserFullName,
          applicantUserPhoneNumber: applicantUserPhoneNumber,
          creatorUserType: creatorUserType,
          healthCertificateUpload: healthCertificateUpload,
          visitDate: visitDate,
          visitTime: visitTime,
          status: status,
        );

  final int id;
  @JsonKey(name: 'order_id')
  final String orderId;
  @JsonKey(name: 'file_type')
  final String fileType;
  @JsonKey(name: 'visit_location')
  final String visitLocation;
  @JsonKey(name: 'applicant_user_full_name')
  final String applicantUserFullName;
  @JsonKey(name: 'applicant_user_phone_number')
  final String applicantUserPhoneNumber;
  @JsonKey(name: 'creator_user_type')
  final String creatorUserType;
  @JsonKey(name: 'health_certificate_upload')
  final bool healthCertificateUpload;
  @JsonKey(name: 'visit_date')
  final String visitDate;
  @JsonKey(name: 'visit_time')
  final String visitTime;
  final String status;

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}
