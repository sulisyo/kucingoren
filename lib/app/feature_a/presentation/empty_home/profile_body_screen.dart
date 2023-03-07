import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileBodyScreen extends StatelessWidget {
  const ProfileBodyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AlohaTextTheme textTheme = AlohaTheme.of(context).textTheme;
    AlohaThemeData alohaThemeData = AlohaTheme.of(context);
    Widget nganu = Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
              color: alohaThemeData.colors.fillBackgroundQuaternary,
            ),
            child: const Hero(
              tag: 'avatar',
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/image2/profile_pic.png'),
                radius: 50.0,
              ),
            ),
          ),
          // const Spacer(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Ridho Charaka',
            style: GoogleFonts.poppins(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: const Color(0xff484848),
            ),
          ),
          Text(
            'ridho.caraka@unpak.ac.id',
            style: textTheme.bodyModerateActive,
          ),
          Text(
            '081512348765',
            style: textTheme.bodyModerateActive,
          ),
          // const Spacer(),
          const SizedBox(
            height: 20,
          ),
          // Card for brief info
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffee8301),
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('NPM', style: textTheme.bodyModerateDefault),
                    const Spacer(),
                    Text('08151234', style: textTheme.bodyModerateDefault),
                    const SizedBox(width: 9.0),
                    const Icon(
                      Icons.copy,
                      color: Colors.white,
                      size: 18.0,
                    ),
                  ],
                ),
                const AlohaDivider(dividerType: DividerType.plain),
                Row(
                  children: [
                    Text('Status Keaktifan', style: textTheme.bodyModerateDefault),
                    const Spacer(),
                    Text('Aktif', style: textTheme.bodyModerateDefault),
                  ],
                ),
                const AlohaDivider(dividerType: DividerType.plain),
                Row(
                  children: [
                    Text('Program Studi', style: textTheme.bodyModerateDefault),
                    const Spacer(),
                    Text('Manajemen Informatika', style: textTheme.bodyModerateDefault),
                  ],
                ),
                const AlohaDivider(dividerType: DividerType.plain),
                Row(
                  children: [
                    Text('Jenjang Pendidikan', style: textTheme.bodyModerateDefault),
                    const Spacer(),
                    Text('Diploma 3', style: textTheme.bodyModerateDefault),
                  ],
                ),
              ],
            ),
          ),
          // const Spacer(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              children: [
                Text('Nama Lengkap', style: textTheme.bodyModerateActive),
                const Spacer(),
                Text('Ridho Caraka', style: textTheme.bodyModerateActive),
              ],
            ),
          ),
          const AlohaDivider(dividerType: DividerType.plain),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              children: [
                Text('Panggilan', style: textTheme.bodyModerateActive),
                const Spacer(),
                Text('Caraka', style: textTheme.bodyModerateActive),
              ],
            ),
          ),
          const AlohaDivider(dividerType: DividerType.plain),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Alamat Rumah', style: textTheme.bodyModerateActive),
                const SizedBox(height: 6.0),
                Text(
                  'Jl. Anyelir Raya, No 21, Kelurahan Cilendek Barat, Kecamatan Bogor Tengah, Bogor, Jawa Barat, Indonesia, 16115',
                  style: textTheme.bodyModerateActive,
                ),
              ],
            ),
          ),
          const AlohaDivider(dividerType: DividerType.plain),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              children: [
                Text('Kartu Mahasiswa', style: textTheme.bodyModerateActive),
                const Spacer(),
                const Icon(Icons.badge),
              ],
            ),
          ),
          // const Spacer(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: nganu
      ),
    );
  }
}
