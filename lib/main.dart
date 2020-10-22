import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluton': false,
    'Lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _avaialableMeals = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avaialableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluton'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['Lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toogleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) =>
    meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId)
        );
      });
    }
  }
bool _isFavorite(String id)
{
return _favoriteMeals.any((meal) => meal.id ==id);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
              bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1)
              ),
              bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1)
              ),
              headline1: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )
          )
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.

      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, setFilters),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toogleFavorite,_isFavorite),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_avaialableMeals),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time'),
      ),
    );
  }
}
