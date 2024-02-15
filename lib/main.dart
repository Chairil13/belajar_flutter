import 'navigation_pop.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  bool isProfileExpanded = false;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 181, 185, 189),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _openDrawer,
        ),
        title: const Text(
          'Home',
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF1F1D2B),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Chairil Ali',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.code,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mobile Dev',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    'Ambon',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.image_rounded),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const NavigationPop();
                }));
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Social Media'),
              onTap: () {
                _showSocialMediaDialog(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Exit'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color(0xFF1F1D2B),
        child: Column(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        isHovered = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        isHovered = false;
                      });
                    },
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isProfileExpanded = !isProfileExpanded;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        width: isProfileExpanded ? 200.0 : 100.0,
                        height: isProfileExpanded ? 200.0 : 100.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              isProfileExpanded ? 30.0 : 100.0),
                          child: Image.asset(
                            'assets/images/profile.jpg',
                            width: isProfileExpanded ? 200.0 : 100.0,
                            height: isProfileExpanded ? 200.0 : 100.0,
                            fit: BoxFit.cover,
                            color: isHovered ? Colors.grey : null,
                            colorBlendMode: BlendMode.saturation,
                          ),
                        ),
                      ),
                    ),
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
                          color: Colors.white,
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
                          color: Colors.white,
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
                          'Hi there! my name is Chairil Ali, and I am based in Ambon. I am a web developer currently exploring the realms of Flutter and aspiring to become a mobile developer. Engaging in the dynamic world of technology, I find joy in continuous learning and am passionate about honing my skills in mobile development.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
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
                          'In my journey towards mobile development, I am not merely navigating the intricacies of code but also exploring the artistic facets of design and the efficient management of application states. As I delve into the Flutter framework, I am continually motivated by the promise of crafting engaging user interfaces and gaining a profound understanding of reactive programming paradigms.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
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
                          'I invite you to join me on this dynamic exploration, where every challenge is an opportunity, and each line of code tells a story of growth and innovation.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color(0xFF1F1D2B),
            content: Text('Hallo ini Chairil :)'),
          ));
        },
        child: const Icon(Icons.arrow_upward_sharp),
      ),
    );
  }

// social media
  void _showSocialMediaDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Social Media'),
          content: Column(
            children: [
              _buildSocialMediaButton(
                'WhatsApp',
                'https://wa.me/6282238482847',
                FontAwesomeIcons.whatsapp,
              ),
              const SizedBox(
                height: 10,
              ),
              _buildSocialMediaButton(
                  'Instagram',
                  'https://www.instagram.com/chairilali_13?igsh=MTYwczBkbG53c251cg==',
                  FontAwesomeIcons.instagram),
              const SizedBox(
                height: 10,
              ),
              _buildSocialMediaButton(
                  'Facebook',
                  'https://www.facebook.com/chairil.ali.92?mibextid=ZbWKwL',
                  FontAwesomeIcons.facebookF),
              const SizedBox(
                height: 10,
              ),
              _buildSocialMediaButton('Github', 'https://github.com/Chairil13',
                  FontAwesomeIcons.github),
            ],
          ),
        );
      },
    );
  }

// social media icon setting and lauch
  Widget _buildSocialMediaButton(String label, String url, IconData icon) {
    return ElevatedButton(
      onPressed: () async {
        // ignore: deprecated_member_use
        if (await canLaunch(url)) {
          // ignore: deprecated_member_use
          await launch(url);
        } else {
          print('Could not launch $url');
        }
      },
      child: Row(
        children: [
          FaIcon(icon),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
