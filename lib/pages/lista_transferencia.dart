import 'package:bytebank/components/item_transferencia.dart';
import 'package:flutter/material.dart';
import 'formulario_transferencia.dart';
import '../models/transferencia.dart';

class ListaTransferencia extends StatefulWidget {

  final List<Transferencia> transferencias = [];

  ListaTransferencia({Key? key,}) : super(key: key);

  @override
  State<ListaTransferencia> createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget.transferencias.length,
        itemBuilder: (context, index) {
          final transferencia = widget.transferencias[index];
          return ItemTransferencia(transferencia: transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then(
            (transferenciaRecebida) => atualiza(transferenciaRecebida)
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void atualiza(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget.transferencias.add(transferenciaRecebida);
      });
    }
  }
}

