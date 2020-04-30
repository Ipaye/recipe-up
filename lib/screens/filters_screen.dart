import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filters';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  var _isVegan = true;
  var _isVegetarian = true;
  var _isLactoseFree = true;

  Widget displaySwitchTiles(
      {bool value, String title, String subtitle, Function onChangeHandler}) {
    return SwitchListTile(
        value: value,
        title: Text(title),
        subtitle: Text(subtitle),
        onChanged: onChangeHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Resturant'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Filter out the kind of meal you want',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
                      value = _isGlutenFree;
                    });
                  }),
              displaySwitchTiles(
                  value: _isLactoseFree,
                  title: 'Lactose',
                  subtitle: 'Filter for lactose free meals.',
                  onChangeHandler: (value) {
                    setState(() {
                      value = _isLactoseFree;
                    });
                  }),
              displaySwitchTiles(
                  value: _isVegan,
                  title: 'Gutten',
                  subtitle: 'Filter for vegan free meals.',
                  onChangeHandler: (value) {
                    setState(() {
                      value = _isVegan;
                    });
                  }),
              displaySwitchTiles(
                  value: _isVegetarian,
                  title: 'Gutten',
                  subtitle: 'Filter for vegetarian free meals.',
                  onChangeHandler: (value) {
                    setState(() {
                      value = _isVegetarian;
                    });
                  }),
            ]),
          )
        ],
      ),
    );
  }
}
