import 'package:flutter/material.dart';
import 'package:tracker_admin/views/barcodes_page.dart';

import 'location_history_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.location_history)),
              Tab(icon: Icon(Icons.qr_code)),
            ],
          ),
          title: const Text('Admin Panel'),
        ),
        body: const TabBarView(
          children: [
            LocationHistoryPage(),
            BarcodesPage(),
          ],
        ),
      ),
    );
  }
}
