import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen(this.currentFilters, this.saveFilters, {Key? key})
      : super(key: key);
  static const routeName = '/filter';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] == true;
    _vegetarian = widget.currentFilters['vegetarian'] == true;
    _vegan = widget.currentFilters['vegan'] == true;
    _lactoseFree = widget.currentFilters['lactose'] == true;
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String description, var currentValue, dynamic updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactose': _lactoseFree,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Adjust Meal Selections',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildSwitchListTile(
                  'Gluten-free', 'only display gluten-free meals', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile('Vegan', 'Only display vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Only display vegetarian meals', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchListTile('Lactose-free',
                  'Only display lactose-free meals', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
            ],
          ),
        ),
      ]),
    );
  }
}

// Alternative for builder method: _buildswitchListTile
// class MySwitchListTile extends StatelessWidget {
//   const MySwitchListTile(
//       {Key? key,
//       required this.title,
//       required this.description,
//       required this.currentValue,
//       required this.updateValue})
//       : super(key: key);
//   final String title;
//   final String description;
//   final bool currentValue;
//   final updateValue;
//   @override
//   Widget build(BuildContext context) {
//     return SwitchListTile(
//       title: Text(title),
//       value: currentValue,
//       subtitle: Text(description),
//       onChanged: updateValue,
//     );
//   }
// }

// MySwitchListTile(
              //     title: 'Gluten Free',
              //     description: 'Only display gluten free meal',
              //     currentValue: _glutenFree,
              //     updateValue: (newVAL) {
              //       setState(() {
              //         _glutenFree = newVAL;
              //       });
              //     }),