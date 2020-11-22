import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/presentation/routes/router.gr.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

Widget searchBar(BuildContext context) {
  final TextEditingController _searchTextController = TextEditingController();

  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: TextField(
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.blueGrey[500],
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          hintText: 'Ej. Parque Tayrona',
          suffixIcon: GestureDetector(
            onTap: () {
              if (_searchTextController.text.isNotEmpty) {
                ExtendedNavigator.of(context)
                    .pushSearchPage(word: _searchTextController.text);
              } else {
                FlushbarHelper.createError(
                  message: "No",
                ).show(context);
              }
            },
            child: const Icon(Icons.search),
          ),
          prefixIcon: Icon(Icons.location_on, color: Colors.blueGrey[500]),
          hintStyle: TextStyle(fontSize: 15, color: Colors.blueGrey[300]),
        ),
        controller: _searchTextController,
      ),
    ),
  );
}
