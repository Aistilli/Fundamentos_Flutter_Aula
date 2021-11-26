import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia?> _transferencias = [];
  //Se for objetos que não serão alterados, deixar dentro de StatefulWidget, mas precisa adicionar "widget." antes dos objetos

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    //widget._transferencias.add(Transferencia(100, 1000));
    //Objetos que acessam a classe Stateful

    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice]!;
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then(
            (transferenciaRecebida) => _atualiza(transferenciaRecebida),
          );
          // Antes da refatoração: final Future<Transferencia?> future =
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return FormularioTransferencia();
          // }));
          // future.then((transferenciaRecebida) => _atualiza(transferenciaRecebida)); <fim da função>
          //Para testar o build -> future.delayed(Duration(seconds: 2), (){o if aqui dentro})
          // debugPrint('chegou no then do future');
          // debugPrint('$transferenciaRecebida');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transferencia? transferenciaRecebida) {
    if (widget._transferencias != null) {
      setState(() {
        //Para chamar o build e recarregar a pagina
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
