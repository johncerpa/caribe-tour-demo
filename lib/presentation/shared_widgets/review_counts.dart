import 'package:caribe_tour/domain/post/review.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReviewCounts extends StatefulWidget {
  final List<Review> reviews;
  final List<int> cont;
  const ReviewCounts({Key key, this.reviews, this.cont});
  @override
  _ReviewCountsState createState() => _ReviewCountsState();
}

class _ReviewCountsState extends State<ReviewCounts> {
  final int stars = 5;
  final starsize = 22.0;

  @override
  Widget build(BuildContext context) {
    final prom = ((widget.cont[0] * 5 +
                widget.cont[1] * 4 +
                widget.cont[2] * 3 +
                widget.cont[3] * 2 +
                widget.cont[4] * 1) /
            widget.reviews.length)
        .toStringAsFixed(1);
    ;
    return Container(
      height: 120,
      margin: const EdgeInsets.only(left: 5, top: 5, right: 10),
      child: Row(
        children: [
          Column(children: [
            Text(
              widget.reviews.isNotEmpty
                  ? prom //
                      .toString()
                  : "0.0",
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4E89AE),
              ),
            ),
            Text(
              '${widget.reviews.length.toString()} ${tr('places_detail.votes')}',
              style: const TextStyle(color: Colors.grey),
            ),
          ]),
          Expanded(
            child: Column(
              children: [
                for (var j = 0; j < 5; j++)
                  (Row(
                    children: [
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          for (var i = 0; i < stars - j; i++)
                            Icon(Icons.star,
                                size: starsize, color: Color(0xFFED6663)),
                        ],
                      )),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            value: widget.reviews.isEmpty
                                ? 0.0
                                : (widget.cont[j] / widget.reviews.length),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFFFFA372),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.cont[j].toString(),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
