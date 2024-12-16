// lib/models/period_record_model.dart
class PeriodRecordModel {
  final String id;
  final DateTime startDate;
  final DateTime? endDate;
  final int flow;
  final List<String> symptoms;

  PeriodRecordModel({
    required this.id,
    required this.startDate,
    this.endDate,
    required this.flow,
    required this.symptoms,
  });

  factory PeriodRecordModel.fromMap(Map<String, dynamic> data, String id) {
    return PeriodRecordModel(
      id: id,
      startDate: data['startDate'].toDate(),
      endDate: data['endDate']?.toDate(),
      flow: data['flow'] ?? 1,
      symptoms: List<String>.from(data['symptoms'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'startDate': startDate,
      'endDate': endDate,
      'flow': flow,
      'symptoms': symptoms,
    };
  }
}
