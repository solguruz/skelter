import 'package:equatable/equatable.dart';

class LoginDetails extends Equatable {
  final String? uid;
  final String? token;
  final String? email;
  final String? phoneNumber;

  const LoginDetails({
    required this.uid,
    this.token,
    this.email,
    this.phoneNumber,
  });

  factory LoginDetails.fromJson(Map<String, dynamic> json) {
    return LoginDetails(
      uid: json['uid'],
      token: json['token'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'token': token,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  @override
  List<Object?> get props => [uid, token, email, phoneNumber];
}
