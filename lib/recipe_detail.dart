import 'package:flutter/material.dart';
import 'package:fooderlich/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(image: AssetImage(widget.recipe.imageUrl)),
          ),
          const SizedBox(height: 4),
          Text(widget.recipe.label, style: const TextStyle(fontSize: 18.0)),
          Expanded(
            child: ListView.builder(
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext _, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Text(
                      '${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}');
                }),
          ),
          Slider(
              value: _sliderVal.toDouble(),
              min: 1,
              max: 10,
              divisions: 10,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              label: "${_sliderVal * widget.recipe.servings} servings",
              onChanged: (double newValue) {
                setState(() {
                  _sliderVal = newValue.toInt();
                });
              }),
        ],
      )),
    );
  }
}
