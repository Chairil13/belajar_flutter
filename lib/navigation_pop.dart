import 'package:latihan/main.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationPop extends StatefulWidget {
  const NavigationPop({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavigationPopState createState() => _NavigationPopState();
}

class _NavigationPopState extends State<NavigationPop>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _openDrawer,
        ),
        backgroundColor: const Color.fromARGB(255, 181, 185, 189),
        title: const Text('Gallery'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.image),
            ),
            Tab(
              icon: Icon(Icons.image),
            ),
            Tab(
              icon: Icon(Icons.image),
            ),
          ],
        ),
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const MyApp();
                }));
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
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
        child: TabBarView(
          controller: _tabController,
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/sam.jpg',
                  width: 300.0,
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/samm.jpg',
                  width: 300.0,
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/sammm.jpg',
                  width: 300.0,
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color(0xFF1F1D2B),
            content: Text('Hallo ini Samrah :)'),
          ));
        },
        child: const Icon(Icons.arrow_upward_sharp),
      ),
    );
  }

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
