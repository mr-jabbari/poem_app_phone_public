import 'package:flutter/material.dart';
import 'package:poem_app_phone/boxes/box_poem.dart';

class Poems {
  final String beyt1_1;
  final String beyt1_2;
  final String beyt2_1;
  final String beyt2_2;
  final String beyt3_1;
  final String beyt3_2;
  final String poet;
  final String user_name;
  final int user_int;
  final String user_id;
  final String user_prof_url;
  final bool isliked;
  final bool isbookmarked;

  Poems({
    required this.beyt1_1,
    required this.beyt1_2,
    required this.beyt2_1,
    required this.beyt2_2,
    required this.beyt3_1,
    required this.beyt3_2,
    required this.poet,
    required this.user_name,
    required this.user_id,
    required this.user_int,
    required this.user_prof_url,
    required this.isbookmarked,
    required this.isliked,
  });
}

class LikedListOfPoems extends StatelessWidget {
  final List<Poems> poems = [
    Poems(
      beyt1_1: "بی‌دل گمان مبر که نصیحت کند قبول",
      beyt1_2: "من گوش استماع ندارم لمن تقول",
      beyt2_1: "تا عقل داشتم نگرفتم طریق عشق",
      beyt2_2: "جایی دلم برفت که حیران شود عقول",
      beyt3_1: "ای پیک نامه‌بر که خبر می‌بری به دوست",
      beyt3_2: "یالیت اگر به جای تو من بودمی رسول",
      user_name: "شاه بیت",
      user_id: "@shah_beyt",
      user_prof_url: "https://picsum.photos/200/200",
      user_int: 1,
      poet: "سعدی",
      isbookmarked: true,
      isliked: false,
    ),
    Poems(
      beyt1_1: "وای اگر مَرد گدا یک شبه سلطان بشود",
      beyt1_2: "مثل اینست که گرگی سگ چوپان بشود",
      beyt2_1: "هرکجا هُدهُد دانا برَوَد کُنج قفس",
      beyt2_2: "جغد ویرانه نشین مرشد مرغان بشود",
      beyt3_1: "ناخدا دلخوش این آبی آرام نباش",
      beyt3_2: "وای از آن لحظه که هنگامه ی طوفان بشوَد",
      user_name: "شاه بیت",
      user_id: "@shah_beyt",
      user_prof_url: "https://picsum.photos/200/200",
      user_int: 1,
      poet: "مقتدا هاشمی",
      isbookmarked: true,
      isliked: false,
    ),
    Poems(
      beyt1_1: "واعظی پرسید ازفرزندخویش",
      beyt1_2: "هیچ میدانی مسلمانی به چیست",
      beyt2_1: "صدق وبی آزاری وخدمت به خلق",
      beyt2_2: "هم عبادت هم کلید بندگیست",
      beyt3_1: "گفت زین معیار اندرشهرما",
      beyt3_2: "یک مسلمان هست،آن هم ارمنیست",
      user_name: "شاه بیت",
      user_id: "@shah_beyt",
      user_prof_url: "https://picsum.photos/200/200",
      user_int: 1,
      poet: "ناشناس",
      isbookmarked: true,
      isliked: false,
    ),
    Poems(
      beyt1_1: "دیدم‌ت با تارهای مو که بر پیشانی‌ات...",
      beyt1_2: "با همان شلوار جین و عینک و بارانی‌ات",
      beyt2_1: "شعر می‌خواندی و می‌خندیدی و من گیج و مات",
      beyt2_2: "محو بودم در تو و آن لهجه‌ی تهرانی‌ات:",
      beyt3_1: "\"ای دل اندر بند زلفش از پریشانی منال\"",
      beyt3_2: "وای! می‌میرم من ازاین‌گونه حافظ خوانی‌ات",
      user_name: "شاه بیت",
      user_id: "@shah_beyt",
      user_prof_url: "https://picsum.photos/200/200",
      user_int: 1,
      poet: "پاییز رحیمی",
      isbookmarked: true,
      isliked: false,
    ),
    Poems(
      beyt1_1: "حَقّ را بِطلب، مَسجد و مِیخانه کدام است؟",
      beyt1_2: "از بادِه بگو، شیشه و پِیمانه کدام است؟",
      beyt2_1: "محرابِ دل آن جلوه یِ آغوش فَریب است",
      beyt2_2: "نشناخته ام کَعبه و بُتخانه کدام است؟",
      beyt3_1: "از صحبتِ صوفی مَنشان سوخت دِماغم",
      beyt3_2: "ای بادِه پَرستان، رَهِ مِیخانه کدام است؟",
      user_name: "شاه بیت",
      user_id: "@shah_beyt",
      user_prof_url: "https://picsum.photos/200/200",
      user_int: 1,
      poet: "حزین لاهیجی",
      isbookmarked: true,
      isliked: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: poems.length,
      itemBuilder: (BuildContext context, int index) {
        Poems poem = poems[index];

        return Poem(beyt1_1: poem.beyt1_1,
            beyt1_2: poem.beyt1_2,
            beyt2_1: poem.beyt2_1,
            beyt2_2: poem.beyt2_2,
            beyt3_1: poem.beyt3_1,
            beyt3_2: poem.beyt3_2,
            user_name: poem.user_name,
            user_id: poem.user_id,
            user_prof_url: poem.user_prof_url,
            user_int: poem.user_int,
            poet: poem.poet,
            isliked: poem.isliked,
            isbookmarked: poem.isbookmarked);
      },
    );
  }
}