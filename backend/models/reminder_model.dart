// lib/models/reminder_model.dart
class ReminderModel {
  final String id;
  final String title;
  final String type;
  final DateTime date;
  final bool isActive;
  final String frequency;

  ReminderModel({
    required this.id,
    required this.title,
    required this.type,
    required this.date,
    required this.isActive,
    required this.frequency,
  });

  factory ReminderModel.fromMap(Map<String, dynamic> data, String id) {
    return ReminderModel(
      id: id,
      title: data['title'] ?? '',
      type: data['type'] ?? '',
      date: data['date'].toDate(),
      isActive: data['isActive'] ?? true,
      frequency: data['frequency'] ?? 'once',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'date': date,
      'isActive': isActive,
      'frequency': frequency,
    };
  }
}
