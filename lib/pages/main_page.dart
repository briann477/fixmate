import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int halamanAktif = 0;

  final List<Widget> halaman = const [
    BerandaPage(),
    PesananPage(),
    ProfilPage(),
  ];

  void pindahHalaman(int index) {
    setState(() {
      halamanAktif = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: halaman[halamanAktif],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: halamanAktif,
        onTap: pindahHalaman,
        selectedItemColor: const Color(0xFF2563EB),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 10),

              Text(
                'Halo, Selamat Datang 👋',
                style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
              ),

              SizedBox(height: 6),

              Text(
                'FixMate',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),

              SizedBox(height: 8),

              Text(
                'Pilih layanan perbaikan rumah yang kamu butuhkan.',
                style: TextStyle(fontSize: 15, color: Color(0xFF6B7280)),
              ),

              SizedBox(height: 24),

              Text(
                'Layanan Tersedia',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),

              SizedBox(height: 14),

              LayananCard(
                icon: Icons.ac_unit,
                title: 'Service AC',
                subtitle: 'Perawatan dan perbaikan AC rumah.',
              ),

              LayananCard(
                icon: Icons.electrical_services,
                title: 'Perbaikan Listrik',
                subtitle: 'Bantu cek dan perbaiki masalah listrik.',
              ),

              LayananCard(
                icon: Icons.water_drop,
                title: 'Perbaikan Keran',
                subtitle: 'Atasi keran bocor dan saluran air.',
              ),

              LayananCard(
                icon: Icons.local_laundry_service,
                title: 'Service Mesin Cuci',
                subtitle: 'Perbaikan mesin cuci bermasalah.',
              ),

              LayananCard(
                icon: Icons.wifi,
                title: 'Perbaikan WiFi',
                subtitle: 'Bantu cek koneksi internet rumah.',
              ),

              LayananCard(
                icon: Icons.vpn_key,
                title: 'Tukang Kunci',
                subtitle: 'Bantuan masalah kunci rumah.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LayananCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const LayananCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF2563EB), size: 28),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Color(0xFF9CA3AF),
          ),
        ],
      ),
    );
  }
}

class PesananPage extends StatelessWidget {
  const PesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF4F8FB),
      body: SafeArea(
        child: Center(
          child: Text(
            'Pesanan',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF4F8FB),
      body: SafeArea(
        child: Center(
          child: Text(
            'Profil',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
