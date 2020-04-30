import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filters';

  final Function saveFilters;
  final Map<String, bool> filters;

  FilterScreen(this.filters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.filters['glutten'];
    _isVegan = widget.filters['vegan'];
    _isVegetarian = widget.filters['vegetarian'];
    _isLactoseFree = widget.filters['lactose'];
  }

  Widget displaySwitchTiles(
      {bool value, String title, String subtitle, Function onChangeHandler}) {
    return SwitchListTile(
        value: value,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
        subtitle: Text(subtitle),
        onChanged: onChangeHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Resturant'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFIlters = {
                  'glutten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian
                };
                widget.saveFilters(selectedFIlters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Filter out the kind of meal you want',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'ZillaSlab'),
              ),
            ),
          ),
          Expanded(
            child: Column(children: <Widget>[
              displaySwitchTiles(
                  value: _isGlutenFree,
                  title: 'Gutten',
                  subtitle: 'Filter for glutten free meals.',
                  onChangeHandler: (value) {
                    setState(() {
                      _isGlutenFree = value;
                    });
                  }),
              displaySwitchTiles(
                  value: _isLactoseFree,
                  title: 'Lactose',
                  subtitle: 'Filter for lactose free meals.',
                  onChangeHandler: (value) {
                    setState(() {
                      _isLactoseFree = value;
                    });
                  }),
              displaySwitchTiles(
                  value: _isVegan,
                  title: 'Vegan',
                  subtitle: 'Filter for vegan free meals.',
                  onChangeHandler: (value) {
                    setState(() {
                      _isVegan = value;
                    });
                  }),
              displaySwitchTiles(
                  value: _isVegetarian,
                  title: 'Vegetarian',
                  subtitle: 'Filter for vegetarian free meals.',
                  onChangeHandler: (value) {
                    setState(() {
                      _isVegetarian = value;
                    });
                  }),
            ]),
          )
        ],
      ),
    );
  }
}
