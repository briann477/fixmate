import 'package:flutter/material.dart';
import 'detail_layanan_page.dart';
import 'login/login_page.dart';
import 'detail_pesanan_page.dart';

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
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailLayananPage(icon: icon, title: title, subtitle: subtitle),
          ),
        );
      },
      child: Container(
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
      ),
    );
  }
}

class PesananPage extends StatelessWidget {
  const PesananPage({super.key});

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
                'Pesanan Saya',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),

              SizedBox(height: 8),

              Text(
                'Riwayat pesanan layanan FixMate.',
                style: TextStyle(fontSize: 15, color: Color(0xFF6B7280)),
              ),

              SizedBox(height: 24),

              PesananCard(
                title: 'Service AC',
                tanggal: '12 Juni 2026',
                status: 'Menunggu Teknisi',
                icon: Icons.ac_unit,
                selesai: false,
              ),

              PesananCard(
                title: 'Perbaikan WiFi',
                tanggal: '10 Juni 2026',
                status: 'Selesai',
                icon: Icons.wifi,
                selesai: true,
              ),

              PesananCard(
                title: 'Perbaikan Keran',
                tanggal: '8 Juni 2026',
                status: 'Selesai',
                icon: Icons.water_drop,
                selesai: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PesananCard extends StatelessWidget {
  final String title;
  final String tanggal;
  final String status;
  final IconData icon;
  final bool selesai;

  const PesananCard({
    super.key,
    required this.title,
    required this.tanggal,
    required this.status,
    required this.icon,
    required this.selesai,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPesananPage(
              title: title,
              tanggal: tanggal,
              status: status,
              icon: icon,
              selesai: selesai,
            ),
          ),
        );
      },
      child: Container(
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
                    tanggal,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6B7280),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: selesai
                          ? const Color(0xFFE8F7EF)
                          : const Color(0xFFFFF7E6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: selesai
                            ? const Color(0xFF16A34A)
                            : const Color(0xFFD97706),
                      ),
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
      ),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 24),

              const CircleAvatar(
                radius: 46,
                backgroundColor: Color(0xFFEFF6FF),
                child: Icon(Icons.person, size: 52, color: Color(0xFF2563EB)),
              ),

              const SizedBox(height: 16),

              const Text(
                'Pengguna FixMate',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'user@fixmate.com',
                style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
              ),

              const SizedBox(height: 30),

              const ProfilMenu(
                icon: Icons.phone_outlined,
                title: 'Nomor Telepon',
                subtitle: '0812-0000-0000',
              ),

              const ProfilMenu(
                icon: Icons.location_on_outlined,
                title: 'Alamat',
                subtitle: 'Jakarta, Indonesia',
              ),

              const ProfilMenu(
                icon: Icons.info_outline,
                title: 'Tentang Aplikasi',
                subtitle: 'FixMate versi prototype',
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEF4444),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfilMenu({
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
          Icon(icon, color: const Color(0xFF2563EB), size: 28),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
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
        ],
      ),
    );
  }
}
