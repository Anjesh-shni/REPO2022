import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        imageUrl,
      ];

  static List<Category> categories = [
    Category(
      name: "MainCourse",
      imageUrl: "images/maincourse.jpg",
    ),
    Category(
      name: "Apetizer",
      imageUrl: "images/appetizer.jpg",
    ),
    Category(
      name: "Drinks",
      imageUrl: "images/drinks.jpg",
    ),
    Category(
      name: "Salad",
      imageUrl: "images/salad.jpg",
    ),
    Category(
      name: "Vorspeisen",
      imageUrl: "images/Vorspeisen.jpg",
    ),
    Category(
      name: "Hauptegricht Steaks",
      imageUrl: "images/Hüftsteak.jpg",
    ),
    Category(
      name: "Acompanamientos Beilagen & Saucen",
      imageUrl: "images/Pfifferlingsauce.jpg",
    ),
    Category(
      name: "Arriba- Spezialitäten",
      imageUrl: "images/Pechugass.jpg",
    ),
    Category(
      name: "Faitajs",
      imageUrl: "images/Faitajs.jpg",
    ),
    Category(
      name: "Spezial Burger (125g.)",
      imageUrl: "images/specialburger.jpg",
    ),
    Category(
      name: "Gigant Burger (227g.)",
      imageUrl: "images/gigantburger.jpg",
    ),
    Category(
      name: "Pasta",
      imageUrl: "images/pasta.jpg",
    ),
    Category(
      name: "Pescado-Fischgerichte",
      imageUrl: "images/fish.jpg",
    ),
    Category(
      name: "Kinder-Menü",
      imageUrl: "images/kinder.jpg",
    ),
    Category(
      name: "Für den kleinen Hunger",
      imageUrl: "images/steak.jpg",
    ),
    Category(
      name: "Getränke-Hot Drinks",
      imageUrl: "images/hotdrinks.jpg",
    ),
    Category(
      name: "Long Drinks",
      imageUrl: "images/longdrink.jpg",
    ),
  ];
}
