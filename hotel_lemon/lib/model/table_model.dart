import 'package:equatable/equatable.dart';

class Tableid extends Equatable {
  final String name;
  final int id;

  const Tableid({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  static const List<Tableid> tablee = [
    Tableid(
      id: 1,
      name: "Table 1",
    ),
    Tableid(
      id: 2,
      name: "Table 2",
    ),
    Tableid(
      id: 3,
      name: "Table 3",
    ),
    Tableid(
      id: 4,
      name: "Table 4",
    ),
    Tableid(
      id: 5,
      name: "Table 5",
    ),
    Tableid(
      id: 6,
      name: "Table 6",
    ),
    Tableid(
      id: 7,
      name: "Table 7",
    ),
    Tableid(
      id: 8,
      name: "Table 8",
    ),
    Tableid(
      id: 9,
      name: "Table 9",
    ),
    Tableid(
      id: 10,
      name: "Table 10",
    ),
    Tableid(
      id: 11,
      name: "Table 11",
    ),
    Tableid(
      id: 12,
      name: "Table 12",
    ),
    Tableid(
      id: 13,
      name: "Table 13",
    ),
    Tableid(
      id: 14,
      name: "Table 14",
    ),
    Tableid(
      id: 15,
      name: "Table 15",
    ),
    Tableid(
      id: 16,
      name: "Table 16",
    ),
    Tableid(
      id: 17,
      name: "Table 17",
    ),
    Tableid(
      id: 18,
      name: "Table 18",
    ),
    Tableid(
      id: 19,
      name: "Table 19",
    ),
    Tableid(
      id: 20,
      name: "Table 20",
    ),
  ];
}
