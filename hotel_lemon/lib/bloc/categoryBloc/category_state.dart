import 'package:equatable/equatable.dart';
import 'package:hotel_lemon/model/category_model.dart';


abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {
  
    @override
  List<Object> get props => [];
}

class CategoryLoaded extends CategoryState {
  final List<Category> categorie;
  CategoryLoaded({this.categorie = const <Category>[]});

  @override
  List<Object> get props => [categorie];
}
