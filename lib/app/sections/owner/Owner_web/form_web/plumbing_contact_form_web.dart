import 'package:flutter/material.dart';

class PlumbingContactFormWeb extends StatefulWidget {
  const PlumbingContactFormWeb({Key? key}) : super(key: key);

  @override
  _PlumbingContactFormWebState createState() => _PlumbingContactFormWebState();
}

class _PlumbingContactFormWebState extends State<PlumbingContactFormWeb> {
  double _dialogHeight = 0.0; // Initial height
  final double _dialogWidth = 400; // Fixed width

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Animate the container height after a short delay
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _dialogHeight = 720; // New height after the animation
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      height: _dialogHeight, // Animate the height
      width: _dialogWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), // Curved edge on the top left
          topRight: Radius.circular(20), // Curved edge on the top right
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Plumbing Service Contact Form',
            style: TextStyle(color: Colors.black), // Set text color
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop(); // Close the form
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Full Name input field
                  CustomTextField(
                    title: 'Full Name',
                    isSecured: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),

                  // Email input field
                  CustomTextField(
                    title: 'Email',
                    isSecured: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add email validation logic if needed
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),

                  // Phone Number input field
                  CustomTextField(
                    title: 'Phone Number',
                    isSecured: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      // Add phone number validation logic if needed
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),

                  // Message input field
                  CustomTextField(
                    title: 'Message',
                    isSecured: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your message';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),

                  // Description input field
                  CustomTextField(
                    title: 'Description',
                    maxLines: 5, // Allow multiple lines of text
                    maxLength: 200, // Limit the text to 200 characters
                    validator: (value) {
                      // Add validation logic for the description
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),

                  // Submit button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission
                        // You can access the form fields using _formKey.currentState
                        // Send the form data as needed
                      }
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
                    child: const Text('Submit', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final bool isSecured;
  final bool enabled;
  final bool showPasswordToggle;
  final TextInputType keyboardType;
  final int? maxLines; // Add maxLines parameter
  final int? maxLength; // Add maxLength parameter
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.title,
    this.controller,
    this.isSecured = false,
    this.enabled = true,
    this.showPasswordToggle = false,
    this.keyboardType = TextInputType.text,
    this.maxLines, // Include maxLines parameter in the constructor
    this.maxLength, // Include maxLength parameter in the constructor
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
              controller: controller,
              obscureText: isSecured,
              enabled: enabled,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: title,
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: isSecured && showPasswordToggle
                    ? IconButton(
                  icon: const Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    // Implement password visibility toggle here
                  },
                )
                    : null,
              ),
              keyboardType: keyboardType,
              maxLines: maxLines, // Use the specified maxLines
              maxLength: maxLength, // Use the specified maxLength
              validator: validator, // Use the specified validator
            ),
          ),
        ],
      ),
    );
  }
}
