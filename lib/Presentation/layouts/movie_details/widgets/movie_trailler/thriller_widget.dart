import 'package:flutter/material.dart';
import 'package:movies_app/Presentation/layouts/movie_details/provider/trailler_provider.dart';
import 'package:movies_app/core/constants.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ThrillerWidget extends StatefulWidget {
  const ThrillerWidget({super.key, required this.videoKey});
  final String videoKey;
  @override
  State<ThrillerWidget> createState() => _ThrillerWidgetState();
}

class _ThrillerWidgetState extends State<ThrillerWidget> {
  late String videoURL;

  bool fullScreen = false;
  @override
  void initState() {
    videoURL = Constants.youtubeUrl(videoKey: widget.videoKey);
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    youTubecontroller = YoutubePlayerController(
        initialVideoId: videoID ?? "",
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));

    super.initState();
  }

  @override
  void dispose() {
    youTubecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TraillerProvider>(context);
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        width: double.infinity,
        controller: youTubecontroller,
        showVideoProgressIndicator: true,
        aspectRatio: 16 / 9,
        bottomActions: [
          const CurrentPosition(),
          ProgressBar(
            isExpanded: true,
            colors: const ProgressBarColors(
                playedColor: Colors.red, handleColor: Colors.redAccent),
          ),
          const PlaybackSpeedButton(),
          FullScreenButton(
            controller: youTubecontroller,
          )
        ],
      ),
      onEnterFullScreen: () {
        provider.changeIsFullScreen(true);
      },
      onExitFullScreen: () {
        provider.changeIsFullScreen(false);
      },
      builder: (p0, p1) {
        return PopScope(
          onPopInvoked: (didPop) => youTubecontroller.pause(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: provider.isFullScreen
                ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: YoutubePlayer(
                      width: double.infinity,
                      controller: youTubecontroller,
                      showVideoProgressIndicator: true,
                      aspectRatio: 16 / 9,
                      bottomActions: [
                        const CurrentPosition(),
                        ProgressBar(
                          isExpanded: true,
                          colors: const ProgressBarColors(
                              playedColor: Colors.red,
                              handleColor: Colors.redAccent),
                        ),
                        const PlaybackSpeedButton(),
                        const FullScreenButton()
                      ],
                    ),
                  )
                : YoutubePlayer(
                    width: double.infinity,
                    controller: youTubecontroller,
                    showVideoProgressIndicator: true,
                    aspectRatio: 16 / 9,
                    bottomActions: [
                      const CurrentPosition(),
                      ProgressBar(
                        isExpanded: true,
                        colors: const ProgressBarColors(
                            playedColor: Colors.red,
                            handleColor: Colors.redAccent),
                      ),
                      const PlaybackSpeedButton(),
                      const FullScreenButton()
                    ],
                  ),
          ),
        );
      },
    );
  }
}

late YoutubePlayerController youTubecontroller;
