import 'package:buscaceowithbloc/home/bloc/search_bloc.dart';
import 'package:buscaceowithbloc/home/bloc/search_event.dart';
import 'package:buscaceowithbloc/home/bloc/search_state.dart';
import 'package:buscaceowithbloc/widgets/elevatedButton_custom.dart';
import 'package:buscaceowithbloc/widgets/text_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cep = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search Cep'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _cep,
                decoration: const InputDecoration(
                  label: Text('Digite um cep'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButtonCustom(
                text: 'Buscar',
                onPressed: () {
                  BlocProvider.of<SearchBloc>(context).add(
                    SearchFetch(_cep.text),
                  );
                },
              ),
              const SizedBox(height: 10,),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is SearchSuccess) {
                    return TextResult(
                        textValue: state.cep.localidade,
                        type: TextType.success);
                  }

                  if (state is SearchError) {
                    return TextResult(
                        textValue: state.message, type: TextType.error);
                  }
                  return TextResult(
                      textValue: 'Esperando...', type: TextType.success);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
