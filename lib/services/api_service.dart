import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import '../models/xray_report.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000/api';

  Future<List<XRayReport>> getReports() async {
    final response = await http.get(Uri.parse('$baseUrl/reports'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => XRayReport.fromJson(json)).toList();
    }
    throw Exception('Failed to load reports');
  }

  Future<XRayReport> uploadReport(XFile image, {String? patientId, String? description}) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/reports/upload'));

    request.files.add(
      await http.MultipartFile.fromPath('image', image.path),
    );

    if (patientId != null) request.fields['patientId'] = patientId;
    if (description != null) request.fields['description'] = description;

    final response = await request.send();
    final responseData = await response.stream.bytesToString();

    if (response.statusCode == 201) {
      return XRayReport.fromJson(json.decode(responseData));
    }
    throw Exception('Failed to upload report');
  }
}