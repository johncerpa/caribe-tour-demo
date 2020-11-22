import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    Key key,
    @required this.placesAddedByUser,
    @required this.placesIgnoredByUser,
  }) : super(key: key);

  final Map<String, Place> placesAddedByUser;
  final Set<String> placesIgnoredByUser;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.5,
      builder: (
        BuildContext context,
        ScrollController scrollController,
      ) {
        return Container(
          padding: const EdgeInsets.only(
            top: 15,
            left: 10,
            right: 10,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 7,
                spreadRadius: 5,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: ListView.separated(
            controller: scrollController,
            itemCount: placesAddedByUser.length + 1,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                // Show title as first list item
                return Column(
                  children: [
                    const Icon(Icons.keyboard_arrow_up),
                    Text(
                      tr('cards.places_added'),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    )
                  ],
                );
              } else {
                final String placeName =
                    placesAddedByUser.entries.elementAt(index - 1).value.name;
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    placesAddedByUser.remove(placeName);
                    placesIgnoredByUser.add(placeName);
                  },
                  background: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          tr('cards.deleting'),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  child: SizedBox(
                    height: 80,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: const Icon(
                            Icons.place,
                            color: kSecondaryColor,
                          ),
                          title: Text(placeName),
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
