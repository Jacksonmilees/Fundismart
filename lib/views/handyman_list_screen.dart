import 'package:flutter/material.dart';
import '../models/handyman_model.dart';
import 'handyman_details.dart';

class HandymanList extends StatelessWidget {
  final List<Handyman> handymen = [
    Handyman(
      name: "John Doe",
      skill: "Electrician",
      experience: "5",
      rating: "4.8",
      location: "Nairobi, Kenya",
      price: "1000",
      imageUrl: "https://example.com/profile.jpg",
      contact: "+254712345678",
    ),
    // Add more handymen here...
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: handymen.length,
      itemBuilder: (context, index) {
        Handyman handyman = handymen[index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(handyman.imageUrl)),
          title: Text(handyman.name),
          subtitle: Text("${handyman.skill} • ${handyman.experience} years"),
          onTap: () => _showHandymanDetails(context, handyman),
        );
      },
    );
  }
}
