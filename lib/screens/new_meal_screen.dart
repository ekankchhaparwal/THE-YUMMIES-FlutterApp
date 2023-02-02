import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/allDishes.dart';
import '../providers/dishItem.dart';
import '../screens/editmealscreen.dart';
class NewMealScreen extends StatefulWidget {
  const NewMealScreen({super.key});
  static const routeName = "/newDish";
  @override
  State<NewMealScreen> createState() => _NewMealScreenState();
}

class _NewMealScreenState extends State<NewMealScreen> {
  final _focusTimeNode = FocusNode();
  final _imageController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _focusImageNode = FocusNode();
  String _dishName = "";
  String _category = "Vegetarian";
  String? _difficulty = "Simple";
  String _imageURL = "";
  String _recipie = "";
  int _Time = 0;
  int _costs = 0;

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
    var _newDish = DishItem(
        id: "",
        title: _dishName,
        imageUrl: _imageURL,
        recipieDescription: description,
        vegetarian: _category == "Vegetarian",
        preparationTime: 0,
        preparationCost: 0);
    Provider.of<AllDishesRecipie>(context, listen: false).addProducts(_newDish);
    
    Navigator.of(context).pushReplacementNamed(EditMeals.routeName);
  }

  Widget spacer(double high) {
    return SizedBox(
      height: high,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Meal"),
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
                initialValue: "",
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
                initialValue: _Time.toString(),
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
                  _Time = int.parse(value.toString());
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
              spacer(10),
              const Text(
                "Difficulty :",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              spacer(5),
              RadioListTile(
                title: const Text("Simple"),
                value: "Simple",
                groupValue: _difficulty,
                onChanged: (value) {
                  setState(() {
                    _difficulty = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("Medium"),
                value: "Medium",
                groupValue: _difficulty,
                onChanged: (value) {
                  setState(() {
                    _difficulty = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("Professional"),
                value: "Professional",
                groupValue: _difficulty,
                onChanged: (value) {
                  setState(() {
                    _difficulty = value.toString();
                  });
                },
              ),
              const Divider(
                color: Colors.black87,
              ),
              TextFormField(
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
                initialValue: _costs.toString(),
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
                      // onFieldSubmitted: (_) {
                      //   _saveForm();
                      // },
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
