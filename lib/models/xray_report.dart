class XRayReport {
  final String id;
  final String imageUrl;
  final String date;
  final String? patientId;
  final String? description;

  XRayReport({
    required this.id,
    required this.imageUrl,
    required this.date,
    this.patientId,
    this.description,
  });

  factory XRayReport.fromJson(Map<String, dynamic> json) {
    return XRayReport(
      id: json['_id'],
      imageUrl: json['imageUrl'],
      date: json['date'],
      patientId: json['patientId'],
      description: json['description'],
    );
  }
}