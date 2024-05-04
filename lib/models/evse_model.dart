// class EVSE {
//   final String id;
//   final String status;
//   final String evseName;
//   final double latitude;
//   final double longitude;

//   EVSE({
//     required this.id,
//     required this.status,
//     required this.evseName,
//     required this.latitude,
//     required this.longitude,
//   });

//   factory EVSE.fromJson(Map<String, dynamic> json) {
//     return EVSE(
//       id: json['id'] as String,
//       status: json['status'] as String,
//       evseName: json['evse_name'] as String,
//       latitude: _toDouble(json['coordinates']['latitude']),
//       longitude: _toDouble(json['coordinates']['longitude']),
//     );
//   }

//   static double _toDouble(dynamic value) {
//     if (value is String) {
//       return double.parse(value);
//     } else if (value is int) {
//       return value.toDouble();
//     } else if (value is double) {
//       return value;
//     } else {
//       throw FormatException('Cannot convert $value to double');
//     }
//   }
// }

class EVSE {
  final String id;
  final String status;
  final String evseName;
  final double latitude;
  final double longitude;
  final String thumbnail;
  final int maxVoltage;
  final String evseid;

  EVSE( {
    required this.id,
    required this.status,
    required this.evseName,
    required this.latitude,
    required this.longitude,
    required this.thumbnail,
    required this.maxVoltage,
    required this.evseid,
  });

  factory EVSE.fromJson(Map<String, dynamic> json) {
    var connectors = json['connectors'] as List<dynamic>;
    String thumbnailUrl = connectors.isNotEmpty &&
            connectors[0]['images'] != null &&
            connectors[0]['images'].isNotEmpty
        ? connectors[0]['images'][0]['thumbnail']
        : 'https://via.placeholder.com/150';

    return EVSE(
      id: json['id'] as String,
      status: json['status'] as String,
      evseName: json['evse_name'] as String,
      latitude: _toDouble(json['coordinates']['latitude']),
      longitude: _toDouble(json['coordinates']['longitude']),
      thumbnail: json['images'].isNotEmpty
          ? json['images'][0]['thumbnail'] as String
          : 'https://via.placeholder.com/150',
      maxVoltage:
          connectors.isNotEmpty ? connectors[0]['max_voltage'] as int : 0,
      evseid: json['evse_group_id'] as String,
    );
  }

  static double _toDouble(dynamic value) {
    if (value is String) {
      return double.tryParse(value) ?? 0.0;
    } else if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    } else {
      throw FormatException('Cannot convert $value to double');
    }
  }
}
