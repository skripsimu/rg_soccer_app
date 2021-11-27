import 'package:equatable/equatable.dart';

class Team extends Equatable {
  const Team({
    required this.id,
    required this.name,
    required this.crestUrl,
  });

  final int id;
  final String name;
  final String crestUrl;

  @override
  List<Object> get props => [id, name, crestUrl];
}
