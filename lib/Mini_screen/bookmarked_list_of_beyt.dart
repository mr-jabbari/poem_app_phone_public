import 'package:flutter/material.dart';
import 'package:poem_app_phone/boxes/box_beyt.dart';

class Beyts {
  final String mesra1;
  final String mesra2;
  final String poet;
  final String user_name;
  final int user_int;
  final String user_id;
  final String user_prof_url;
  final bool isliked;
  final bool isbookmarked;

  Beyts({
    required this.mesra1,
    required this.mesra2,
    required this.poet,
    required this.user_name,
    required this.user_id,
    required this.user_int,
    required this.user_prof_url,
    required this.isbookmarked,
    required this.isliked,
  });
}

class BookmarkedListOfBeyts extends StatelessWidget {
  final List<Beyts> beyts = [
    Beyts(
      mesra1: "گل دربر و می برلب و معشوق به کام است",
      mesra2: "سلطان جهان هم به چنین روز غلام است",
      user_name: "شاه بیت",
      user_id: "@shah_beyt",
      user_prof_url: "https://picsum.photos/200/200",
      user_int: 1,
      poet: "حافظ",
      isbookmarked: false,
      isliked: true,
    ),
    Beyts(
      mesra1: "جماعتی که نظر را حرام میگویند",
      mesra2: "نظر حرام بکردند و خون خاق حلال",
      user_name: "شاه بیت",
      user_id: "@shah_beyt",
      user_prof_url: "https://picsum.photos/200/201",
      user_int: 1,
      poet: "سعدی",
      isbookmarked: false,
      isliked: false,
    ),
    Beyts(
      mesra1: "تمام عمر خندیدم به این عاشق به آن عاشق",
      mesra2: "چنان عشقی سرم آمد که دیگر من نمیخندم",
      user_name: "امیر تنها",
      user_id: "@tanha1358",
      user_prof_url: "https://picsum.photos/200/202",
      user_int: 5,
      poet: "ناشناس",
      isbookmarked: false,
      isliked: false,
    ),
    Beyts(
      mesra1: "سحر ز سجده بت باز ماندم از مستی",
      mesra2: "به عمر خویش گناهی که کرده ام این است",
      user_name: "Hasan Jabbari",
      user_id: "@jabbari79",
      user_prof_url: "https://picsum.photos/200/203",
      user_int: 2,
      poet: "شایان مصلح",
      isbookmarked: true,
      isliked: true,
    ),
    Beyts(
      mesra1: "عطر آغوش تو را حس میکنم هر شب که من",
      mesra2: "سر به بالین میگذارم بی تو در ویرانه ای",
      user_name: "حسین",
      user_id: "@hosein",
      user_prof_url: "https://picsum.photos/200/204",
      user_int: 3,
      poet: "شاکری",
      isbookmarked: true,
      isliked: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: beyts.length,
      itemBuilder: (BuildContext context, int index) {
        Beyts beyt = beyts[index];

        return Beyt(
          mesra1: beyt.mesra1,
          user_name: beyt.user_name,
          user_id: beyt.user_id,
          user_prof_url: beyt.user_prof_url,
          user_int: beyt.user_int,
          poet: beyt.poet,
          mesra2: beyt.mesra2,
          isbookmarked: beyt.isbookmarked,
          isliked: beyt.isliked,
        );
      },
    );
  }
}
