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
      imageUrl: "imagess/maincourse.jpg",
    ),
    Category(
      name: "Apetizer",
      imageUrl: "imagess/appetizer.jpg",
    ),
    Category(
      name: "Drinks",
      imageUrl: "imagess/drinks.jpg",
    ),
    Category(
      name: "Salad",
      imageUrl: "imagess/salad.jpg",
    ),
    Category(
      name: "Vorspeisen",
      imageUrl: "imagess/Vorspeisen.jpg",
    ),
    Category(
      name: "Hauptegricht Steaks",
      imageUrl: "imagess/Hüftsteak.jpg",
    ),
    Category(
      name: "Acompanamientos Beilagen & Saucen",
      imageUrl: "imagess/Pfifferlingsauce.jpg",
    ),
    Category(
      name: "Arriba- Spezialitäten",
      imageUrl: "imagess/Pechugass.jpg",
    ),
    Category(
      name: "Faitajs",
      imageUrl: "imagess/Faitajs.jpg",
    ),
    Category(
      name: "Spezial Burger (125g.)",
      imageUrl: "imagess/specialburger.jpg",
    ),
    Category(
      name: "Gigant Burger (227g.)",
      imageUrl: "imagess/gigantburger.jpg",
    ),
    Category(
      name: "Pasta",
      imageUrl: "imagess/pasta.jpg",
    ),
    Category(
      name: "Pescado-Fischgerichte",
      imageUrl: "imagess/fish.jpg",
    ),
    Category(
      name: "Kinder-Menü",
      imageUrl: "imagess/kinder.jpg",
    ),
    Category(
      name: "Für den kleinen Hunger",
      imageUrl: "imagess/steak.jpg",
    ),
    Category(
      name: "Getränke-Hot Drinks",
      imageUrl: "imagess/hotdrinks.jpg",
    ),
    Category(
      name: "Long Drinks",
      imageUrl: "imagess/longdrink.jpg",
    ),
  ];

  // static List<Category> categories = [
  //   Category(
  //     name: "Tea & Coffe",
  //     imageUrl: "images/tea&coffe.jpg",
  //   ),
  //   Category(
  //     name: "BreakFast",
  //     imageUrl: "images/Breakfast.jpg",
  //   ),
  //   Category(
  //     name: "Liquors",
  //     imageUrl: "images/liquors.jpg",
  //   ),
  //   Category(
  //     name: "Salad",
  //     imageUrl: "images/saladd.jpg",
  //   ),
  //   Category(
  //     name: "Mo:Mo",
  //     imageUrl: "images/momo.jpg",
  //   ),
  //   Category(
  //     name: "Fried Rice",
  //     imageUrl: "images/friedrice.jpg",
  //   ),
  //   Category(
  //     name: "Vegeterian Snacks",
  //     imageUrl: "images/vegsnacks.jpg",
  //   ),
  //   Category(
  //     name: "Non-Veg Snacks",
  //     imageUrl: "images/nonvegcurry.jpg",
  //   ),
  //   Category(
  //     name: "Mutton Non-Veg Special",
  //     imageUrl: "images/mutton.jpg",
  //   ),
  //   Category(
  //     name: "Special Chicken",
  //     imageUrl: "images/chickenn.jpg",
  //   ),
  //   Category(
  //     name: "Tandori Special",
  //     imageUrl: "images/tandori.jpg",
  //   ),
  //   Category(
  //     name: "Sekuwa & Poleko",
  //     imageUrl: "images/sekuwa.jpg",
  //   ),
  //   Category(
  //     name: "Fish Items",
  //     imageUrl: "images/fish.jpg",
  //   ),
  //   Category(
  //     name: "Biryani & pulaw",
  //     imageUrl: "images/biryanii.jpg",
  //   ),
  //   Category(
  //     name: "Thakali set",
  //     imageUrl: "images/thakali.jpg",
  //   ),
  //   Category(
  //     name: "Veg-Curry",
  //     imageUrl: "images/vegcurry.jpg",
  //   ),
  //   Category(
  //     name: "Non-Veg Curry",
  //     imageUrl: "images/nonvegcurry.jpg",
  //   ),
  //   Category(
  //     name: "Sizzlers",
  //     imageUrl: "images/sizzlers.jpg",
  //   ),
  //   Category(
  //     name: "Soft Drinks",
  //     imageUrl: "images/softdrinks.jpg",
  //   ),
  //   Category(
  //     name: "Soup",
  //     imageUrl: "images/soupp.jpg",
  //   ),
  // ];
}
