import 'package:flutter/material.dart';
import 'package:placeholder/models/models.dart';

class PhotoSlider extends StatefulWidget {
  const PhotoSlider({super.key, required this.photos, this.title});
  final List<Photo> photos;
  final String? title;

  @override
  State<PhotoSlider> createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        print("Repintado");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              widget.title!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.photos.length,
            itemBuilder: (context, index) => _PhotoPoster(
              photo: widget.photos[index],
              photoId: (index + 1).toString(),
            ),
          ),
        )
      ]),
    );
  }
}

class _PhotoPoster extends StatelessWidget {
  const _PhotoPoster({super.key, required this.photo, required this.photoId});
  final Photo photo;
  final String photoId;
  @override
  Widget build(BuildContext context) {
    photo.id = int.parse(photoId);
    return Container(
        width: 130,
        height: 190,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'detail',
                  arguments:
                      photo), //Navigator.pushNamed(context, 'detail', arguments: photo),
              child: Hero(
                tag: photo.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20), // * ClipRRect nos permite agregar bordes rendondeados
                  child: FadeInImage(
                      placeholder: const AssetImage('assets/no-image.jpeg'),
                      image: NetworkImage("${photo.thumbnailUrl}.png"),
                      width: 130,
                      height: 190,
                      fit: BoxFit.cover),
                ),
              )),
          const SizedBox(height: 5),
          Text(
            photo.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ]));
  }
}
