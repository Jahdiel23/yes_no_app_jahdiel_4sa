import 'package:flutter/material.dart';

const Color customColor = Color.fromARGB(255, 19, 5, 219);


const List<Color>colorThemes = [
  customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.red,
];

class AppTheme {

late final int selectedColor;

AppTheme({this.selectedColor = 0}): assert( selectedColor >= 0 && selectedColor <= colorThemes.length - 1, 
'Colors must be between 0 and ${colorThemes.length}' );

ThemeData theme(){
  return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorThemes[selectedColor],
    brightness: Brightness.dark
  );
  
}

}