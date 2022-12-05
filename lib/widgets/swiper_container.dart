import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class SwiperContainer extends StatelessWidget {
  const SwiperContainer({super.key, required this.photos});
  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (photos.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 20,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.77,
        itemHeight: size.height * 0.42,
        itemBuilder: (context, index) {
          final photo = photos[index];

          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'detail', arguments: photo),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpeg'),
                image: NetworkImage("${photo.url}.png"),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
