import 'package:equatable/equatable.dart';
import 'package:hotel_lemon/model/category_model.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];

}

class LoadCategorie extends CategoryEvent {
  @override
  List<Object> get props => [];
}

class UpdateCategorie extends CategoryEvent {
  final List<Category> categorie;

  UpdateCategorie(this.categorie);

  @override
  List<Object> get props => [categorie];
}
