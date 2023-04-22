import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/allDishes.dart';
import '../providers/dishItem.dart';
import '../screens/editmealscreen.dart';

class EditYourMealRecipieScreen extends StatefulWidget {
  static const routeName = "/editDish";

  @override
  State<EditYourMealRecipieScreen> createState() =>
      _EditYourMealRecipieScreenState();
}

class _EditYourMealRecipieScreenState extends State<EditYourMealRecipieScreen> {
  final _focusTimeNode = FocusNode();
  final _imageController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _focusImageNode = FocusNode();
  String _dishName = "";
  String _category = "Vegetarian";
  String _imageURL = "";
  String _recipie = "";
  int _time = 0;
  int _costs = 0;
  String _id = "";
  @override
  void dispose() {
    _focusImageNode.dispose();
    _focusTimeNode.dispose();
    _imageController.dispose();
    super.dispose();
  }

  void _saveForm() {
    final boole = _formkey.currentState!.validate();

    if (!boole) {
      return;
    }
    _formkey.currentState!.save();

    List<String> description = _recipie.split(RegExp(r'[.!?]'));
    for (int i = 0; i < description.length-1; i++) {
      description[i] = description[i] + '.';
    }
    var editedDish = DishItem(
        id: _id,
        title: _dishName,
        imageUrl: _imageURL,
        recipieDescription: description,
        vegetarian: _category == "Vegetarian",
        preparationTime: _time,
        preparationCost: _costs);
    Provider.of<AllDishesRecipie>(context, listen: false).updateRecipie(editedDish.id,editedDish);

    Navigator.of(context).pushReplacementNamed(EditMeals.routeName);
  }

  Widget spacer(double high) {
    return SizedBox(
      height: high,
    );
  }

  void setMealCategories(DishItem dishItem) {
    _category = dishItem.vegetarian ? "Vegetarian" : "Non-Vegetarian";
    _recipie = dishItem.recipieDescription.join();
    _imageController.text = dishItem.imageUrl;
    _id = dishItem.id;
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    final mealData = Provider.of<AllDishesRecipie>(context).findById(mealId);
    setMealCategories(mealData);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Your Meal Recipie"),
        actions: [
          IconButton(
            onPressed: () {
              _saveForm();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: _formkey,
            child: ListView(children: <Widget>[
              TextFormField(
                initialValue: mealData.title,
                decoration: const InputDecoration(labelText: 'Dish Name'),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_focusTimeNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Provide a value';
                  }
                  return null;
                },
                onSaved: ((newvalue) {
                  _dishName = (newvalue).toString();
                }),
              ),
              TextFormField(
                initialValue: mealData.preparationTime.toString(),
                decoration: const InputDecoration(labelText: 'Time to Cook'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter the Time';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Enter a Valid Time in Minutes';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Enter a Value Greater Than 0';
                  }
                  return null;
                },
                focusNode: _focusTimeNode,
                onSaved: ((value) {
                  _time = int.parse(value.toString());
                  ;
                }),
              ),
              spacer(10),
              const Text(
                "Category :",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              spacer(5),
              RadioListTile(
                title: const Text("Vegetarian"),
                value: "Vegetarian",
                groupValue: _category,
                onChanged: (value) {
                  setState(() {
                    _category = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("Non-Vegetarian"),
                value: "Non-Vegetarian",
                groupValue: _category,
                onChanged: (value) {
                  setState(() {
                    _category = value.toString();
                  });
                },
              ),
              const Divider(
                color: Colors.black87,
              ),
              spacer(5),
              TextFormField(
                initialValue: _recipie,
                decoration: const InputDecoration(labelText: 'Recipie :'),
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return 'Enter the Recipe';
                  }
                  if (value.length < 10) {
                    return 'Recipe must contain minimum 10 characters';
                  }
                }),
                onSaved: ((newValue) {
                  _recipie = newValue.toString();
                }),
              ),
              spacer(10),
              TextFormField(
                initialValue: mealData.preparationCost.toString(),
                decoration:
                    const InputDecoration(labelText: 'Preparation Cost :'),
                keyboardType: TextInputType.number,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return ' Enter the Recipie Cost';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Enter a Valid Number';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Enter a Value Greater Than 0';
                  }
                  return null;
                }),
                onSaved: ((value) {
                  _costs = int.parse(value.toString());
                }),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(top: 10, left: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                      ),
                    ),
                    child: Container(
                      height: 95,
                      width: 100,
                      alignment: Alignment.center,
                      child: _imageController.text.isEmpty
                          ? const Text(
                              'ENTER A URL',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )
                          : Image.network(
                              _imageController.text,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.name,
                      focusNode: _focusImageNode,
                      controller: _imageController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter a Image URL';
                        }
                        return null;
                      },
                      onSaved: ((newValue) {
                        _imageURL = newValue.toString();
                      }),
                    ),
                  )
                ],
              )
            ])),
      ),
    );
  }
}
