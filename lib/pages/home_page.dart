import 'package:fetch_be/skeleton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Opacity(
              opacity: 0.6,
              child: Image.asset(
                'assets/images/shopping.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
            SizedBox(height: 8,),
            Text(
              'Shoppy',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            SizedBox(height: 8,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Skeleton()),
                );
              }, 
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Get started'),
                  SizedBox(width: 6,),
                  Icon(Icons.arrow_right_alt_rounded)
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}