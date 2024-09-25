import 'package:flutter/material.dart';
import 'package:subsonic_api/subsonic_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final navKey = GlobalKey<NavigatorState>();

final testSalt = createSalt();
final testToken = createToken(dotenv.env['PASSWD']!, testSalt);

List<SubSonicClient> clients = [
  SubSonicClient('https://music.soncore.net', 'test', testToken, testSalt,
      'Soncore', '1.0.0')
];

Future<void> loadClients() async {
  final prefs = await SharedPreferences.getInstance();
  final rawClients = prefs.getStringList('Clients') ?? [];
  for (var rawClient in rawClients) {
    final data = rawClient.split('~');
    clients.add(
        SubSonicClient(data[0], data[1], data[2], data[3], data[4], data[5]));
  }
}

Future<void> updateClients() async {
  final prefs = await SharedPreferences.getInstance();
  final List<String> newRawClients = [];
  for (var client in clients) {
    newRawClients.add(client.toString());
  }
  prefs.setStringList('Clients', newRawClients);
}

Future<void> createClient(BuildContext context, String url, String clientName,
    String username, String password) async {
  String salt = createSalt();
  String token = createToken(password, salt);

  final SubSonicClient client =
      SubSonicClient(url, username, token, salt, clientName, '1.0.0');

  final response = await client.ping();
  if (response.status == 'ok') {
    clients.add(client);
    updateClients();
    // print(response.status);
  }
  final snackBar = SnackBar(content: Text(response.status));
  if (context.mounted) {
    ScaffoldMessenger.maybeOf(context)!.showSnackBar(snackBar);
  }
}

class AppPlaylist extends Playlist {
  final SubSonicClient client;
  final Playlist playlist;

  AppPlaylist(this.playlist, {required this.client})
      : super(
            id: playlist.id,
            name: playlist.name,
            changed: playlist.changed,
            comment: playlist.comment,
            coverArt: playlist.coverArt,
            created: playlist.created,
            duration: playlist.duration,
            public: playlist.public,
            songCount: playlist.songCount,
            owner: playlist.owner,
            songs: playlist.songs);
}

Future<List<AppPlaylist>> loadPlaylists() async {
  List<AppPlaylist> list = [];
  for (var client in clients) {
    final response = await client.getPlaylists();
    for (var playlist in response) {
      list.add(AppPlaylist(playlist, client: client));
    }
  }
  return list;
}

Future<List<Artist>> loadArtists() async {
  List<Artist> list = [];
  for (var client in clients) {
    final response = await client.getArtists();
    list.addAll(response);
  }
  return list;
}

// class CoverArt extends StatelessWidget {
//   const CoverArt({super.key, required this.client, required this.coverId, required this.size});

//   final SubSonicClient client;
//   final String coverId;
//   final int size;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: client.getCover(coverId, size),
//       builder: (context, snapshot) {
//         return Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             image: DecorationImage(
//               image: MemoryImage(snapshot.data!),
//               fit: BoxFit.scaleDown
//             )
//           ),
//         );
//       }
//     );
//   }
// }

class CoverArt extends StatelessWidget {
  const CoverArt(
      {super.key,
      required this.client,
      required this.coverId,
      required this.size});

  final SubSonicClient client;
  final String coverId;
  final int size;

  @override
  Widget build(BuildContext context) {
    final data = client.toString().split('~');
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                  '${data[0]}/rest/getCoverArt.view?u=${data[1]}&t=${data[2]}&s=${data[3]}&c=${data[4]}&v=${data[5]}&id=$coverId&size=$size&f=json'),
              fit: BoxFit.scaleDown)),
    );
  }
}
