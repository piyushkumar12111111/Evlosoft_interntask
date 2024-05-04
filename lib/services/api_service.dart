import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/evse_model.dart';

class ApiService {
  Future<List<EVSE>> fetchEVSEs() async {
    final response = await http.get(Uri.parse('https://mocki.io/v1/15e7d96d-199c-4397-adc7-78bc7ff96a19'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<EVSE> evseList = body.map((dynamic item) => EVSE.fromJson(item)).toList();
      return evseList;
    } else {
      throw Exception('Failed to load EVSE data');
    }
  }
}
