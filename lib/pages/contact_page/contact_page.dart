

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:portfoli/pages/footer_section.dart';
import 'package:portfoli/utils/responsive.dart';
import 'package:portfoli/widgets/secation_header.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../header_section.dart';
import 'contact_card.dart';
import 'contact_form.dart';

class ContactPage extends StatelessWidget {
  static const routeName = "contact-page";
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    buildCard(){
      return  Padding(
        padding: AppPadding(context: context).mainPadding(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            width >= 850
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: ContactCard()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .06),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius:
                     const     BorderRadius.all(Radius.circular(200))),
                      height: height * .4,
                      width: 4,
                    ),
                  ),
                ),
              const  Expanded(child: ContactForm())
              ],
            )
                : Column(
              children: [
               const ContactCard(),
                SizedBox(
                  height: height * .03,
                ),
                const ContactForm()
              ],
            ),
            SizedBox(
              height: height * .1,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      drawer:  BuildDrawer(),
      appBar: buildAppBar(context, width),
      body: SingleChildScrollView(
        child: Column(
          children:  [
           const SectionHeader(
              title: "Contact Me",
              subTitle: "Get in touch",
            ),
           buildCard(),
            MyMapLocation(),
            FooterSection(),

          ],
        ),
      ),
    );
  }
}

class MyMapLocation extends StatelessWidget {
  const MyMapLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GoogleMapController mapController;

    final LatLng _center = const LatLng(45.521563, -122.677433);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );


  }
}


