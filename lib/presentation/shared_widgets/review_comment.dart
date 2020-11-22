import 'package:cached_network_image/cached_network_image.dart';
import 'package:caribe_tour/domain/post/review.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ReviewComment extends StatelessWidget {
  final Review review;
  const ReviewComment({Key key, @required this.review});

  @override
  Widget build(BuildContext context) {
    print(review);
    return SizedBox(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                )
              ],
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      review.userName,
                      style: const TextStyle(
                        color: Color(0xFF4E89AE),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  child: Row(
                    children: [
                      for (var i = 0; i < 5; i++)
                        Icon(
                          Icons.star,
                          size: 15,
                          color: i < int.parse(review.rating.round().toString())
                              ? Color(0xFFED6663)
                              : Colors.grey,
                        ),
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(review.comment, textAlign: TextAlign.justify),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10),
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 0.4,
                  offset: Offset(1, 1),
                  spreadRadius: 0.5,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: review.img,
                imageBuilder: (context, imageProvider) => FadeInImage(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(review.img),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
