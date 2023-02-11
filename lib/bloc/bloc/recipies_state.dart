part of 'recipies_bloc.dart';

abstract class RecipiesState extends Equatable {}

class InitializingRecipiesState extends RecipiesState {
  @override
  List<Object?> get props => [];
}

class InitializedRecipiesState extends RecipiesState {
  @override
  List<Object?> get props => [];
}

class LoadingRecipiesState extends RecipiesState {
  @override
  List<Object?> get props => [];
}

class LoadedRecipiesState extends RecipiesState {
  final List<DishItem> dishes;
  final List<DishItem> Favdishes;

  // final int size;
  LoadedRecipiesState({required this.dishes, required this.Favdishes});
  @override
  List<Object?> get props => [dishes];
}

class LoadedFavouriteRecipiesState extends RecipiesState {
  final List<DishItem> favouirteDishes;
  // final int size;
  LoadedFavouriteRecipiesState({required this.favouirteDishes});
  @override
  List<Object?> get props => [favouirteDishes];
}

class ToggleFavouritesState extends RecipiesState {
  final List<DishItem> dishes;
  ToggleFavouritesState({required this.dishes});
  @override
  List<Object?> get props => [dishes];
}

class FailedToLoadRecipiesState extends RecipiesState {
  final Error error;
  FailedToLoadRecipiesState({required this.error});

  @override
  List<Object?> get props => [error];
}

class AddedRecipiesState extends RecipiesState {
  @override
  List<Object?> get props => [];
}

class DeletedRecipiesState extends RecipiesState {
  @override
  List<Object?> get props => [];
}

// Not yet Used
class UpdatedRecipiesState extends RecipiesState {
  @override
  List<Object?> get props => [];
}
