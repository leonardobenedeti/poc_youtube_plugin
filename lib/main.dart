import 'package:flutter/material.dart';
import 'package:poc_youtube_plugin/player_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  String idLive = "HlZOnsDCqHw";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: Stack(
            fit: StackFit.passthrough,
            alignment: AlignmentDirectional.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: idLive,
                    flags: YoutubePlayerFlags(
                      isLive: true,
                      autoPlay: false,
                    ),
                  ),
                  liveUIColor: Colors.amber,
                ),
              ),
              GestureDetector(
                onTap: _goToPagePlayer,
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * .8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _goToPagePlayer() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => PlayerPage(idLive),
            fullscreenDialog: true));
  }
}
