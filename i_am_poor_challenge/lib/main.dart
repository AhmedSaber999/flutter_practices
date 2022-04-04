import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title : 'I am poor challenge.',
    home: Scaffold(
          appBar: AppBar(
            title: const Text('I am poor challenge'),
            backgroundColor: Color.fromARGB(255, 185, 97, 14),
          ),
          body: const Center(
            child: Image(
              image: AssetImage('images/me.jpg'),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            // ignore: prefer_const_literals_to_create_immutables
            items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'School',
                ),
            ],
            currentIndex: 0,
            selectedItemColor: Colors.amber[800],          
          ),
        )
      ));
}

