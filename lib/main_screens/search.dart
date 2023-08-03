// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
//
// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   TextEditingController _searchController = TextEditingController();
//
//   List<String> _searchResults = [];
//
//   void _search() {
//     setState(() {
//       // Perform your search logic here, updating _searchResults with the results
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text('جستجو'),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: _search,
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: CupertinoTextField(
//               controller: _searchController,
//               placeholder: '...جستجو',
//               prefix: Padding(
//                 padding: EdgeInsets.only(left: 8),
//                 child: Icon(CupertinoIcons.search),
//               ),
//               onSubmitted: (query) {
//                 _search();
//               },
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _searchResults.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(_searchResults[index]),
//                   onTap: () {
//                     // Handle the result being tapped
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'book'; // Default selected category

  List<String> _searchResults = [];

  void _search() async {
    String query = _searchController.text.trim();

    if (query.isNotEmpty) {
      String baseUrl = 'http://my_website/search$_selectedCategory/';
      String encodedQuery = Uri.encodeComponent(query);
      String url = '$baseUrl$encodedQuery';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          _searchResults = json.decode(response.body);
        });
      } else {
        // Handle error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('جستجو'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _search,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: CupertinoTextField(
              controller: _searchController,
              placeholder: '...جستجو',
              prefix: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(CupertinoIcons.search),
              ),
              onSubmitted: (query) {
                _search();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryButton('بیت'),
                _buildCategoryButton('شعر'),
                _buildCategoryButton('سخن'),
                _buildCategoryButton('داستان'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_searchResults[index]),
                  onTap: () {
                    // Handle the result being tapped
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    bool isSelected = _selectedCategory == category;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedCategory = category;
        });
      },
      style: ButtonStyle(
        backgroundColor: isSelected
            ? MaterialStateProperty.all<Color>(Color(0xFFC5BE6A))
            : MaterialStateProperty.all<Color>(Colors.teal),
      ),
      child: Text(category),
    );
  }
}
