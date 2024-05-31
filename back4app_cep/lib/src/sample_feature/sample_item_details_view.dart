import 'package:back4app_cep/model/cep_model.dart';
import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatefulWidget {
  final CepModel cep;

  const SampleItemDetailsView({super.key,required this.cep});

  static const routeName = '/sample_item';
  
  @override
  State<StatefulWidget> createState() {
    return SimpleItemState();
  }
}

class SimpleItemState extends State<SampleItemDetailsView>{
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    CepModel cep = widget.cep;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CEP Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('CEP - ${cep.cep}'),
            Text('Logradouro: ${cep.logradouro}'),
            Text('Localidade ${cep.localidade} ${cep.uf}'),
            Text('DDD: ${cep.ddd}'),
            Text('complemento: ${cep.complemento}'),
          ],
        ),
      ),
    );
  }

}
