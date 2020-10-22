import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../screens/favorites.dart';
import '../screens/categories_screen.dart';
import '../models/meal.dart';
class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;

   List<Map<String,Object>>  _pages;

   @override
  void initState() {
_pages =[
  {'page':CategoriesScreen(),'title':'Categories'},
  {'page':FavoritesScreen(widget.favoriteMeals),'title':'Your Favourites'},



];
    super.initState();
  }
  void _onselectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
        drawer: MainDrawer(),
        body:_pages[_selectedIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          // type: BottomNavigationBarType.shifting,
          onTap: _onselectPage,
          backgroundColor: Theme.of(context).primaryColor,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.home),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
         
          ],
        ),
    );
  }
}
