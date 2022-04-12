// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hotel_lemon/bloc/categoryBloc/category_event.dart';
// import 'category_state.dart';



// class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
//   final CategoryRepo _categoryRepo;
//   StreamSubscription? _categorySubscription;

//   CategoryBloc({required CategoryRepo categoryRepo})
//       : _categoryRepo = categoryRepo,
//         super(CategoryLoading());

//   @override
//   Stream<CategoryState> _mapEventToState(
//     CategoryEvent event,
//   ) async* {
//     if (event is LoadCategorie) {
//       yield* _mapLoadCategorieToState();
//     }
//     if (event is UpdateCategorie) {
//       yield* _mapUpdateCategorieToState(event);
//     }
//   }

//   Stream<CategoryState> _mapLoadCategorieToState() async* {
//     _categorySubscription?.cancel();
//     _categorySubscription = _categoryRepo.getAllCategorie().listen(
//           (categorie) => add(
//             UpdateCategorie(categorie),
//           ),
//         );
//   }

//   Stream<CategoryState> _mapUpdateCategorieToState(
//       UpdateCategorie event) async* {
//     yield CategoryLoaded(categorie: event.categorie);
//   }
// }
