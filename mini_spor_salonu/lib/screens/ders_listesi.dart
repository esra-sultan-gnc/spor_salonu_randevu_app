import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/dummy_data.dart';

class DersListesi extends StatelessWidget {
  const DersListesi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB2DFDB),
      appBar: AppBar(
        title: const Text("Dersler"),
        leading: IconButton(
          // sol taraftaki icon
          icon: const Icon(Icons.arrow_back), // geri ok
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: dummyDersler.length,
        itemBuilder: (context, index) {
          final ders = dummyDersler[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(ders.ad),
              subtitle: Text("${ders.alet} • ${ders.kalori} kcal"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ), // Sağ tarafta ileri ok
              onTap: () => context.push('/detay', extra: ders),
            ),
          );
        },
      ),
    );
  }
}
