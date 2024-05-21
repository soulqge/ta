import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('About Expense Tracker', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/setting');
          }, 
          icon: Icon(Icons.keyboard_arrow_left, color: Theme.of(context).colorScheme.inversePrimary )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Expense Tracker',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary),
            ),
            SizedBox(height: 16),
            Text(
              'Expense tracker adalah aplikasi simpel yang dibuat untuk melihat pengeluaran pribadi kita selama seminggu, projek ini akan update secara berkala dan projek ini adalah untuk kebutuhan tugas akhir kelompok kami.',
              style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary),
            ),
            SizedBox(height: 16),
            Text(
              'Made with ❤️ by Our Team',
              style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ],
        ),
      ),
    );
  }
}