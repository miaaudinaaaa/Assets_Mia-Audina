import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageSliderScreen(),
    );
  }
}

class ImageSliderScreen extends StatefulWidget {
  @override
  _ImageSliderScreenState createState() => _ImageSliderScreenState();
}

class _ImageSliderScreenState extends State<ImageSliderScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // Halaman aktif

  // Daftar URL gambar dari internet
  final List<String> images = [
    'https://i.pinimg.com/736x/67/05/3a/67053add2224499e2b532c0e07eecd52.jpg',
    'https://i.pinimg.com/736x/88/2b/92/882b9269a596bcd7bef3b2d9a6759706.jpg',
    'https://i.pinimg.com/736x/53/0e/ec/530eec9d2c45f451ad2b5d222f4f1ad3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mia Audina'),
        backgroundColor: const Color.fromARGB(255, 255, 193, 213),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: images.map((image) {
                  return Image.network(
                    image,
                    fit: BoxFit.cover,
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? const Color.fromARGB(255, 255, 158, 190)
                      : Colors.grey,
                ),
              );
            }),
          ),
        ],
     ),
);
}
}
