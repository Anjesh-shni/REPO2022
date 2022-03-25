

import 'package:equatable/equatable.dart';

class TablIndex extends Equatable  {
  final String title;
  final int id;

  const TablIndex({
    required this.title,
    required this.id,
  });

  @override
  List<Object?> get props => [
        title,
        id,
      ];

  static List<TablIndex> table_list = [
    TablIndex(
      title: "MainCourse",
      id: 1,
    ),
    TablIndex(
      title: "Apetizer",
      id:2,
    ),
    TablIndex(
      title: "Drinks",
      id: 3,
    ),
    TablIndex(
      title: "Salad",
      id: 4,
    ),
    TablIndex(
      title: "Vorspeisen",
      id: 5,
    ),
    TablIndex(
      title: "Hauptegricht Steaks",
      id:6,
    ),
    TablIndex(
      title: "Acompanamientos Beilagen & Saucen",
      id: 7,
    ),
    TablIndex(
      title: "Arriba- Spezialitäten",
      id:8,
    ),
    TablIndex(
      title: "Faitajs",
      id: 9,
    ),
    TablIndex(
      title: "Spezial Burger (125g.)",
      id: 10,
    ),
    TablIndex(
      title: "Gigant Burger (227g.)",
      id:11,
    ),
    TablIndex(
      title: "Pasta",
      id:12,
    ),
    TablIndex(
      title: "Pescado-Fischgerichte",
      id: 13,
    ),
    TablIndex(
      title: "Kinder-Menü",
      id:14,
    ),
    TablIndex(
      title: "Für den kleinen Hunger",
      id: 15,
    ),
    TablIndex(
      title: "Getränke-Hot Drinks",
      id: 16,
    ),
    TablIndex(
      title: "Long Drinks",
      id: 17,
    ),
  ];
}
