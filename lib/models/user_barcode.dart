import 'dart:convert';

class UserBarcode {
  late final String? userName;
  final String? userEmail;
  final DateTime? datetime;
  final String? barcode;

  UserBarcode({
    this.userName,
    this.userEmail,
    this.datetime,
    this.barcode,
  });

  factory UserBarcode.fromMap(Map<dynamic, dynamic> map) {
    return UserBarcode(
      userName: map['user_name'],
      userEmail: map['user_email'],
      datetime: DateTime.tryParse(map['time_stamp']),
      barcode: map['barcode'],
    );
  }

  factory UserBarcode.fromJson(String source) =>
      UserBarcode.fromMap(json.decode(source));
}
