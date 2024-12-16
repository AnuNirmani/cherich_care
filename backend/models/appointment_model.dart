// lib/models/appointment_model.dart
class AppointmentModel {
  final String id;
  final String doctorId;
  final String doctorName;
  final DateTime date;
  final String status;
  final String hospitalName;

  AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.date,
    required this.status,
    required this.hospitalName,
  });

  factory AppointmentModel.fromMap(Map<String, dynamic> data, String id) {
    return AppointmentModel(
      id: id,
      doctorId: data['doctorId'] ?? '',
      doctorName: data['doctorName'] ?? '',
      date: data['date'].toDate(),
      status: data['status'] ?? 'pending',
      hospitalName: data['hospitalName'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'doctorId': doctorId,
      'doctorName': doctorName,
      'date': date,
      'status': status,
      'hospitalName': hospitalName,
    };
  }
}
