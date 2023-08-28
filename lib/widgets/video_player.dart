import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    super.key,
    this.urlVideo,
    this.bottomLeft = 30,
    this.bottomRight = 30,
    this.topLeft = 30,
    this.topRight = 30,
  });

  final String? urlVideo;
  final double? bottomLeft;
  final double? bottomRight;
  final double? topLeft;
  final double? topRight;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  Timer? _timer;
  Timer? _hideIconTimer;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.urlVideo!))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _isPlaying = false;
        });
      });
  }

  // Future<void> _playForLimitedTime() async {
  //   setState(() {
  //     _isPlaying = true;
  //   });
  //   await _controller.play();
  //   await Future.delayed(const Duration(seconds: 30));
  //   setState(() {
  //     _isPlaying = false;
  //   });
  //   await _controller.pause();
  //   await _controller.seekTo(Duration.zero);
  // }

  void _toggleVideoPlayback() {
    if (_controller.value.isPlaying) {
      setState(() {
        _isPlaying = false;
      });
      _controller.pause();
      _startHideIconTimer();
    } else {
      setState(() {
        _isPlaying = true;
      });
      _controller.play();
    }
  }

  void _startHideIconTimer() {
    _hideIconTimer = Timer(const Duration(seconds: 1), () {
      // Después de 1 segundo, oculta el icono de pausa
      setState(() {
        _hideIconTimer = null;
      });
    });
  }

  void _cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    _hideIconTimer?.cancel();
    super.dispose();
    _cancelTimer();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: _controller.value.isInitialized
          ? GestureDetector(
              onTap: () {
                setState(() {
                  _toggleVideoPlayback();
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(widget.bottomLeft!),
                      bottomRight: Radius.circular(widget.bottomRight!),
                      topLeft: Radius.circular(widget.topLeft!),
                      topRight: Radius.circular(widget.topRight!),
                    ),
                    child: AspectRatio(
                      aspectRatio: 0.66,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  _controller.value.isPlaying && _hideIconTimer == null
                      ? const SizedBox.shrink()
                      : Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                          size: 120.0,
                          color: Colors.white38,
                        ),
                  // si ya llego al final icon repeat
                  _controller.value.position == _controller.value.duration
                      ? const Icon(
                          Icons.repeat,
                          size: 120.0,
                          color: Colors.white38,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            )
          // loading
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
