import 'package:absolute_stay_site/usable/PropertySpecification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../../model/favModel.dart';
import '../../../model/propertyModel.dart';
import 'propertySpecWeb.dart';

class PropertyDetailPageWeb extends StatefulWidget {
  const PropertyDetailPageWeb({super.key});

  @override
  State<PropertyDetailPageWeb> createState() => _PropertyDetailPageWebState();
}

class _PropertyDetailPageWebState extends State<PropertyDetailPageWeb> {
  List<String> imageList = [
    'images/image1.png',
    'images/image2.png',
    'images/image3.png',
    'images/image4.png',
  ];
   final FirebaseAuth _auth = FirebaseAuth.instance;

bool isfetching = false;

  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  double starRating = 4.5; // Set your initial star rating here

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
  Future<PropertyModel?> fetchPropertyData() async {
  try {
    DocumentSnapshot propertySnapshot = await FirebaseFirestore.instance
        .collection('Property')
        .doc('widget.ProppId')
        .get();

    if (propertySnapshot.exists) {
       setState(() {
    isfetching=true;

  });
      return PropertyModel.fromMap(propertySnapshot.id, propertySnapshot.data() as Map<String, dynamic>);
    } else {
      return null; // Property not found
    }
  } catch (e) {
    print('Error fetching property data: $e');
    // Handle the error as needed
    return null;
  }
}

PropertyModel? propertitem;
void getProperty()async{
 propertitem = await fetchPropertyData();

if (propertitem != null) {
  setState(() {
    isfetching=true;

  });
 
}}

Future<void> addToFavorites(FavoriteModel favorite) async {
  try {
    CollectionReference favorites = FirebaseFirestore.instance.collection('favorites');

    // Add the favorite data to Firestore
    await favorites.add(favorite.toMap());
                              showToast('Added to Favorites');

  } catch (e) {
                              showToast('Somthing went wrong');

    print('Error adding to favorites: $e');
    // Handle the error as needed
  }
}



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProperty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Book Now',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 40.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    child: FanCarouselImageSlider(
                      sliderHeight: 300,
                      autoPlay: true,
                      imagesLink: imageList,
                      isAssets: true,
                      indicatorActiveColor: customColor,
                      indicatorDeactiveColor: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hilton Vienna Park',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '2.5km from central',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '₹2,800 / Day',
                            style: TextStyle(
                              color: customColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  RatingStars(
                    value: starRating,
                    valueLabelColor: const Color(0xff9b9b9b),
                    valueLabelTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0,
                    ),
                    valueLabelRadius: 10,
                    maxValue: 5,
                    starSize: 20,
                    starSpacing: 2,
                    maxValueVisibility: true,
                    valueLabelVisibility: true,
                    starColor: Colors.yellow,
                    starOffColor: const Color(0xffe7e8ea),
                    onValueChanged: (value) {
                      setState(() {
                        starRating = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    'You can easily book your according to your budget hotel by our website.Enjoy your stay at Hotel XYZ with affordable prices and great amenities.Experience a luxurious stay at Sunset Resorts with stunning views.City Suites offers comfortable accommodation for your trip.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showToast('Added to Favorites');
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite,
                              color: customColor,
                            ),
                          ),
                        ),
                      ),
                      const PropertySpecificationPopUpWeb(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
