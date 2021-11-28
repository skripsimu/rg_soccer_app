import 'package:equatable/equatable.dart';

import 'area.dart';

class Competitions extends Equatable {
  const Competitions({
    required this.id,
    required this.name,
    required this.area,
  });

  final int id;
  final String name;
  final Area area;

  @override
  List<Object> get props => [id, name, area];
}