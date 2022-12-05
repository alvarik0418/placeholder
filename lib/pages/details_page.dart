import 'package:flutter/material.dart';
import '../models/models.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Photo photo = ModalRoute.of(context)?.settings.arguments as Photo;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(photo: photo),
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndTitle(photo),
            _Overview(),
            _Overview(),
            _Overview(),
            _Overview(),
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key, required this.photo});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 58, 61, 78),
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Text(
            photo.title,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage('assets/nikon.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle(this.photo, {super.key});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size; //* el tamaño del dispositivo
    print(size);
    print(size.width);

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Hero(
          tag: photo
              .id, //* el detalle es que recibe los id unicos tanto del swiper como del slider
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpeg'),
                image: NetworkImage("${photo.url}.png"),
                height: 150,
                width: 110,
                fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width - 170),
                child: Text(photo.title,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2)),
            Text(
              photo.albumId.toString(),
              style: textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(children: [
              const Icon(Icons.photo_album_outlined,
                  size: 15, color: Colors.green),
              const SizedBox(width: 5),
              Text(
                photo.title.substring(1, 30),
                style: textTheme.caption,
                overflow: TextOverflow.ellipsis,
              )
            ])
          ],
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: const Text(
        "Cupidatat velit cupidatat dolor minim. Labore officia laboris commodo minim irure sit dolor est nulla magna aute pariatur velit. Labore voluptate proident pariatur tempor eiusmod anim in ipsum laborum veniam minim sit.",
        textAlign: TextAlign.justify,
      ),
    );
  }
}
