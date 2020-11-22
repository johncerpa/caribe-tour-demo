import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/place/placesdetail/places_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PlaceSearch extends StatelessWidget {
  final Place place;
  final String lang;
  const PlaceSearch({Key key, this.place, this.lang});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width * 0.7,
      height: 120,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 1,
        )
      ]),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(place.imageUrl), fit: BoxFit.fill),
                      color: Colors.black,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        color: Colors.black.withOpacity(0.2)),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: double.infinity,
                          height: 80,
                          child: Column(
                            children: [
                              Row(children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 13,
                                ),
                                Text(
                                  place.rating.toStringAsFixed(1),
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.fade,
                                )
                              ]),
                              SizedBox(
                                width: 120,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 110,
                                      child: Text(
                                        place.department + ", " + place.city,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ))),
          Expanded(
              flex: 6,
              child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            place.name,
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(place.description[lang],
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true)),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    child: PlaceDetail(
                                      canPost: true,
                                      place: place,
                                    ),
                                    type: PageTransitionType.rightToLeft,
                                  ));
                            },
                            child: Text("Ver mas", style: TextStyle(color: kPrimaryColor))),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
