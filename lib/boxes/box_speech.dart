import 'package:flutter/material.dart';
import '../widgets/MyCostumeIcon.dart';

class Speech extends StatefulWidget {
  final String speech;
  final String user_name;
  final String user_id;
  final String user_prof_url;
  final String wise;
  final int user_int;
  bool isliked;
  bool isbookmarked;

  Speech({
    Key? key,
    required this.speech,
    required this.user_name,
    required this.user_id,
    required this.user_prof_url,
    required this.user_int,
    required this.wise,
    required this.isliked,
    required this.isbookmarked,
  }) : super(key: key);

  @override
  _SpeechState createState() => _SpeechState();
}

class _SpeechState extends State<Speech> {
  bool _isLiked = false;
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.48),
      decoration: BoxDecoration(
        color: Color(0xffECF0F1),
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.user_name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    widget.user_id,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15.0),
              CircleAvatar(
                radius: 22.0,
                backgroundImage: NetworkImage(widget.user_prof_url),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.end,
            widget.speech,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Text(
            textAlign: TextAlign.end,
            widget.wise,
            style: TextStyle(fontSize: 16.0),
          ),
          // SizedBox(height: 5.0),
          // Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                iconSize: 18,
                icon: Icon(
                  Icons.share,
                  color: Color(0xff05F0E4),
                ),
                onPressed: () {},
              ),
              IconButton(
                  icon: _isBookmarked
                      ? MyCoustomeIcons(
                      iconName: "bookmarked", color: 0xffC5BE6A, size: 22)
                      : MyCoustomeIcons(
                      iconName: "bookmark_b", color: 0xff05F0E4, size: 22),
                  onPressed: () {
                    setState(() {
                      _isBookmarked = !_isBookmarked;
                    });
                  }),
              IconButton(
                  icon: _isLiked
                      ? MyCoustomeIcons(
                      iconName: "liked", color: 0xffC5BE6A, size: 22)
                      : MyCoustomeIcons(
                      iconName: "like_b", color: 0xff05F0E4, size: 22),
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  }),
              IconButton(
                icon: MyCoustomeIcons(iconName: "comment_b", color: 0xffC5BE6A, size: 22), onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
