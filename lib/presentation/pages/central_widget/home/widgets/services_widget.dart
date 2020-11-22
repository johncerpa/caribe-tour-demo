import 'package:cached_network_image/cached_network_image.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:transparent_image/transparent_image.dart';

Widget servicesWidget(BuildContext context) {
  const servSize = 75.0;

  return Column(
    children: [
      SizedBox(
        height: 115,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            Column(children: [
              Container(
                height: servSize,
                width: servSize,
                margin: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://www.lurecartagena.com/wp-content/uploads/2017/04/naval.jpg",
                    imageBuilder: (context, imageProvider) => FadeInImage(
                      fit: BoxFit.fill,
                      placeholder: MemoryImage(kTransparentImage),
                      image: const NetworkImage(
                        "https://cf.bstatic.com/images/hotel/max1024x768/247/247430907.jpg",
                      ),
                      height: 225,
                    ),
                    placeholder: (context, url) => const Center(
                      child: SpinKitWanderingCubes(color: kSecondaryColor),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ), //
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  tr("home.hotel"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                  ),
                ),
              ),
            ]),
            Column(children: [
              Container(
                height: servSize,
                width: servSize,
                margin: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://www.lurecartagena.com/wp-content/uploads/2017/04/naval.jpg",
                    imageBuilder: (context, imageProvider) => FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: MemoryImage(kTransparentImage),
                      image: const NetworkImage(
                        "https://static.betterretailing.com/wp-content/uploads/2019/06/07141525/ATM-rates2.png",
                      ),
                      height: 225,
                    ),
                    placeholder: (context, url) => const Center(
                      child: SpinKitWanderingCubes(color: kSecondaryColor),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Text(
                  tr('home.atm'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                  ),
                ),
              )
            ]),
            Column(children: [
              Container(
                height: servSize,
                width: servSize,
                margin: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://www.lurecartagena.com/wp-content/uploads/2017/04/naval.jpg",
                      imageBuilder: (context, imageProvider) => FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: MemoryImage(kTransparentImage),
                        image: const NetworkImage(
                          'https://www.kienyke.com/sites/default/files/styles/interna_destacada_xl_l_m/public/2020-03/presupuesto_viaje_Colombia_lugares_para_conocer_Colombia.jpg?itok=kZCAonls',
                        ),
                        height: 225,
                      ),
                      placeholder: (context, url) => const Center(
                        child: SpinKitWanderingCubes(color: kSecondaryColor),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Text(
                  tr('home.guides'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                  ),
                ),
              )
            ]),
            Column(children: [
              Container(
                height: servSize,
                width: servSize,
                margin: const EdgeInsets.only(
                  top: 5,
                  left: 5,
                  bottom: 5,
                  right: 7,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://www.lurecartagena.com/wp-content/uploads/2017/04/naval.jpg",
                    imageBuilder: (context, imageProvider) => FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: MemoryImage(kTransparentImage),
                      image: const NetworkImage(
                        "https://static.iris.net.co/dinero/upload/images/2020/7/29/294052_1.jpg",
                      ),
                      height: 225,
                    ),
                    placeholder: (context, url) => const Center(
                      child: SpinKitWanderingCubes(color: kSecondaryColor),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Text(
                  tr('home.bars'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                  ),
                ),
              )
            ]),
            Column(children: [
              Container(
                height: servSize,
                width: servSize,
                margin: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://www.lurecartagena.com/wp-content/uploads/2017/04/naval.jpg",
                    imageBuilder: (context, imageProvider) => FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: MemoryImage(kTransparentImage),
                      image: const NetworkImage(
                        "https://zonacero.com/sites/default/files/styles/1260x720/public/2019/6/11/foto_detalle/render_del_caiman_del_rio.jpg?itok=R9K47ok7",
                      ),
                      height: 225,
                    ),
                    placeholder: (context, url) => const Center(
                      child: SpinKitWanderingCubes(color: kSecondaryColor),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Text(
                  tr('home.food'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                  ),
                ),
              )
            ]),
            Column(
              children: [
                Container(
                  height: servSize,
                  width: servSize,
                  margin: const EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://www.lurecartagena.com/wp-content/uploads/2017/04/naval.jpg",
                      imageBuilder: (context, imageProvider) => FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: MemoryImage(kTransparentImage),
                        image: imageProvider,
                        height: 225,
                      ),
                      placeholder: (context, url) => const Center(
                        child: SpinKitWanderingCubes(color: kSecondaryColor),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    tr('home.museum'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    ],
  );
}

BoxDecoration imageBoxDecoration(String link) {
  return BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.black,
    image: DecorationImage(
      image: NetworkImage(link),
      fit: BoxFit.cover,
    ),
  );
}
