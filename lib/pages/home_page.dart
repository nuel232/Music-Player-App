import 'package:flutter/material.dart';
import 'package:music_player/components/my_drawer.dart';
import 'package:music_player/model/playlist_privider.dart';
import 'package:music_player/model/song.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text('P L A Y L I S T'), centerTitle: true),
      drawer: MyDrawer(),
      body: Consumer<PlaylistPrivider>(
        builder: (context, value, child) {
          //get the playlist
          final List<Song> playlist = value.playlist;

          //return list view
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) => ListTile(),
          );
        },
      ),
    );
  }
}
