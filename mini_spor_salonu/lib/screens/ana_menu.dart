import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnaMenu extends StatelessWidget {
  const AnaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB2DFDB),
      appBar: AppBar(
        title: const Text("Ana Menü"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Çıkış Yap", //Uzun basıldığında çıkan açıklama yazısı
            onPressed: () {
              // Çıkış yap => giriş ekranına dön
              context.go('/');
            },
          ),
        ],
      ),
      body: Center(
        // TÜM İÇERİĞİ ORTALAR
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // Dikey ortalama. Ekranın tamamını değil sadece içindeki elemanlar kadar yer kaplamasını sağlar
            children: [
              // DERSLER BUTONU
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.fitness_center),
                  label: const Text(
                    "Dersler",
                    style: TextStyle(fontSize: 18),
                  ), // sağ tarafta
                  onPressed: () => context.push('/dersler'),
                ),
              ),

              const SizedBox(height: 20),

              // RANDEVULARIM BUTONU
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.event_available),
                  label: const Text(
                    "Randevularım",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () => context.push('/randevularim'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
