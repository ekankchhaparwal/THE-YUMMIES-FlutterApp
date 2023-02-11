import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../providers/allDishes.dart';
import '../../providers/dishItem.dart';

part 'recipies_event.dart';
part 'recipies_state.dart';

class RecipiesBloc extends Bloc<RecipiesEvent, RecipiesState> {
  final AllDishesRecipie _allDishesRecipie = AllDishesRecipie([],"");
  RecipiesBloc() : super(InitializedRecipiesState()) {
    on<InitializingRecipiesEvent>((event, emit) async {
      emit(InitializingRecipiesState());
      _allDishesRecipie.getDishesFromStorage();
      emit(InitializedRecipiesState());
      add(LoadingRecipiesEvent());
      add(LoadingFavouriteRecipiesEvent());
    });

    on<LoadingRecipiesEvent>((event, emit) async {
      emit(LoadingRecipiesState());
      try {
        emit(LoadedRecipiesState(
            dishes: _allDishesRecipie.allDishes,
            Favdishes: _allDishesRecipie.favourites));
      } catch (error) {
        emit(FailedToLoadRecipiesState(error: error as Error));
      }
    });
    on<LoadingFavouriteRecipiesEvent>((event, emit) async {
      emit(LoadingRecipiesState());
      try {
        emit(LoadedFavouriteRecipiesState(
            favouirteDishes: _allDishesRecipie.favourites));
      } catch (error) {
        emit(FailedToLoadRecipiesState(error: error as Error));
      }
    });
    on<AddNewRecipieDishEvent>(
      (event, emit) {
        try {
          DishItem dishItem = DishItem(
              id: event.id,
              title: event.title,
              imageUrl: event.imageUrl,
              recipieDescription: event.recipieDescription,
              vegetarian: event.vegetarian,
              preparationTime: event.preparationTime,
              preparationCost: event.preparationCost);
          _allDishesRecipie.addDish(dishItem);
          emit(AddedRecipiesState());
        } catch (error) {
          emit(FailedToLoadRecipiesState(error: error as Error));
        }
      },
    );

    on<DeleteRecipieDishEvent>(
      (event, emit) async {
        try {
          _allDishesRecipie.deleteDish(event.id);
          emit(DeletedRecipiesState());
        } catch (error) {
          emit(FailedToLoadRecipiesState(error: error as Error));
        }
      },
    );
  }
}
