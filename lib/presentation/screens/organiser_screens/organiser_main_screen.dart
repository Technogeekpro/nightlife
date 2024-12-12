import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iconsax/iconsax.dart';
import 'package:night_life/styles/colors.dart';

class OrganiserMainScreen extends StatefulWidget {
  const OrganiserMainScreen({super.key});

  @override
  State<OrganiserMainScreen> createState() => _OrganiserMainScreenState();
}

class _OrganiserMainScreenState extends State<OrganiserMainScreen> {
  String _organizerName = '';
  int _totalPostedEvents = 0;
  double _ticketRevenue = 0.0;
  int _soldTickets = 0;

  @override
  void initState() {
    super.initState();
    _fetchOrganizerData();
  }

  Future<void> _fetchOrganizerData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        _organizerName = userDoc['name'];
      });

      // Fetch total posted events
      QuerySnapshot eventsSnapshot = await FirebaseFirestore.instance
          .collection('events')
          .where('organizerId', isEqualTo: user.uid)
          .get();
      setState(() {
        _totalPostedEvents = eventsSnapshot.docs.length;
      });

      // Fetch ticket revenue and sold tickets
      QuerySnapshot ticketsSnapshot = await FirebaseFirestore.instance
          .collection('tickets')
          .where('organizerId', isEqualTo: user.uid)
          .get();
      double totalRevenue = 0.0;
      int totalSoldTickets = 0;
      for (var doc in ticketsSnapshot.docs) {
        totalRevenue += doc['price'];
        totalSoldTickets += (doc['quantity'] as int);
      }
      setState(() {
        _ticketRevenue = totalRevenue;
        _soldTickets = totalSoldTickets;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Management'),
        backgroundColor: AppColors.background,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.logout, color: Colors.white),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $_organizerName',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1 / 1.2,
                children: [
                  _buildCard(
                    context,
                    icon: Iconsax.calendar,
                    title: 'Total Posted Events',
                    value: '$_totalPostedEvents',
                    onTap: () {
                      // Handle card tap
                    },
                  ),
                  _buildCard(
                    context,
                    icon: Iconsax.money,
                    title: 'Ticket Revenue',
                    value: '\$$_ticketRevenue',
                    onTap: () {
                      // Handle card tap
                    },
                  ),
                  _buildCard(
                    context,
                    icon: Iconsax.ticket,
                    title: 'Sold Tickets',
                    value: '$_soldTickets',
                    onTap: () {
                      // Handle card tap
                    },
                  ),
                  Card(
                    color: AppColors.primary,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                         Navigator.pushNamed(context, '/organiser');
                      },
                      borderRadius: BorderRadius.circular(12),
                      splashColor: AppColors.primary.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(20),
                                decoration:  BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.add,
                                    size: 24,
                                    color: Colors.white)),
                             const SizedBox(height: 30),
                            Text(
                              'Create Event',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
        splashColor: AppColors.primary.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon,
                      size: 24, color: Theme.of(context).primaryColor)),
              const Spacer(),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
