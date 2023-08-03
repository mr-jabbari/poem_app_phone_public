import 'package:flutter/material.dart';
import 'package:poem_app_phone/boxes/box_speech.dart';

class Speechs {
  final String speech;
  final String wise;
  final String user_name;
  final int user_int;
  final String user_id;
  final String user_prof_url;
  final bool isliked;
  final bool isbookmarked;

  Speechs({
    required this.speech,
    required this.wise,
    required this.user_name,
    required this.user_id,
    required this.user_int,
    required this.user_prof_url,
    required this.isbookmarked,
    required this.isliked,
  });
}

class MyListOfSpeechs extends StatelessWidget {
  final List<Speechs> speechs = [
    Speechs(
      speech: "به گرسنگی مردن بهتر که نان فرو مایگان خوردن",
      user_name: "شاه بیت",
      user_id: "@shah_beyt",
      user_prof_url: "https://picsum.photos/200/200",
      user_int: 1,
      wise: "سعدی",
      isbookmarked: false,
      isliked: true,
    ),
    // Speechs(
    //   speech: "",
    //   user_name: "شاه بیت",
    //   user_id: "@shah_beyt",
    //   user_prof_url: "https://picsum.photos/200/200",
    //   user_int: 1,
    //   wise: "",
    //   isbookmarked: true,
    //   isliked: false,
    // ),Speechs(
    //   speech: "",
    //   user_name: "شاه بیت",
    //   user_id: "@shah_beyt",
    //   user_prof_url: "https://picsum.photos/200/200",
    //   user_int: 1,
    //   wise: "",
    //   isbookmarked: true,
    //   isliked: false,
    // ),Speechs(
    //   speech: "",
    //   user_name: "شاه بیت",
    //   user_id: "@shah_beyt",
    //   user_prof_url: "https://picsum.photos/200/200",
    //   user_int: 1,
    //   wise: "",
    //   isbookmarked: true,
    //   isliked: false,
    // ),Speechs(
    //   speech: "",
    //   user_name: "شاه بیت",
    //   user_id: "@shah_beyt",
    //   user_prof_url: "https://picsum.photos/200/200",
    //   user_int: 1,
    //   wise: "",
    //   isbookmarked: true,
    //   isliked: false,
    // ),Speechs(
    //   speech: "",
    //   user_name: "شاه بیت",
    //   user_id: "@shah_beyt",
    //   user_prof_url: "https://picsum.photos/200/200",
    //   user_int: 1,
    //   wise: "",
    //   isbookmarked: true,
    //   isliked: false,
    // ),Speechs(
    //   speech: "",
    //   user_name: "شاه بیت",
    //   user_id: "@shah_beyt",
    //   user_prof_url: "https://picsum.photos/200/200",
    //   user_int: 1,
    //   wise: "",
    //   isbookmarked: true,
    //   isliked: false,
    // ),Speechs(
    //   speech: "",
    //   user_name: "شاه بیت",
    //   user_id: "@shah_beyt",
    //   user_prof_url: "https://picsum.photos/200/200",
    //   user_int: 1,
    //   wise: "",
    //   isbookmarked: true,
    //   isliked: false,
    // ),Speechs(
    //   speech: "",
    //   user_name: "شاه بیت",
    //   user_id: "@shah_beyt",
    //   user_prof_url: "https://picsum.photos/200/200",
    //   user_int: 1,
    //   wise: "",
    //   isbookmarked: true,
    //   isliked: false,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: speechs.length,
      itemBuilder: (BuildContext context, int index) {
        Speechs speech = speechs[index];

        return Speech(
            speech: speech.speech,
            user_name: speech.user_name,
            user_id: speech.user_id,
            user_prof_url: speech.user_prof_url,
            user_int: speech.user_int,
            wise: speech.wise,
            isliked: speech.isliked,
            isbookmarked: speech.isbookmarked);
      },
    );
  }
}
