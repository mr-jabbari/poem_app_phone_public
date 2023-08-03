import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../boxes/box_beyt.dart';

class Beyts {
  final String mesra1;
  final String mesra2;
  final String poet;
  final int userId;
  final int beytId;
  final String created_at;
  final bool isLiked;
  final bool isBookmarked;
  final String username;
  final String name;

  Beyts({
    required this.mesra1,
    required this.mesra2,
    required this.poet,
    required this.userId,
    required this.username,
    required this.beytId,
    required this.created_at,
    required this.isBookmarked,
    required this.isLiked,
    required this.name,
  });
}

class ListOfBeyts extends StatefulWidget {
  @override
  _ListOfBeytsState createState() => _ListOfBeytsState();
}

class _ListOfBeytsState extends State<ListOfBeyts> {
  List<Beyts> beyts = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://shahbeyt.iran.liara.run/api/main_beyts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        beyts = jsonData
            .map((data) => Beyts(
                  mesra1: data['mesra1'],
                  mesra2: data['mesra2'],
                  poet: data['poet'],
                  userId: data['user_id'],
                  username: data['username'],
                  beytId: data['id'],
                  created_at: data['created_at'],
                  isBookmarked: data['is_bookmarked'],
                  isLiked: data['is_liked'],
                  name: data['name'],
                ))
            .toList();
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<void> refreshData() async {
    await fetchData();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshData,
      child: ListView.builder(
        itemCount: beyts.length,
        itemBuilder: (BuildContext context, int index) {
          Beyts beyt = beyts[index];

          return Beyt(
            mesra1: beyt.mesra1,
            mesra2: beyt.mesra2,
            poet: beyt.poet,
            user_name: beyt.username,
            user_id: beyt.name,
            user_prof_url: "https://picsum.photos/" + beyt.userId.toString(),
            user_int: beyt.userId,
            isbookmarked: beyt.isBookmarked,
            isliked: beyt.isLiked,
          );
        },
      ),
    );
  }
}
