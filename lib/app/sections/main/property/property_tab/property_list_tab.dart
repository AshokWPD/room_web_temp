import 'package:absolute_stay_site/app/sections/main/property/property_mobile/PropertyDetailPage.dart';
import 'package:absolute_stay_site/usable/core/animations/entrance_fader.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../model/propertyModel.dart';
import '../propertydetail.dart';

class PropertyData {
  final String image;
  final String title;
  final String price;
  final String distance;
  final String description;

  PropertyData({
    required this.image,
    required this.title,
    required this.price,
    required this.distance,
    required this.description,
  });
}

class PropertyCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String distance;
  final String description;

  PropertyCard({
    required this.image,
    required this.title,
    required this.price,
    required this.distance,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the property detail page here
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PropertyDetail(ProppId: '',),
          ),
        );
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    distance,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PropertyListingPageTab extends StatefulWidget {
  const PropertyListingPageTab({Key? key}) : super(key: key);

  @override
  State<PropertyListingPageTab> createState() => _PropertyListingPageTabState();
}

class _PropertyListingPageTabState extends State<PropertyListingPageTab> {

//  List<PropertyModel> properties = [];


// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//         fetchProperties();

//   }

// bool isfetching =false;
// Future<List<PropertyModel>> getAllProperties() async {
//   try {
//     final QuerySnapshot querySnapshot =
//         await FirebaseFirestore.instance
//         .collection('Property')
//         .where('status', isEqualTo: "Approved")
//         .get();

//     final List<PropertyModel> properties = querySnapshot.docs.map((doc) {
//       final data = doc.data() as Map<String, dynamic>;
//       return PropertyModel.fromMap(doc.id, data);
//     }).toList();

//     return properties;
//   } catch (e) {
//     print('Error fetching properties: $e');
//     throw e; // Handle the error as needed
//   }
// }










//   Future<void> fetchProperties() async {
//     // Fetch the properties and update the state
//     final List<PropertyModel> fetchedProperties = await getAllProperties();
//     setState(() {
//       properties = fetchedProperties;
//       isfetching=true;
//     });
//   }



  List<PropertyData> properties = [
    PropertyData(
      image: 'images/image1.png',
      title: 'Property 1',
      price: '\$100',
      distance: '5 miles',
      description: 'Description for Property 1',
    ),
    PropertyData(
      image: 'images/image1.png',
      title: 'Property 2',
      price: '\$150',
      distance: '3 miles',
      description: 'Description for Property 2',
    ),
    PropertyData(
      image: 'images/image1.png',
      title: 'Property 1',
      price: '\$100',
      distance: '5 miles',
      description: 'Description for Property 1',
    ),
    PropertyData(
      image: 'images/image1.png',
      title: 'Property 2',
      price: '\$150',
      distance: '3 miles',
      description: 'Description for Property 2',
    ),
    PropertyData(
      image: 'images/image1.png',
      title: 'Property 2',
      price: '\$150',
      distance: '3 miles',
      description: 'Description for Property 2',
    ),
    PropertyData(
      image: 'images/image1.png',
      title: 'Property 2',
      price: '\$150',
      distance: '3 miles',
      description: 'Description for Property 2',
    ),
    // Add more properties as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(); // Pop the current route and go back to the previous page
              },
            ),
          ),
          const Center(
            child: Text(
              "300+ Places to Stay",
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'josefinsans',
                fontWeight: FontWeight.w700,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 20.w,
              child: DropdownButtonFormField<String>(
                value: null, // Set the initial value or use a state variable
                onChanged: (String? newValue) {
                  // Handle dropdown value change
                },
                items: <String>['Relevance', 'Popularity']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                    .toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.blue), // Initial border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: primaryColor), // Border color when focused
                  ),
                  labelText: 'Sort By',
                  labelStyle: TextStyle(color: primaryColor),
                  hintText: 'Sort By',
                  hintStyle: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: double.maxFinite,
            width: 100.w,
            child: EntranceFader(
              offset: const Offset(0, 0),
              delay: const Duration(seconds: 0),
              duration: const Duration(milliseconds: 800),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                    padding: EdgeInsets.all(20.0),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 35.h,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 40,
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return PropertyCard(
                            image: properties[index].image,
                            title: properties[index].title,
                            price: properties[index].price,
                            distance: properties[index].distance,
                            description: properties[index].description,
                          );
                        },
                        childCount: properties.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

