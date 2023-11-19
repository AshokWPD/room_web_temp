import 'dart:async';
import 'dart:io';
import 'package:absolute_stay_site/usable/PropertySelection.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../model/propertyModel.dart';
import 'SuccessScreenWeb.dart';
import 'dart:typed_data';
import 'package:universal_html/html.dart' as html;
class AddPropertyWeb extends StatefulWidget {
  const AddPropertyWeb({super.key});

  @override
  _AddPropertyWebState createState() => _AddPropertyWebState();
}

class _AddPropertyWebState extends State<AddPropertyWeb> {
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  bool issuccess = false;

 void showToast(String message, var color) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor:color==Colors.red?Colors.black: Colors.white,
    );
  }

final List<html.File> _roomImages = [];
final List<html.File> _propertyImages = [];
  int _currentImageIndex = 0;

  List<String> imagePaths = [
    'images/image1.png',
    'images/image2.png',
    'images/image3.png',
    // Add more image paths here
  ];

  TextEditingController propertyNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController roomPriceController = TextEditingController();


// Utility method to convert Uint8List to File
// html.File createFile(Uint8List uint8List, String name) {
//   final blob = html.Blob([uint8List], 'image/png'); // Adjust the mime type as needed
//   return html.File([blob], name);
// }

// void _pickImages(ImageType imageType) async {
//   final html.InputElement input = html.InputElement(type: 'file')
//     ..multiple = true;

//   input.click();

//   input.onChange.listen((event) async {
//     final List<html.File> files = input.files!;
//     List<Uint8List> selectedImages = [];

//     for (final file in files) {
//       final reader = html.FileReader();
//       reader.readAsArrayBuffer(file);
//       await reader.onLoad.first;
//       selectedImages.add(Uint8List.fromList(reader.result as List<int>));
//     }

//     setState(() {
//       if (imageType == ImageType.room) {
//         _roomImages.addAll(selectedImages);
//       } else {
//         _propertyImages.addAll(selectedImages);
//       }
//     });
//   });
// }

void _pickImages(ImageType imageType) async {
  final html.InputElement input = html.InputElement(type: 'file')
    ..multiple = true;

  input.click();

  input.onChange.listen((event) {
    final List<html.File> files = input.files!;
    List<html.File> selectedImages = files.toList();

    setState(() {
      if (imageType == ImageType.room) {
        _roomImages.addAll(selectedImages);
      } else {
        _propertyImages.addAll(selectedImages);
      }
    });
  });
}






 void _uploadProperty() async {

  String userUid = FirebaseAuth.instance.currentUser!.uid;

   final List<String> roomImageUrls = [];
    final List<String> propertyImageUrls = [];

    // Upload room images
    for (final file in _roomImages) {
      final imageUrl = await uploadImageToStorage(file); // Upload the image
      roomImageUrls.add(imageUrl);
    }

    // Upload property images
    for (final file in _propertyImages) {
      final imageUrl = await uploadImageToStorage(file); // Upload the image
      propertyImageUrls.add(imageUrl);
    }


  final PropertyModel property = PropertyModel(
    propertyName: propertyNameController.text,
    propertyType: "Apporment",
    roomType: ["Garden", "Play ground", "Kitchen"],
    streetAddress:addressController.text ,
    vendorId: userUid,
    landmark: landmarkController.text,
    pincode: pincodeController.text,
    description: descriptionController.text,
    price: roomPriceController.text,
    status: "UnApproved",
    isbookedBy: "no",
    bookStatus: "free",
    statusVendor: "allow",
    gender: "Any",
    features: ["hair drier", "towel"],
    roomImages: roomImageUrls,
    propertyImages: propertyImageUrls,
    latitude: 123.456,
    longitude: -78.901,
    id: '', 
  );

  try {
    await FirebaseFirestore.instance.collection('Property').add(property.toMap());

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Property uploaded successfully!')));

    // Clear the form and images
    propertyNameController.clear();
    addressController.clear();
    landmarkController.clear();
    pincodeController.clear();
    descriptionController.clear();
    roomPriceController.clear();
    setState(() {
      _roomImages.clear();
      _propertyImages.clear();
    });
  } catch (e) {
    print('Error uploading property: $e');
    // Optionally, show an error message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error uploading property: $e')));
  }
  }


Future<String> uploadImageToStorage(html.File file) async {
  final storage = FirebaseStorage.instance;
  final Reference storageReference = storage.ref().child('Property/${file.name}');
  await storageReference.putBlob(html.Blob([file.slice()]));
  return await storageReference.getDownloadURL();
}


// Future<Uint8List> _loadImage(html.File file) async {
//   final completer = Completer<Uint8List>();
//   final reader = html.FileReader();

//   reader.onLoad.listen((event) {
//     final arrayBuffer = reader.result as Uint8List;
//     completer.complete(arrayBuffer);
//   });

//   reader.readAsArrayBuffer(file);
//   return completer.future;
// }

// Define an image cache
final Map<String, Uint8List> imageCache = {};


// Inside the _loadImage function
Future<Uint8List> _loadImage(html.File file) async {
  final fileName = file.name;
  
  // Check if the image is already in the cache
  if (imageCache.containsKey(fileName)) {
    return imageCache[fileName]!;
  }

  // If not in the cache, load the image
  final completer = Completer<Uint8List>();
  final reader = html.FileReader();

  reader.onLoad.listen((event) {
    final arrayBuffer = reader.result as Uint8List;

    // Store the loaded image in the cache
    imageCache[fileName] = arrayBuffer;

    completer.complete(arrayBuffer);
  });

  reader.readAsArrayBuffer(file);
  return completer.future;
}





  @override
  Widget build(BuildContext context) {
    return !issuccess
        ? Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Container(
                    width: 35.w,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Add Your Property',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              fontFamily: 'josefinsans',
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _buildInputField(
                            title: 'Property Name',
                            controller: propertyNameController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const PropertySelection(),
                          const SizedBox(
                            height: 20,
                          ),
                          _buildInputField(
                            title: 'Address',
                            controller: addressController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _buildInputField(
                            title: 'Landmark',
                            controller: landmarkController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _buildInputField(
                            title: 'Pincode',
                            controller: pincodeController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Which Features Does Your Property Have?',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Checkbox options for property features
                              for (int i = 0; i < checkboxNames.length; i++)
                                CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: Text(
                                    checkboxNames[i],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  value: checkboxValues[i],
                                  onChanged: (value) =>
                                      _onCheckboxChanged(i, value!),
                                  activeColor: customColor,
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _buildInputField(
                            title: 'Enter Description',
                            controller: descriptionController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Property Images? Max 5 image',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          if (_propertyImages.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int index = 0;
                              index < _propertyImages.length;
                              index++)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                         child: FutureBuilder<Uint8List>(
  future: _loadImage(_propertyImages[index]),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Image.memory(snapshot.data!);
    } else {
      return const CircularProgressIndicator();
    }
  },
)
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _propertyImages.removeAt(index);
                                            });
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                            ),
                                            padding: const EdgeInsets.all(4),
                                            child: const Icon(
                                              Icons.close,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                                             onPressed: () => _pickImages(ImageType.property),          //           onPressed: () async {

                          // onPressed: () async {
                          //   final picker = ImagePicker();
                          //   final pickedImage = await picker.pickImage(
                          //     source: ImageSource.gallery,
                          //   );

                          //   if (pickedImage != null) {
                          //     setState(() {
                          //       _propertyImages.add(File(pickedImage.path));
                          //     });
                          //   }
                          // },
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color.fromRGBO(33, 37, 41, 1.0);
                                }
                                return const Color.fromRGBO(33, 84, 115, 1.0);
                              },
                            ),
                          ),
                          icon: const Icon(Icons.add, color: Colors.white),
                          label: const Text(
                            "Add More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _pickImages(ImageType.property),          //           onPressed: () async {
          //  _pickImages(isRoomImage: false);

          //           },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const Color.fromRGBO(33, 37, 41, 1.0);
                          }
                          return const Color.fromRGBO(33, 84, 115, 1.0);
                        },
                      ),
                    ),
                    icon: const Icon(Icons.image, color: Colors.white),
                    label: const Text(
                      "Upload Images",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildInputField(
                    title: 'Room estimated Price',
                    controller: roomPriceController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Room Images
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Room Images: Max 5 images',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (_roomImages.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int index = 0;
                              index < _roomImages.length;
                              index++)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: FutureBuilder<Uint8List>(
  future: _loadImage(_roomImages[index]),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Image.memory(snapshot.data!);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  },
)
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _roomImages.removeAt(index);
                                            });
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                            ),
                                            padding: const EdgeInsets.all(4),
                                            child: const Icon(
                                              Icons.close,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                                              onPressed: () => _pickImages(ImageType.room),

                          // onPressed: () async {
                          //   final picker = ImagePicker();
                          //   final pickedImage = await picker.pickImage(
                          //     source: ImageSource.gallery,
                          //   );

                          //   if (pickedImage != null) {
                          //     setState(() {
                          //       _roomImages.add(File(pickedImage.path));
                          //     });
                          //   }
                          // },
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color.fromRGBO(33, 37, 41, 1.0);
                                }
                                return const Color.fromRGBO(33, 84, 115, 1.0);
                              },
                            ),
                          ),
                          icon: const Icon(Icons.add, color: Colors.white),
                          label: const Text(
                            "Add More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _pickImages(ImageType.room),
                //     onPressed: () async {
                // _pickImages(isRoomImage: true);
                //     },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const Color.fromRGBO(33, 37, 41, 1.0);
                          }
                          return const Color.fromRGBO(33, 84, 115, 1.0);
                        },
                      ),
                    ),
                    icon: const Icon(Icons.image, color: Colors.white),
                    label: const Text(
                      "Upload Room Images",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(height: 5,),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Preview",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CarouselSlider(
                            items: imagePaths.map((imagePath) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 200,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              autoPlay: true, // Enable automatic sliding
                              autoPlayInterval: const Duration(seconds: 2), // Set the interval (2 seconds in this example)
                              autoPlayAnimationDuration: const Duration(milliseconds: 800), // Animation duration
                              viewportFraction: 1.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentImageIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imagePaths.map((imagePath) {
                            int index = imagePaths.indexOf(imagePath);
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentImageIndex == index
                                    ? customColor
                                    : Colors.grey,
                              ),
                            );
                          }).toList(),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "₹2,800 / Day",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "3 Bedroom Apartment in Salwa",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "You can easily book your according to your budget hotel by our website.",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      // ElevatedButton(
                      //   onPressed: () {
                      //     showToast('Saved Successfully',Colors.black);
                      //   },
                      //   style: ButtonStyle(
                      //     backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      //           (Set<MaterialState> states) {
                      //         if (states.contains(MaterialState.pressed)) {
                      //           return const Color.fromRGBO(33, 84, 115, 1.0);
                      //         }
                      //         return const Color.fromRGBO(33, 37, 41, 1.0);
                      //       },
                      //     ),
                      //   ),
                      //   child: const Text(
                      //     'Save for later',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          if(_roomImages.length<2||_propertyImages.length<2){
                            showToast("Add atleast 2 images", Colors.red);

                          }else{
                          _uploadProperty();}
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const SuccessScreen()),
                          // );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return const Color.fromRGBO(33, 37, 41, 1.0);
                              }
                              return const Color.fromRGBO(33, 84, 115, 1.0);
                            },
                          ),
                        ),
                        child: const Text(
                          'Add Property',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Divider(height: 5,)

                ],
              ),
            ),
          ),
        ),
      ),
    ))
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'images/success.json',
                    // Replace with your Lottie animation file path
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Success!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your Property  was added successfully.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back to the previous screen or perform other actions
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const Color.fromRGBO(33, 37, 41, 1.0);
                          }
                          return const Color.fromRGBO(33, 84, 115, 1.0);
                        },
                      ),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  void _onCheckboxChanged(int index, bool value) {
    setState(() {
      checkboxValues[index] = value;
    });
  }

  Widget _buildInputField({
    required String title,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.transparent, width: 0),
            color: const Color.fromARGB(255, 241, 241, 241),
          ),
          child: TextFormField(
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: title,
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  List<bool> checkboxValues = List.generate(6, (_) => false);
  List<String> checkboxNames = [
    'Swimming pool',
    'Furnished',
    'Heater',
    'Parking',
    'Heater',
    'Kitchen',
  ];
}


enum ImageType { room, property }