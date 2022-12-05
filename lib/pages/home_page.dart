import 'package:flutter/material.dart';
import 'package:placeholder/provider/photos_provider.dart';
import 'package:placeholder/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../provider/users_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getUsersProvider = Provider.of<PhotosProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Placeholder API"),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwiperContainer(photos: getUsersProvider.photoResults),
            PhotoSlider(
              photos: getUsersProvider.photoResults,
              title: "Personajes",
            )
          ],
        ),
      ),
    );
  }
}
