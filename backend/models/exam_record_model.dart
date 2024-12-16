// lib/models/exam_record_model.dart
class ExamRecordModel {
  final String id;
  final DateTime date;
  final Map<String, String> symptoms;
  final String notes;

  ExamRecordModel({
    required this.id,
    required this.date,
    required this.symptoms,
    required this.notes,
  });

  factory ExamRecordModel.fromMap(Map<String, dynamic> data, String id) {
    return ExamRecordModel(
      id: id,
      date: data['date'].toDate(),
      symptoms: Map<String, String>.from(data['symptoms'] ?? {}),
      notes: data['notes'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'symptoms': symptoms,
      'notes': notes,
    };
  }
}
