import 'package:flutter/material.dart';

class input extends StatelessWidget {
  final String label;
  final IconData Icone;
  final controllerField;
  input(this.label, this.Icone, this.controllerField);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextFormField(
        controller: controllerField,
        style: TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icone,
            size: 40,
            color: Colors.white,
          ),
          hintText: label,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'remplire les champs';
          }
          return null;
        },
      ),
    );
  }
}
