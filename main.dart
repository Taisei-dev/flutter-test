import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(textTheme: GoogleFonts.notoSansTextTheme()),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyApp> {
  var _navindex = 0;
  var _label = '';
  final _titles = ['ホーム', 'マップ', 'イベント', 'お知らせ'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('文化祭アプリ'),
        backgroundColor: const Color(0xfffe8855),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Hoge'),
              accountEmail: const Text('hoge@gpoint.work'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'images/medama.jpg',
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('設定'),
              leading: const Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              title: const Text('ログアウト'),
              leading: const Icon(Icons.logout),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'マップ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'イベント',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'お知らせ',
          ),
        ],
        onTap: (int index) {
          setState(() {
            _navindex = index;
            _label = _titles[index];
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _navindex,
        selectedItemColor: const ColorScheme.light().onPrimary,
        unselectedItemColor:
            const ColorScheme.light().onPrimary.withOpacity(0.38),
        backgroundColor: const Color(0xfffe8855),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Center(
            child: Text(
              _label,
              style: const TextStyle(fontSize: 24),
            ),
          ))
        ],
      ),
    );
  }
}
