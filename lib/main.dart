import 'package:flutter/material.dart';
import 'navigation_pop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text(
          'Biodata',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const NavigationPop();
              }));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Chairil Ali',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mobile Dev',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Seorang web developer yang sedang mengeksplorasi dan memperluas wawasan profesionalnya melalui dunia Flutter, menandai perjalanan yang penuh semangat menuju pembelajaran teknologi mobile. Dengan latar belakang dalam pengembangan web, keputusannya untuk mendalami Flutter mencerminkan ambisi untuk menggali lebih dalam ke dalam spektrum pengembangan aplikasi, memperluas keterampilan dan pemahamannya di dunia pemrograman.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Dengan kecintaan pada pemrograman, web developer ini sedang menyesuaikan diri dengan paradigma pengembangan aplikasi mobile menggunakan Flutter. Ia memperoleh kepuasan dalam menghadapi tantangan baru, memecahkan masalah, dan mengeksplorasi potensi kreatif yang ditawarkan oleh teknologi Flutter. Proses pembelajaran web developer ini tidak hanya mengenai sintaks dan kerangka kerja baru, tetapi juga tentang mengeksplorasi desain antarmuka yang menarik, pengelolaan keadaan aplikasi yang efisien, dan pemahaman mendalam tentang paradigma reaktif yang mendasari Flutter. Sembari mengasah keterampilan teknisnya, ia terus mencari cara untuk mengaplikasikan prinsip-prinsip desain yang baik dan menyempurnakan alur kerja pengembangan aplikasinya.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Dengan semangat belajar yang tinggi, web developer ini bukan hanya sedang belajar Flutter untuk mencapai proyek-proyek masa depannya, tetapi juga untuk memperdalam pemahaman inti tentang teknologi dan merajut fondasi yang kokoh di dunia pengembangan perangkat lunak. Melalui perjalanan ini, ia membangun landasan yang kuat, siap untuk menjawab panggilan tantangan dan mengembangkan aplikasi-aplikasi inovatif yang menggoda rasa ingin tahu teknologi.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.blue,
            content: Text('Nama saya Chairil Ali'),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
