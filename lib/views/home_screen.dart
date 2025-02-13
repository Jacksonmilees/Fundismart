import 'package:flutter/material.dart';
import 'mpesa_service.dart'; // Import Mpesa Service for API

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isDarkMode = false; // Theme toggle
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[100],
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Welcome", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Robert Smith", style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.dark_mode, color: Colors.black),
            onPressed: () => setState(() => isDarkMode = !isDarkMode),
          ),
          const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.black),
          ),
          const SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildPromoBanner(),
              const SizedBox(height: 20),
              _buildCategorySection(),
              const SizedBox(height: 20),
              _buildTopServicesSection(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  // 🔹 Search Bar
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search here...",
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // 🔹 Promo Banner
  Widget _buildPromoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Get Discount Up to 30%", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text("on first home cleaning", style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            child: const Text("Book Now"),
          ),
        ],
      ),
    );
  }

  // 🔹 Categories Section
  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCategory("Cleaning", Icons.cleaning_services),
              _buildCategory("Laundry", Icons.local_laundry_service),
              _buildCategory("Repair", Icons.build),
              _buildCategory("Plumbing", Icons.plumbing),
            ],
          ),
        ),
      ],
    );
  }

  // 🔹 Category Widget
  Widget _buildCategory(String name, IconData icon) {
    return GestureDetector(
      onTap: () {
  
      },
      child: Container(
        width: 90,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Colors.blueAccent),
            const SizedBox(height: 5),
            Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  // 🔹 Top Services Section
  Widget _buildTopServicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Top Services", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4, // Displaying 4 sample cards
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return _buildHandymanCard(context, index);
          },
        ),
      ],
    );
  }

  // 🔹 Handyman Card Widget
  Widget _buildHandymanCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => _showHandymanDetails(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 30, backgroundColor: Colors.blueAccent, child: Icon(Icons.person, color: Colors.white)),
            const SizedBox(height: 5),
            Text("Home Cleaning", style: const TextStyle(fontWeight: FontWeight.bold)),
            const Text("\$20/h", style: TextStyle(fontSize: 12, color: Colors.green)),
          ],
        ),
      ),
    );
  }

  // 🔹 Handyman Details Pop-up
  void _showHandymanDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 50, backgroundColor: Colors.blueAccent, child: Icon(Icons.person, size: 50, color: Colors.white)),
              const SizedBox(height: 10),
              const Text("Handyman Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _showMpesaPopup(context),
                child: const Text("Unlock Contact (Ksh 20)"),
              ),
            ],
          ),
        );
      },
    );
  }

  // 🔹 M-Pesa Payment Pop-up
  void _showMpesaPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter Phone Number"),
          content: TextField(controller: phoneController, keyboardType: TextInputType.phone),
          actions: [
            ElevatedButton(
              onPressed: () {
                MpesaService.initiatePayment(phoneController.text);
                Navigator.pop(context);
              },
              child: const Text("Pay with M-Pesa"),
            ),
          ],
        );
      },
    );
  }
}
