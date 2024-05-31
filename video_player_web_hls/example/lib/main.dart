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
  double playerVolume = 0.0;

  @override
  void initState() {
    super.initState();
    try {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(
            'https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8'),
      )..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
      _controller.setLooping(true);
      _controller.addListener(eventListener);
      _controller.setVolume(0.0);
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
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller, key: key),
                )
              : Container(),
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

  Future<void> changeUrl(String? url, {bool firstRequest = true}) async {
    debugPrint("CAMBIO URL - firstRequest $firstRequest");
    if (firstRequest) {
      playerVolume = _controller.value.volume;
    }
    _controller.setVolume(0.0);
    await _controller.changeVideoUrl(url ?? _controller.dataSource);

    if (!firstRequest) {
      _controller.setVolume(playerVolume);
      setState(() {});
    }
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
          debugPrint("PLAY - $playerVolume");
          _controller.setVolume(playerVolume);
          _controller.play();
        } else {
          changeUrl(null, firstRequest: false);
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
