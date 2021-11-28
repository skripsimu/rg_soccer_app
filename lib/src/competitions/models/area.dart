import 'package:equatable/equatable.dart';

class Area extends Equatable {
  const Area({
    required this.name,
    required this.ensignUrl,
  });

  final String name;
  final String ensignUrl;

  @override
  List<Object> get props => [name, ensignUrl];
}
