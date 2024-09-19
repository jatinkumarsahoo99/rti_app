import 'package:flutter/material.dart';

class MyCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scrollable Card Example')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate 50% of screen height
          double cardHeight = constraints.maxHeight * 0.5;

          return Center(
            child: Card(
              elevation: 4.0,
              child: Container(
                height: cardHeight,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // Add content here
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Scrollable content goes here. Add enough content to test scrolling.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      // Add more content to ensure scrolling
                      for (int i = 0; i < 20; i++)
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Item $i',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyCardScreen(),
  ));
}
