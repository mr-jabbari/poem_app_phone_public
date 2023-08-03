import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BeytDataPage extends StatefulWidget {
  @override
  _BeytDataPageState createState() => _BeytDataPageState();
}

class _BeytDataPageState extends State<BeytDataPage> {
  TextEditingController mesra1Controller = TextEditingController();
  TextEditingController mesra2Controller = TextEditingController();
  TextEditingController poetController = TextEditingController();
  String? selectedStart;
  String? selectedEnd;

  final Map<String, int> ALPHABET = {
    "الف": 1,
    "ب": 2,
    "پ": 3,
    "ت": 4,
    "ث": 5,
    "ج": 6,
    "چ": 7,
    "ح": 8,
    "خ": 9,
    "د": 10,
    "ذ": 11,
    "ر": 12,
    "ز": 13,
    "ژ": 14,
    "س": 15,
    "ش": 16,
    "ص": 17,
    "ض": 18,
    "ط": 19,
    "ظ": 20,
    "ع": 21,
    "غ": 22,
    "ف": 23,
    "ق": 24,
    "ک": 25,
    "گ": 26,
    "ل": 27,
    "م": 28,
    "ن": 29,
    "و": 30,
    "ه": 31,
    "ی": 32,
  };

  void sendData() async {
    String mesra1 = mesra1Controller.text;
    String mesra2 = mesra2Controller.text;
    String poet = poetController.text;
    int? start = ALPHABET[selectedStart];
    int? end = ALPHABET[selectedEnd];

    // Check if start and end values are within the desired range
    if (start == null || end == null) {
      print('Invalid start or end value');
      return;
    }

    // Make an HTTP request to your Flask API endpoint to send the data
    var url = Uri.parse('YOUR_FLASK_API_ENDPOINT');
    var response = await http.post(url, body: {
      'mesra1': mesra1,
      'mesra2': mesra2,
      'poet': poet,
      'start': start.toString(),
      'end': end.toString(),
    });

    // Handle the response from the Flask app
    if (response.statusCode == 200) {
      // Data sent successfully
      print('Data sent successfully');
    } else {
      // Failed to send data
      print('Failed to send data. Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'اضافه کردن بیت',
              textDirection: TextDirection.ltr,
            ),
          ],
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: mesra1Controller,
                decoration: InputDecoration(
                  labelText: 'مصراع اول',
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: mesra2Controller,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  labelText: 'مصراع دوم',
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: poetController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  labelText: 'شاعر',
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.40,
                    child: DropdownButtonFormField<String>(
                      iconEnabledColor: Colors.teal,
                      value: selectedStart,
                      items: ALPHABET.keys.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            textDirection: TextDirection.rtl,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedStart = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'شروع از',
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.40,
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      iconEnabledColor: Colors.teal,
                      value: selectedEnd,
                      items: ALPHABET.keys.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            textDirection: TextDirection.rtl,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedEnd = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'تا',
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: sendData,
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.teal),
                ),
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Text(
                    'ارسال',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
