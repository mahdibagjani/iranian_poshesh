import 'package:equatable/equatable.dart';

class DayAgentResponseEntity extends Equatable {
  DayAgentResponseEntity({
    required this.current,
    required this.pageCount,
    required this.pageSize,
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int current;
  final int pageCount;
  final int pageSize;
  final int count;
  final String? next;
  final String? previous;
  final List<Result> results;

  @override
  List<Object?> get props => [current,
pageCount,
pageSize,
count,
next,
previous,
results,];
}

class Result extends Equatable {
  Result({
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
  });

  final int id;
  final String orderId;
  final String fileType;
  final String visitLocation;
  final String applicantUserFullName;
  final String applicantUserPhoneNumber;
  final String creatorUserType;
  final bool healthCertificateUpload;
  final String visitDate;
  final String visitTime;
  final String status;

  @override
  List<Object?> get props => [
        id,
        orderId,
        fileType,
        visitLocation,
        applicantUserFullName,
        applicantUserPhoneNumber,
        creatorUserType,
        healthCertificateUpload,
        visitDate,
        visitTime,
        status,
      ];
}
