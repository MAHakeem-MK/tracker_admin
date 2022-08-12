import 'dart:convert';

class UserLocation {
  late final String? userName;
  final String? userEmail;
  final DateTime? datetime;
  final String? latitude;
  final String? longitude;

  UserLocation({
    this.userName,
    this.userEmail,
    this.datetime,
    this.latitude,
    this.longitude,
  });

  factory UserLocation.fromMap(Map<dynamic, dynamic> map) {
    return UserLocation(
      userName: map['user_name'],
      userEmail: map['user_email'],
      datetime: DateTime.tryParse(map['time_stamp']),
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  factory UserLocation.fromJson(String source) =>
      UserLocation.fromMap(json.decode(source));
}
