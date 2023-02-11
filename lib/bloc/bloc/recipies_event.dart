part of 'recipies_bloc.dart';

abstract class RecipiesEvent extends Equatable {}

class InitializingRecipiesEvent extends RecipiesEvent {
  @override
  List<Object?> get props => [];
}

class LoadingRecipiesEvent extends RecipiesEvent {
  LoadingRecipiesEvent();
  @override
  List<Object?> get props => [];
}

class LoadingFavouriteRecipiesEvent extends RecipiesEvent {
  LoadingFavouriteRecipiesEvent();
  @override
  List<Object?> get props => [];
}

class ToggleFavouriteEvent extends RecipiesEvent {
  final String id;
  ToggleFavouriteEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class AddNewRecipieDishEvent extends RecipiesEvent {
  final String id;
  final String title;
  final String imageUrl;
  final bool vegetarian;
  final List<String> recipieDescription;
  final int preparationTime;
  final int preparationCost;
  bool isFavourite;
  AddNewRecipieDishEvent(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.vegetarian,
      required this.recipieDescription,
      required this.preparationCost,
      required this.preparationTime,
      required this.isFavourite});
  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        vegetarian,
        recipieDescription,
        preparationTime,
        preparationCost,
        isFavourite
      ];
}

class DeleteRecipieDishEvent extends RecipiesEvent {
  final String id;
  DeleteRecipieDishEvent(this.id);
  @override
  List<Object?> get props => [id];
}
