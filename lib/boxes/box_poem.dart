import 'package:flutter/material.dart';

import '../widgets/MyCostumeIcon.dart';



class Poem extends StatefulWidget {
  final String beyt1_1;
  final String beyt1_2;
  final String beyt2_1;
  final String beyt2_2;
  final String beyt3_1;
  final String beyt3_2;
  final String user_name;
  final String user_id;
  final String user_prof_url;
  final String poet;
  final int user_int;
  bool isliked;
  bool isbookmarked;

  Poem({
    Key? key,
    required this.beyt1_1,
    required this.beyt1_2,
    required this.beyt2_1,
    required this.beyt2_2,
    required this.beyt3_1,
    required this.beyt3_2,
    required this.user_name,
    required this.user_id,
    required this.user_prof_url,
    required this.user_int,
    required this.poet,
    required this.isliked,
    required this.isbookmarked,
  }) : super(key: key);

  @override
  _PoemState createState() => _PoemState();
}

class _PoemState extends State<Poem> {
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
            widget.beyt1_1,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Text(
            textAlign: TextAlign.end,
            widget.beyt1_2,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Text(
            textAlign: TextAlign.end,
            widget.beyt2_1,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Text(
            textAlign: TextAlign.end,
            widget.beyt2_2,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Text(
            textAlign: TextAlign.end,
            widget.beyt3_1,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Text(
            textAlign: TextAlign.end,
            widget.beyt3_2,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Text(
            textAlign: TextAlign.end,
            widget.poet,
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
