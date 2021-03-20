import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoContainer extends StatefulWidget {

  const VideoContainer({Key? key, required this.link, this.sound}) : super(key: key);

  final String link;
  final bool? sound;

  @override
  _VideoContainerState createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {

  late final VideoPlayerController _controller;
  late final Future<void> _initializeVideoPlayerFuture;
  double _volume = 0;
  IconData _icon = Icons.volume_off_rounded;
  IconData _playIcon = Icons.play_circle_fill;
  bool _started = false;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("files/${widget.link}");
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _controller.setVolume(_volume);
          // _controller.play();

          return Stack(
            fit: StackFit.expand,
            children: [
              SizedBox.expand(
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        height: _controller.value.size.height,
                        width: _controller.value.size.width,
                        child: GestureDetector(
                          onDoubleTap: (){

                          },
                          child: VideoPlayer(_controller),
                        ),
                      )
                  )
              ),
              // TODO ADD VIDEO TILE
              // Positioned(
              //     bottom: 0,
              //     left:0,
              //     right: 0,
              //     child: Container(
              //       padding: EdgeInsets.all(16),
              //       decoration: BoxDecoration(
              //           gradient: LinearGradient(
              //               begin: AlignmentDirectional.bottomCenter,
              //               end: AlignmentDirectional.topCenter,
              //               colors: [
              //                 Colors.black.withOpacity(.5),
              //                 Colors.black.withOpacity(0)
              //               ]
              //           )
              //       ),
              //       child: Column(
              //         children: [
              //           Text("Week 9, 2021", style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 24
              //           ),)
              //         ],
              //       ),
              //     )
              // ),

              Positioned(
                  bottom: 0,
                  left:0,
                  right:0,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            icon: Icon(_playIcon, color: Colors.white, size: 36,),
                            onPressed: (){
                              setState(() {
                                if (_controller.value.isPlaying){
                                  _controller.pause();
                                } else {
                                  _controller.play();
                                }

                                _playIcon = _playIcon == Icons.pause_circle_filled ?
                                Icons.play_circle_fill :
                                Icons.pause_circle_filled;
                              });
                            }
                        ),
                        Spacer(),
                        IconButton(
                            icon: Icon(_icon, color: Colors.white, size: 36,),
                            onPressed: (){
                              setState(() {
                                _volume = _volume == 0 ? 1 : 0;

                                _icon = _icon == Icons.volume_off_rounded ?
                                Icons.volume_up_rounded :
                                Icons.volume_off_rounded;
                              });
                            }
                        ),

                      ],
                    ),
                  )
              ),
            ],
          );

        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}
