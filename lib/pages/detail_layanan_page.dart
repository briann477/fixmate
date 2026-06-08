import 'package:flutter/material.dart';
import 'form_pesanan_page.dart';

class DetailLayananPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const DetailLayananPage({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  String getEstimasiHarga() {
    if (title == 'Service AC') {
      return 'Rp75.000 - Rp150.000';
    } else if (title == 'Perbaikan Listrik') {
      return 'Rp60.000 - Rp120.000';
    } else if (title == 'Perbaikan Keran') {
      return 'Rp50.000 - Rp100.000';
    } else if (title == 'Service Mesin Cuci') {
      return 'Rp80.000 - Rp180.000';
    } else if (title == 'Perbaikan WiFi') {
      return 'Rp50.000 - Rp100.000';
    } else {
      return 'Rp40.000 - Rp100.000';
    }
  }

  String getEstimasiWaktu() {
    if (title == 'Service AC') {
      return '1 - 2 jam';
    } else if (title == 'Perbaikan Listrik') {
      return '1 - 2 jam';
    } else if (title == 'Perbaikan Keran') {
      return '30 - 60 menit';
    } else if (title == 'Service Mesin Cuci') {
      return '1 - 3 jam';
    } else if (title == 'Perbaikan WiFi') {
      return '30 - 90 menit';
    } else {
      return '30 - 60 menit';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FB),
      appBar: AppBar(
        title: const Text('Detail Layanan'),
        backgroundColor: const Color(0xFFF4F8FB),
        foregroundColor: const Color(0xFF1F2937),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(icon, color: const Color(0xFF2563EB), size: 38),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: InfoBox(
                    icon: Icons.payments_outlined,
                    title: 'Estimasi Harga',
                    value: getEstimasiHarga(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InfoBox(
                    icon: Icons.access_time,
                    title: 'Estimasi Waktu',
                    value: getEstimasiWaktu(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Layanan ini membantu pengguna memesan jasa perbaikan rumah dengan mudah. Pengguna dapat melihat jenis layanan, membaca detail layanan, lalu melanjutkan ke form pemesanan.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormPesananPage(namaLayanan: title),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Pesan Layanan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoBox({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF2563EB), size: 26),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
        ],
      ),
    );
  }
}
