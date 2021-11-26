import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando transferência';

const _rotuloCampoValor = 'Número da conta';
const _dicaCampoValor = '0000';

const _rotuloCampoNumeroConta = 'Valor';
const _dicaCampoNumeroConta = '0.00';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  // Passar o Formulário para Stateful para corrigir o erro de apagar os dados digitados ao tentar voltar
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          // Para adicionar um scroll
          child: Column(
            children: [
              Editor(
                _controladorCampoNumeroConta,
                _rotuloCampoValor,
                _dicaCampoValor,
              ),
              Editor(
                _controladorCampoValor,
                _rotuloCampoNumeroConta,
                _dicaCampoNumeroConta,
                //Para acessar o item não requerido, que pode ser nulo.
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                onPressed: () => _criaTransferencia(context),
                child: Text(_textoBotaoConfirmar),
              ),
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      // debugPrint('Criando transferência');
      // debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('$transferenciaCriada'),
      // ));
    }
  }
}
