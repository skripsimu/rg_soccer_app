import 'package:equatable/equatable.dart';

class Area extends Equatable {
  const Area({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.ensignUrl,
  });

  final int id;
  final String name;
  final String countryCode;
  final String ensignUrl;

  @override
  List<Object> get props => [id, name, countryCode, ensignUrl];
}
