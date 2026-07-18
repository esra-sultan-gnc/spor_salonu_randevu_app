import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/gym_class.dart';
import '../data/booking_data.dart';

class RandevuAl extends StatelessWidget {
  final GymClass ders;

  const RandevuAl({super.key, required this.ders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB2DFDB),
      appBar: AppBar(
        title: const Text("Randevu Al"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: ders.saatler.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(ders.saatler[index]),
            trailing: const Icon(Icons.check),
            onTap: () {
              alinanRandevular.add("${ders.ad} - ${ders.saatler[index]}");

              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Başarılı"),
                  content: const Text("Randevu alındı"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.go('/menu');
                      },
                      child: const Text("Ana Menü"),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
