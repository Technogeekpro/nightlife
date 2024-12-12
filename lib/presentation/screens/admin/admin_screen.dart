import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iconsax/iconsax.dart';
import 'package:night_life/styles/colors.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _totalOrganizers = 0;
  int _totalUsers = 0;
  int _totalEvents = 0;
  double _revenue = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    // Fetch total organizers
    QuerySnapshot organizersSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('userType', isEqualTo: 'Organizer')
        .get();
    setState(() {
      _totalOrganizers = organizersSnapshot.docs.length;
    });

    // Fetch total users
    QuerySnapshot usersSnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    setState(() {
      _totalUsers = usersSnapshot.docs.length;
    });

    // Fetch total events
    QuerySnapshot eventsSnapshot =
        await FirebaseFirestore.instance.collection('events').get();
    setState(() {
      _totalEvents = eventsSnapshot.docs.length;
    });

    // Fetch revenue (assuming revenue is stored in a collection called 'revenue')
    QuerySnapshot revenueSnapshot =
        await FirebaseFirestore.instance.collection('revenue').get();
    double totalRevenue = 0.0;
    for (var doc in revenueSnapshot.docs) {
      totalRevenue += doc['amount'];
    }
    setState(() {
      _revenue = totalRevenue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildCard(
              context,
              icon: Iconsax.user,
              title: 'Total Organizers',
              value: '$_totalOrganizers',
              onTap: () {
                // Handle card tap
              },
            ),
            _buildCard(
              context,
              icon: Iconsax.money,
              title: 'Revenue',
              value: '\$$_revenue',
              onTap: () {
                // Handle card tap
              },
            ),
            _buildCard(
              context,
              icon: Iconsax.people,
              title: 'Total Users',
              value: '$_totalUsers',
              onTap: () {
                // Handle card tap
              },
            ),
            _buildCard(
              context,
              icon: Iconsax.calendar,
              title: 'Total Events',
              value: '$_totalEvents',
              onTap: () {
                // Handle card tap
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String value,
      required VoidCallback onTap}) {
    return Card(
      color: AppColors.background.withOpacity(0.8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 24, color: Theme.of(context).primaryColor),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
