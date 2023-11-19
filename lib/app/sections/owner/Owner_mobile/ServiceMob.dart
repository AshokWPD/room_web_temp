import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'form_mobile/ac_fitting_contact_form_mob.dart';
import 'form_mobile/electrical_works_contact_form_mob.dart';
import 'form_mobile/plumbing_contact_form_mob.dart';

class AdminServicesPageMobile extends StatelessWidget {
  const AdminServicesPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Service Provided by Admin',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        decoration: const BoxDecoration(
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Lottie.asset(
                  'images/service.json',
                  width: 300,
                  height: 300,
                  fit: BoxFit.fill,
                ),
                Card(
                  margin: const EdgeInsets.all(16.0),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'List of Services:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextButton(
                          onPressed: () {
                            // Navigate to AC Fitting Contact Form
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ACContactForm(),
                              ),
                            );
                          },
                          child: Text(
                            'AC Fitting',
                            style: TextStyle(fontSize: 16.0, color: customColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to Electrical Works Contact Form
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ElectricalContactForm(),
                              ),
                            );
                          },
                          child: Text(
                            'Electrical Works',
                            style: TextStyle(fontSize: 16.0, color: customColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to Plumbing Contact Form
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PlumbingContactForm(),
                              ),
                            );
                          },
                          child: Text(
                            'Plumbing',
                            style: TextStyle(fontSize: 16.0, color: customColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
