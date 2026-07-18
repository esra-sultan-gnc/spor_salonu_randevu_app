// kullanıcı adı: ahm1 şifre: 123

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

// EKRANLAR
import 'screens/ana_menu.dart';
import 'screens/ders_listesi.dart';
import 'screens/ders_detay.dart';
import 'screens/randevu_al.dart';
import 'screens/randevularim.dart';

// MODEL
import 'models/gym_class.dart';

void main() {
  runApp(const MyApp());
}

/* ---------------- ROUTER ---------------- */

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const GirisEkrani()),
    GoRoute(path: '/menu', builder: (context, state) => const AnaMenu()),
    GoRoute(path: '/dersler', builder: (context, state) => const DersListesi()),
    GoRoute(
      path: '/detay',
      builder: (context, state) {
        final ders = state.extra as GymClass;
        return DersDetay(ders: ders);
      },
    ),
    GoRoute(
      path: '/randevu',
      builder: (context, state) {
        final ders = state.extra as GymClass;
        return RandevuAl(ders: ders);
      },
    ),
    GoRoute(
      path: '/randevularim',
      builder: (context, state) => const RandevularimEkrani(),
    ),
  ],
);

/* ---------------- APP ---------------- */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Spor Salonu Uygulaması',
      routerConfig: goRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
    );
  }
}

/* ---------------- GİRİŞ EKRANI ---------------- */

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({super.key});

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  final TextEditingController _kadi = TextEditingController();
  final TextEditingController _sifre = TextEditingController();

  bool yukleniyorMu = false;

  Future<bool> girisYap() async {
    setState(() => yukleniyorMu = true);

    const String url =
        "https://deneme-2cf99-default-rtdb.europe-west1.firebasedatabase.app/kullanici.json";

    final response = await http.get(Uri.parse(url));
    final veri = jsonDecode(response.body);

    await Future.delayed(
      const Duration(seconds: 2),
    ); // animasyon en az 2 sn görünsün

    setState(() => yukleniyorMu = false);

    return veri["kadi"] == _kadi.text &&
        veri["sifre"].toString() == _sifre.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFB2DFDB,
      ), //Color.fromARGB(255, 170, 243, 239)
      body: yukleniyorMu
          // LOTTIE LOADING
          ? Center(
              child: Lottie.asset(
                'assets/anim/loading.json',
                width: 220,
                height: 220,
                fit: BoxFit.contain,
              ),
            )
          // GİRİŞ FORMU
          : Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.jpg", height: 120),
                  const SizedBox(height: 30),

                  TextField(
                    controller: _kadi,
                    decoration: const InputDecoration(
                      labelText: "Kullanıcı Adı",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: _sifre,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Şifre",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.login),
                      label: const Text(
                        "Giriş Yap",
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () async {
                        final sonuc = await girisYap();
                        if (sonuc) {
                          context.go('/menu');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Kullanıcı adı veya şifre yanlış"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
