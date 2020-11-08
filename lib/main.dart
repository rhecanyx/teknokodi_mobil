import 'package:flutter/material.dart';
import 'package:teknokodi/services/advert-service.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teknokodi',
        routes: {
          "/home": (context) => MyApp(),
        },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: 'Teknokodi'
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AdvertService _advertService = AdvertService();

  @override
  void initState(){
    _advertService.showBanner();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.pushNamed(context, "/home"),
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.youtube),
            onPressed: () async {
              const url = 'https://www.youtube.com/channel/UC6ndYQW9mjsgOpz_hr95yEA/';
              if (await canLaunch(url)) {
              await launch(url);
              } else {
              throw 'Sayfa bulunamadı';
              }
            }
          ),
          IconButton(
              icon: Icon(FontAwesomeIcons.instagram),
              onPressed: () async {
                const url = 'https://www.instagram.com/teknokodi/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Sayfa bulunamadı';
                }
              }
          )
        ],
      ),
      body: WebView(
        initialUrl: "https://www.teknokodi.com",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
