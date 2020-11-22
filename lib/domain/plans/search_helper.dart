import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:google_place/google_place.dart';

///Es una clase helper usada para obtener la respuesta de Places API
class Search {
  final SearchResult searchResult;
  final Uint8List photo;
  final String address;

  Search({
    @required this.searchResult,
    @required this.photo,
    @required this.address,
  });
}
