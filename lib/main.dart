import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation & UI',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20), // Margin around the container
          padding: EdgeInsets.all(15), // Padding inside the container
          decoration: BoxDecoration(
            color: Colors.blueAccent, // Background color
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to Home Page',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 10), // Space between text and button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Text('Go to Second Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Text(
          'Successfully Navigated to Second Page!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
