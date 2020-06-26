import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

Color gradientStart = Colors.grey[900]; //Change start gradient color here
Color gradientEnd = Colors.grey[600]; //Change end gradient color here
final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'provincialkid@gmail.com',
    queryParameters: {
      'subject': 'Example Subject & Symbols are allowed!'
    }
);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Flutter ID'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 0.0,
      ),
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: [gradientStart, gradientEnd],
              begin: const FractionalOffset(0.5, 0.0),
              end: const FractionalOffset(0.0, 0.5),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Profile Image
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 60,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('http://provincialkid.xyz/img/pp.jpg'),
                    radius: 55,

                  ),
                ),
              ),
              //Name
              Text(
                'Name',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Zakaria Ahammed',
                style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              //Address
              SizedBox(height: 20,),
              Text(
                'Address',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'H#333, Khajura, Sadar, Jashore',
                style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
              //Phone
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => launch("tel:+8801833182777"),
                    icon: Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: ()=> launch("tel:+8801833182777"),
                    child:  Text(
                      '+8801833182777',
                      style: TextStyle(
                        color: Colors.amber,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),

                    ),
                  ),

                ],
              ),
              //Email
              //SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => launch(_emailLaunchUri.toString()),
                    icon: Icon(
                      Icons.email,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text(
                    'zakaria.ahammed@robi.com.bd',
                    style: TextStyle(
                      color: Colors.amber,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              //QR-Code
              SizedBox(height: 50,),
              Center(
                child: QrImage(
                  data: "{\"Name\":\"Zakaria Ahammed\",\"Address\":\"H#333, Khajura, Sadar, Jashore\",\"Phone\":\"+8801833182777\",\"Email\":\"zakaria.ahammed@robi.com.bd\"}",
                  version: QrVersions.auto,
                  size: 200.0,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}

