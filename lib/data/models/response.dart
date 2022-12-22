import 'package:equatable/equatable.dart';

class Response extends Equatable {
  final String? message;
  final String? cod;
  const Response({this.message, this.cod});

  @override
  List<Object?> get props => [message, cod];

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        cod: json["cod"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
      };
}
