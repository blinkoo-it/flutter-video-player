import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(VideoApp());
}

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  final GlobalKey key = GlobalKey();

  bool isPlayerInitialized = false;
  bool firstInit = true;

  @override
  void initState() {
    super.initState();
    try {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(
            // 'https://crushtravelams-euwe.streaming.media.azure.net/94e4050e-2c68-4da6-9436-ae733f0b188f/1.ism/manifest(format=m3u8-cmaf)',
            'https://dev-cdn.blinkoo.com/asset-74449a0b-b723-4071-a275-f8231864e2a8/webm/c4f526dd-3665-4af3-b9bf-d36aebdb2c15_v1080.webm'),
      )..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
      _controller.setVolume(0.0);
      _controller.setLooping(true);
      _controller.addListener(eventListener);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            onSubmitted: (text) => changeUrl(text),
          ),
        ),
        body: Center(
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller, key: key),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  switchVolume();
                });
              },
              child: Icon(
                _controller.value.volume == 0
                    ? Icons.volume_mute
                    : Icons.volume_up,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void switchVolume() {
    _controller.setVolume(_controller.value.volume == 0 ? 0.5 : 0);
  }

  Future<void> changeUrl(String? url) async {
    debugPrint("CAMBIO URL");
    await _controller.changeVideoUrl(url ?? _controller.dataSource);
  }

  void eventListener() {
    setState(() {
      if (_controller.value.hasError)
        debugPrint(
            "CONTROLLER ERROR - ${_controller.value.errorDescription} - init ${_controller.value.isInitialized}");

      if (_controller.value.isInitialized != isPlayerInitialized) {
        isPlayerInitialized = _controller.value.isInitialized;
        debugPrint(
          "CONTROLLER CHANGE INITIALIZED - ${_controller.value.isInitialized}",
        );
        if (isPlayerInitialized) {
          _controller.play();
        }
        firstInit = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
