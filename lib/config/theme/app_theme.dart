import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFE78442);

const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.red,
];


class AppTheme{

  final int selectedColor;

  AppTheme({
     this.selectedColor = 0
    })
    :assert(selectedColor >= 0 && selectedColor <= _colorTheme.length , 'Color debe ser entre 0 y ${ _colorTheme.length - 1}');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectedColor]
    );
  }

}