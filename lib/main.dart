import 'package:deckscrollviewsafety/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
const List<String> images = [
  "https://vuabian.com/wp-content/uploads/2021/09/boi-tarot-hang-ngay.jpg.webp",
  "https://vuabian.com/wp-content/uploads/2021/09/tarot-hom-nay.jpg.webp",
  "https://vuabian.com/wp-content/uploads/2021/08/boi-tinh-yeu.jpg.webp",
  "https://vuabian.com/wp-content/uploads/2021/09/boi-tarot-hang-ngay.jpg.webp",
  "https://vuabian.com/wp-content/uploads/2021/09/boi-tarot-hang-ngay.jpg.webp",
  "https://vuabian.com/wp-content/uploads/2021/09/boi-tarot-hang-ngay.jpg.webp",
  "https://vuabian.com/wp-content/uploads/2021/09/boi-tarot-hang-ngay.jpg.webp",
  "https://vuabian.com/wp-content/uploads/2021/09/boi-tarot-hang-ngay.jpg.webp",
];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> imageList =
      List.generate(10, (int index) => images[index % images.length]);
  DeckViewMode deckViewMode = DeckViewMode.deckWhole;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.mode_edit),
              onPressed: () {
                setState(() {
                  deckViewMode = DeckViewMode.values[
                      (DeckViewMode.values.indexOf(deckViewMode) + 1) %
                          DeckViewMode.values.length];
                  if (kDebugMode) {
                    print(deckViewMode);
                  }
                });
              },
            )
          ],
        ),
        body: DeckScrollView.useDelegate(
          layoutPow: 5.0,
          itemExtent: 250,
          deckViewMode: deckViewMode,
          childDelegate: DeckChildBuilderDelegate(
              builder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 3, color: Color(0x44000000))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        child: Image.network(
                          imageList[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              childCount: imageList.length),
        ),
      ),
    );
  }
}
