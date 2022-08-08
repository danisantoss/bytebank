import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final String label;
  final String tip;
  final TextEditingController controller;
  final IconData? icon;

  const Editor({
    Key? key,
    required this.label,
    required this.tip,
    required this.controller, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: tip,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
