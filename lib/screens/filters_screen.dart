import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;


  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;

  @override
  void initState() {

    _glutenFree=widget.currentFilters['gluton'];
    _vegetarian=widget.currentFilters['vegetarian'];
    _vegan=widget.currentFilters['vegan'];
    _lactosefree=widget.currentFilters['Lactose'];


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters={
                  'gluton':_glutenFree,
                  'Lactose':_lactosefree,
                  'vegan':_vegan,
                  'vegetarian':_vegetarian
                };

                widget.saveFilters(selectedFilters);
              }),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your meal Selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              SwitchListTile(
                  title: Text('Gluten free'),
                  value: _glutenFree,
                  subtitle: Text('Only include gluten free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
              SwitchListTile(
                  title: Text('Lactose free'),
                  value: _lactosefree,
                  subtitle: Text('Only include lactose free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _lactosefree = newValue;
                    });
                  }),
              SwitchListTile(
                  title: Text('vegetarian free'),
                  value: _vegetarian,
                  subtitle: Text('Only include vegetarian free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              SwitchListTile(
                  title: Text('vegan free'),
                  value: _vegan,
                  subtitle: Text('Only include vegan free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
