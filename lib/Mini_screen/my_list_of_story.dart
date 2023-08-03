import 'package:flutter/material.dart';
import 'package:poem_app_phone/boxes/box_story.dart';

class Stories {
  final String title;
  final String story;
  final String writer;
  final String user_name;
  final int user_int;
  final String user_id;
  final String user_prof_url;
  final bool isliked;
  final bool isbookmarked;

  Stories({
    required this.title,
    required this.story,
    required this.writer,
    required this.user_name,
    required this.user_id,
    required this.user_int,
    required this.user_prof_url,
    required this.isbookmarked,
    required this.isliked,
  });
}

class MyListOfStories extends StatelessWidget {
  final List<Stories> stories = [
    Stories(
      title: "خواستگاری از آلبرت اینشتین",
      story:
      """مریلین مونرو نامه‌ای به آلبرت اینشتین نوشت که من و تو ازدواج کنیم بچه‌هایمان با زیبایی من و هوش و نبوغ تو چه محشری می‌شوند.
      آقای اینشتین هم نوشت: از این همه لطف و دست و دلبازی شما ممنونم.
      واقعاً غوغا می‌شود.
      ولی این یک روی سکه است.
      فکرش را بکنید که اگر قضیه بر عکس شود چه رسوایی بزرگی برپا می‌شود.""",
      user_name: "شاه بیت",
      user_id: "@shah_beyt",
      user_prof_url: "https://picsum.photos/200/200",
      user_int: 1,
      writer: "ناشناس",
      isbookmarked: false,
      isliked: true,
    ),
    Stories(
      title: "مجازات شغالان",
      story: """شبی آقا محمدخان قاجار نتوانست از زوزه شغالان بخوابد.
      صبح که از خواب برخاست مشاورانش را فراخواند و از آنها کیفری بایسته را برای شغالان طلب کرد.
هر یک کیفری سخت را برای شغالان پیشنهاد کردند. اما او هیچ یک را نپسندید و مجازاتی سخت‌تر را برای شغالان جستجو می‌کرد.
دستور داد تمامی شغالانی که در آن حوالی یافت می‌شدند را بیابند و زنده به حضورش آورند.
وقتی شغالان را به حضورش آوردند، بر گردن تمامی آنها زنگوله‌ای آویخت و آنها را دوباره در صحرا رها کرد.
طعمه‌ها از صدای زنگوله شغالان می‌گریختند و هیچ یک نتوانستند طعمه‌ای شکار کنند.
چند روزی بدین نحو سپری شد تا همگی از گرسنگی مُردند.""",
      user_name: "شاه بیت",
      user_id: "@shah_beyt",
      user_prof_url: "https://picsum.photos/200/200",
      user_int: 1,
      writer: "ایران در دوره سلطنت قاجار، علی اصغر شمیم",
      isbookmarked: false,
      isliked: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stories.length,
      itemBuilder: (BuildContext context, int index) {
        Stories story = stories[index];

        return Story(
            title: story.title,
            user_name: story.user_name,
            user_id: story.user_id,
            user_prof_url: story.user_prof_url,
            user_int: story.user_int,
            writer: story.writer,
            story: story.story,
            isliked: story.isliked,
            isbookmarked: story.isbookmarked);
      },
    );
  }
}
