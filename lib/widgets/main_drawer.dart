import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  Widget buildListTile(String title,IconData icon,Function taphandler){
    return   ListTile(
  leading: Icon(
    icon,
  size: 26,
  ),
  title: Text(
      title,
  style: TextStyle(fontFamily: 'RobotoCondensed',fontSize: 24,fontWeight:FontWeight.bold ),
  ),
  onTap: taphandler,
  );
}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 128,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals',Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters',Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),


        ],
      ),
    );
  }
}
