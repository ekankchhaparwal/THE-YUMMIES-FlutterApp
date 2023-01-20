import 'package:flutter/material.dart';
import '../providers/dishItem.dart';

class AllDishesRecipie with ChangeNotifier {
  final List<DishItem> _dishesRecipies = [
    DishItem(
      id: '1',
      title: 'Cutting Chai',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTllsNvcalt1idO0jueMuu2WYVRHpTO00TrmA&usqp=CAU',
      recipieDescription: [
        'Pour 2 cups water into a medium saucepan and add tea and spices.',
        'Bring to a boil over high heat and boil 2 minutes.',
        'Step 2Add sugar and milk and return to a boil.',
        'Reduce heat to medium and boil gently 2 minutes, stirring occasionally.',
        'Strain and pour into small cups or heatproof glasses.'
      ],
      vegetarian: true,
      preparationTime: 15,
      preparationCost: 30,
      
    ),
    DishItem(
      id: '2',
      title: 'Toast Hawaii',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
      recipieDescription: [
        'Butter one side of the white bread',
        'Layer ham, the pineapple and cheese on the white bread',
        'Bake the toast for round about 10 minutes in the oven at 200°C'
      ],
      vegetarian: true,
      preparationTime: 20,
      preparationCost: 200,
      
    ),
    DishItem(
      id: '3',
      title: 'Creamy Indian Chicken Curry',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
      recipieDescription: [
        'Slice and fry the chicken breast',
        'Process onion, garlic and ginger into paste and sauté everything',
        'Add spices and stir fry',
        'Add chicken breast + 250ml of water and cook everything for 10 minutes',
        'Add coconut milk',
        'Serve with rice'
      ],
      vegetarian: false,
      preparationTime: 60,
      preparationCost: 400,
    ),
    DishItem(
      id: '4',
      title: 'Delicious Orange Mousse',
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
      recipieDescription: [
        'Dissolve gelatine in pot',
        'Add orange juice and sugar',
        'Take pot off the stove',
        'Add 2 tablespoons of yoghurt',
        'Stir gelatin under remaining yoghurt',
        'Cool everything down in the refrigerator',
        'Whip the cream and lift it under die orange mass',
        'Cool down again for at least 4 hours',
        'Serve with orange peel',
      ],
      vegetarian: false,
      preparationTime: 60,
      preparationCost: 200,
    ),
    DishItem(
      id: '5',
      title: 'Asparagus Salad with Cherry Tomatoes',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
      recipieDescription: [
        'Wash, peel and cut the asparagus',
        'Cook in salted water',
        'Salt and pepper the asparagus',
        'Roast the pine nuts',
        'Halve the tomatoes',
        'Mix with asparagus, salad and dressing',
        'Serve with Baguette'
      ],
      vegetarian: true,
      preparationTime: 20,
      preparationCost: 120,
    ),
    DishItem(
      id: '6',
      title: 'Pancakes',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
      recipieDescription: [
        'In a large bowl, sift together the flour, baking powder, salt and sugar.',
        'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
        'Heat a lightly oiled griddle or frying pan over medium high heat.',
        'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
      ],
      vegetarian: true,
      preparationTime: 25,
      preparationCost: 250,
      
    ),
  ];

  List<DishItem> get allDishes {
    return [..._dishesRecipies];
  }

  List<DishItem> get favourites {
    return _dishesRecipies.where((element) => element.isFavourite).toList();
  }

  DishItem findById(String id) {
    return _dishesRecipies.firstWhere((element) => element.id == id);
  }

  void deleteDish(String id) {
    _dishesRecipies.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void addProducts(DishItem dishItem) {
    int length = _dishesRecipies.length + 1;
    final newProduct = DishItem(
        id: length.toString(),
        title: dishItem.title,
        vegetarian: dishItem.vegetarian,
        imageUrl: dishItem.imageUrl,
        preparationCost: dishItem.preparationCost,
        preparationTime: dishItem.preparationTime,
        recipieDescription: dishItem.recipieDescription,
        isFavourite: false,
        );
    _dishesRecipies.add(newProduct);
    notifyListeners();
  }
}
