import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;
  final IconData? icone;

// Com as chaves os itens não ficam obrigatórios, porém não podem ser privados.
  Editor(
    this._controlador,
    this._rotulo,
    this._dica, {
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: _rotulo,
          hintText: _dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
