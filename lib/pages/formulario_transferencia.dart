import 'package:flutter/material.dart';
import '../components/editor.dart';
import '../models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController numeroContaController = TextEditingController();
  final TextEditingController valorController = TextEditingController();

  FormularioTransferencia(
      {Key? key,})
      : super(key: key);

  @override
  State<FormularioTransferencia> createState() =>
      _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: widget.numeroContaController,
              label: 'Número da Conta',
              tip: '0000',
            ),
            Editor(
              controller: widget.valorController,
              label: 'Valor',
              tip: '0.00',
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purpleAccent,
              ),
              onPressed: () => criarTransferencia(context),
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }

  void criarTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(widget.numeroContaController.text);
    final double? valor = double.tryParse(widget.valorController.text);

    if(numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
