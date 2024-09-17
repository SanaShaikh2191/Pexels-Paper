import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Wallpaper extends StatefulWidget {
  fetchapi() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'));
  }

  const Wallpaper({super.key});

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: GridView.builder(
                itemCount: 80,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3),
                itemBuilder: ((context, index) {
                  return Container(
                    color: Colors.white,
                  );
                })),
          )),
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.black,
            child: Center(
              child: Text(
                'Load More',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
