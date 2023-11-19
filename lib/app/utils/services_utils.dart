import 'package:flutter/material.dart';

class ServicesUtils {
  final String imagePath;
  final String title;
  final IconData? icon;
  final String? content;

  ServicesUtils({
    required this.title,
    this.imagePath = '',
    this.icon,
    this.content,
  });
}

List<ServicesUtils> ServicesUtilsList = [
  ServicesUtils(
    icon: Icons.school,
    title: "Students",
    content: "We book all kinds of national or international tickets for your destination.",
  ),
  ServicesUtils(
    icon: Icons.people,
    title: "Working Professionals",
    content: "You can easily book your budget hotel through our website.",
  ),
  ServicesUtils(
    icon: Icons.apartment,
    title: "Managed Apartments",
    content: "We provide you the best plans within a short time to explore more.",
  ),
  ServicesUtils(
    icon: Icons.home,
    title: "Resorts",
    content: "Discover serenity and adventure in a natural paradise at our resorts.",
  ),
];

