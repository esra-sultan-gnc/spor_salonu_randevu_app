import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/gym_class.dart';

class DersDetay extends StatelessWidget {
  final GymClass ders;

  const DersDetay({
    super.key,
    required this.ders,
  }); //Bu sayfa ders olmadan açılamaz

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB2DFDB),
      appBar: AppBar(
        title: Text(ders.ad),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //Yazıları sola hizalar
          children: [
            Text("Alet: ${ders.alet}", style: const TextStyle(fontSize: 18)),
            Text(
              "Eğitmen: ${ders.egitmen}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Kalori: ${ders.kalori} kcal",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => context.push('/randevu', extra: ders),
              child: const Text("Randevu Al"),
            ),
          ],
        ),
      ),
    );
  }
}
