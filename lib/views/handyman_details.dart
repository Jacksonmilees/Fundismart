import 'package:flutter/material.dart';
import '../models/handyman_model.dart';

void _showHandymanDetails(BuildContext context, Handyman handyman) {
  bool _isContactUnlocked = false;
  TextEditingController phoneController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(radius: 50, backgroundImage: NetworkImage(handyman.imageUrl)),
                const SizedBox(height: 10),
                Text(handyman.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("${handyman.skill} • ${handyman.experience} years", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 20),
                    Text(" ${handyman.rating}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on, color: Colors.red, size: 18),
                    Text(handyman.location, style: const TextStyle(fontSize: 16)),
                  ],
                ),
                Text("Price: Ksh ${handyman.price}/hr", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                const SizedBox(height: 10),

                _isContactUnlocked
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.phone, color: Colors.green, size: 18),
                          Text(handyman.contact, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      )
                    : ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Enter Phone Number"),
                                content: TextField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(hintText: "Enter your M-Pesa number"),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      String phoneNumber = phoneController.text;
                                      MpesaService.initiatePayment(phoneNumber);
                                      Navigator.pop(context);
                                      setState(() {
                                        _isContactUnlocked = true;
                                      });
                                    },
                                    child: const Text("Pay with M-Pesa"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                        child: const Text("Unlock Contact (Ksh 20)"),
                      ),
              ],
            ),
          );
        },
      );
    },
  );
}
