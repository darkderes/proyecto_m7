import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  
  Stream<String> getLoadingMessages() {
    final messages = <String>[
    'Cargando datos...',
    'Cargando datos... (otra vez)',
    'Cargando datos... (otra vez más)',
    'Cargando datos... (y otra vez)',
    'Cargando datos... (y otra vez más mas)',
    'Cargando datos... (y otra vez más mas mas)',
    'Cargando datos... (y otra vez más mas mas mas)',
  ];
  return Stream.periodic(const Duration(milliseconds: 1200), (index) {
    return messages[index];
  }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Cargando datos...'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(),
          const SizedBox(height: 10),
          StreamBuilder(stream: getLoadingMessages(),

           builder: (context, snapshot){
              if(snapshot.hasData){
                return Text(snapshot.data!);
              }else{
                return const Text('Loading...');
              }
           },)

        ],
      
      ),
    );
  }
}
