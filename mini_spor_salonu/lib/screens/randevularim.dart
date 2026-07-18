import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/booking_data.dart';

class RandevularimEkrani extends StatefulWidget {
  const RandevularimEkrani({super.key});

  @override
  State<RandevularimEkrani> createState() => _RandevularimEkraniState();
}

class _RandevularimEkraniState extends State<RandevularimEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB2DFDB),
      appBar: AppBar(
        title: const Text("Randevularım"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: alinanRandevular.isEmpty
          ? const Center(child: Text("Henüz randevu yok")) //? doğruysa
          : ListView.builder(
              //: yanlışsa
              itemCount: alinanRandevular.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(alinanRandevular[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        alinanRandevular.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
