import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:portfolio/ContactForm.dart';
import 'ProjectTiles.dart';

String name;
String email;
String message;
launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

TextEditingController controller = TextEditingController();
TextEditingController controller2 = TextEditingController();
TextEditingController controller3 = TextEditingController();
final checkTheForm = GlobalKey<FormState>();
ScrollController scrollController = ScrollController();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  submitForm() {
    firestore.collection('contact').add({
      'Name': name,
      'Email': email,
      'Message': message,
    });
  }

  scrollCallBack(DragUpdateDetails dragUpdate) {
    setState(() {
      scrollController.position.moveTo(dragUpdate.globalPosition.dy * 4.5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 50),
                    child: getValueForScreenType(
                      context: context,
                      desktop: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TitleLine(text: 'iAm'),
                          TitleLine(
                              text: 'TateyanaHendricks',
                              color: Colors.lightBlueAccent),
                          TitleLine(text: ' = flutterDeveloper( );'),
                        ],
                      ),
                      mobile: Center(
                        child: Column(
                          children: [
                            TitleLine(text: 'iAm'),
                            TitleLine(
                                text: 'TateyanaHendricks',
                                color: Colors.lightBlueAccent),
                            TitleLine(text: ' = flutterDeveloper( );'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  getValueForScreenType<Widget>(
                    context: context,
                    mobile: Center(
                      child: Column(
                        children: [
                          //Image of Me
                          Image.asset(
                            'images/cartoonMe.png',
                            height: 200,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 400,
                            child: Text(
                              '''flutterDeveloper () {
print( "A software developer that uses the'''
                              'Dart Programming language in the Flutter framework to create '
                              '''mobile and web applications." );
}''',
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                    ),
                    desktop: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Image of Me
                          Image.asset(
                            'images/cartoonMe.png',
                            height: 200,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 400,
                            child: Text(
                              '''flutterDeveloper () {
print( "A software developer that uses the'''
                              'Dart Programming language in the Flutter framework to create '
                              '''mobile and web applications." );
}''',
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0, bottom: 8),
                          child: Text(
                            'Portfolio',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'Unless otherwise specified in the app description I am the sole'
                          'developer on these projects.',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ProjectTile(
                    appTitle: 'Weather',
                    appDescription:
                        'A mobile application that uses the devices GPS to find the users'
                        ' location and displays the current and forecasted weather '
                        'information for their current location. The weather data is '
                        'obtained from several weather APIs. The User can also search for '
                        'weather for another location.',
                    images: [
                      ExactAssetImage('images/weather main.png'),
                      ExactAssetImage('images/weather forcaste.png'),
                      ExactAssetImage('images/weather search.png'),
                    ],
                    github: false,
                    nolan: false,
                  ),
                  ProjectTile(
                    appTitle: 'Shopping List',
                    appDescription:
                        'A mobile and web application that uses firebase authentication '
                        'to allow users to register for and sign in to their account. '
                        'Users can enter new items into their shopping list and double '
                        'tap the items to delete them from the list. The app uses '
                        'Firestore cloud database for storage.  The app syncs across '
                        'platforms so the user can manage their shopping list from '
                        'their smartphone or browser.',
                    images: [
                      ExactAssetImage('images/Shoppinglist log in.png'),
                      ExactAssetImage('images/Shopping list main.png'),
                      ExactAssetImage('images/Shopping list change bkgrd.png'),
                      ExactAssetImage('images/Shopping list second bkgd.png'),
                    ],
                    github: false,
                    nolan: false,
                  ),
                  ProjectTile(
                    appTitle: 'Breathe',
                    appDescription: 'A mobile application '
                        'that guides the user through a breathing mediation exercise. '
                        'This app was created for the 2020 Flutter Hackathon in '
                        'collaboration with myself and Nolan Sherman',
                    images: [
                      ExactAssetImage('images/home.png'),
                      ExactAssetImage('images/Breathe_app_demo.gif'),
                      ExactAssetImage('images/stats.png'),
                    ],
                    url: "https://github.com/weare10/breathe",
                    nolan: true,
                    github: true,
                  ),
                  Center(
                    child: Text(
                      'Contact me',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 28.0, bottom: 10, top: 20),
                    child: Center(
                      child: Column(
                        children: [
                          ContactFormFields(),
                          SizedBox(
                            height: 10,
                          ),
                          Builder(
                            builder: (context) => OutlineButton(
                              onPressed: () {
                                if (checkTheForm.currentState.validate()) {
                                  checkTheForm.currentState.save();
                                  submitForm();
                                  controller.clear();
                                  controller2.clear();
                                  controller3.clear();
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text('Message Sent')));
                                }
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.lightBlueAccent),
                              ),
                              color: Colors.lightBlueAccent,
                              splashColor: Colors.white,
                              focusColor: Colors.lightBlueAccent,
                              hoverColor: Colors.white10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          getValueForScreenType(
            context: context,
            desktop: FlutterWebScroller(
              scrollCallBack,
              dragHandleColor: Colors.lightBlueAccent,
              scrollBarBackgroundColor: Colors.white10,
              scrollBarWidth: 20,
              dragHandleHeight: 40,
              dragHandleWidth: 15,
            ),
            mobile: Container(),
            tablet: Container(),
          ),
        ],
      ),
    );
  }
}

class TitleLine extends StatelessWidget {
  TitleLine({this.text, this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: getValueForScreenType(
              context: context, mobile: 20, tablet: 30, desktop: 45),
          color: color),
    );
  }
}
