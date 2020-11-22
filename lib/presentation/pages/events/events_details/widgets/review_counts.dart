import 'package:flutter/material.dart';

Widget reviewCounts(BuildContext context) {
  const int stars = 5;
  const starsize = 22.0;
  const num = ["10", "0", "0", "0", "0"];
  const per = [1.0, 0.0, 0.0, 0.0, 0.0];

  return Container(
    height: 120,
    margin: const EdgeInsets.only(left: 5, top: 5, right: 10),
    child: Row(
      children: [
        Column(
          children: [
            Text(
              "5.0",
              style: const TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4E89AE),
              ),
            ),
            Text(
              "10 votos",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Expanded(
          child: Column(
            children: [
              for (var j = 0; j < 5; j++)
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        for (var i = 0; i < stars - j; i++)
                          const Icon(
                            Icons.star,
                            size: starsize,
                            color: Color(0xFFED6663),
                          ),
                      ],
                    )),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          value: per[j],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFFFFA372),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      num[j],
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
            ],
          ),
        )
      ],
    ),
  );
}
