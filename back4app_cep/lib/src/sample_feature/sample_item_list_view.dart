import 'package:back4app_cep/model/cep_model.dart';
import 'package:back4app_cep/repository/cep_repository.dart';
import 'package:flutter/material.dart';

import 'sample_item_details_view.dart';

class SampleItemListView extends StatefulWidget {
  static const routeName = '/';

  const SampleItemListView({super.key});

  @override
  State<StatefulWidget> createState() {
    return SampleItemListViewState();
  }
}

/// Displays a list of SampleItems.
class SampleItemListViewState extends State {
  final TextEditingController cepTextController = TextEditingController();
  var items = <CepModel>[];
  CepRepository repository = CepRepository();

  @override
  void initState() {
    repository.getCEPlist().then((value) => {
          setState(() {
            items.addAll(value);
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de CEPs'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(18.0),
            child: TextField(
              controller: cepTextController,
              decoration: InputDecoration(
                hintText: "Digite um CEP para receber as informações",
                suffixIcon: TapRegion(
                  child: const Icon(Icons.search),
                  onTapInside: (tap) {
                    var cep = cepTextController.text.trim();
                    getCep(cep);
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              reverse: true,
              restorationId: 'sampleItemListView',
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];

                return ListTile(
                    title: Text('${item.cep}'),
                    leading: const Icon(Icons.location_on),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SampleItemDetailsView(cep: item,)));
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

  getCep(String cep) {
    repository.getCEP(cep).then((value) => {
          setState(() {
            items.add(value);
          })
        });
  }
}
