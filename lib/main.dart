import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String name;
String email;
String message;

TextEditingController controller = TextEditingController();
TextEditingController controller2 = TextEditingController();
TextEditingController controller3 = TextEditingController();
final checkTheForm = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // This trailing comma makes auto-formatting nicer for build methods.
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleLine(text: 'iAm'),
                    TitleLine(
                        text: 'TateyanaHendricks',
                        color: Colors.lightBlueAccent),
                    TitleLine(text: ' = flutterDeveloper( );'),
                  ],
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
              ),
              ProjectTile(
                appTitle: 'Breathe',
                appDescription: 'A mobile application '
                    'that guides the user through a breathing mediation exercise. '
                    'This app was created for the 2020 Flutter Hackathon in '
                    'collaboration with myself and Nicholas Sherman.',
                images: [
                  ExactAssetImage('images/home.png'),
                  ExactAssetImage('images/Breathe_app_demo.gif'),
                  ExactAssetImage('images/stats.png'),
                ],
                url: "https://github.com/weare10/breathe",
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
                padding: const EdgeInsets.only(left: 28.0, bottom: 10, top: 20),
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
    );
  }
}

class ContactFormFields extends StatefulWidget {
  @override
  _ContactFormFieldsState createState() => _ContactFormFieldsState();
}

class _ContactFormFieldsState extends State<ContactFormFields> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: checkTheForm,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              validator: (value) {
                if (value.isEmpty) {
                  return "This field cannot be empty";
                }
                return null;
              },
              onSaved: (value) {
                name = value;
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Name',
                  hintStyle: TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  contentPadding: EdgeInsets.all(8)),
              textCapitalization: TextCapitalization.words,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: controller2,
              validator: (value) {
                if (value.isEmpty) {
                  return "This field cannot be empty";
                }
                return null;
              },
              onSaved: (value) {
                email = value;
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  contentPadding: EdgeInsets.all(8)),
              textCapitalization: TextCapitalization.words,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: controller3,
              validator: (value) {
                if (value.isEmpty) {
                  return "This field cannot be empty";
                }
                return null;
              },
              onSaved: (value) {
                message = value;
              },
              maxLines: 15,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Message',
                  hintStyle: TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  contentPadding: EdgeInsets.all(8)),
              textCapitalization: TextCapitalization.words,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  ProjectTile(
      {this.appTitle, this.appDescription, this.images, this.url, this.github});
  final String appTitle;
  final String appDescription;
  final images;
  final url;
  final bool github;

  launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            getValueForScreenType(context: context, mobile: 50, desktop: 100),
      ),
      child: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                appTitle,
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              //if mobile display in column, if desktop display in row
              //getValueForScreenType<Widget>(),
              Container(
                height: 500,
                width: 300,
                child: Carousel(
                  images: images,
                  dotColor: Colors.lightBlueAccent,
                  dotIncreasedColor: Colors.lightBlueAccent,
                  autoplay: false,
                ),
              ),
              SizedBox(height: 20),
              Text(
                appDescription,
                style: TextStyle(fontSize: 25),
              ),
              //github icon
              github
                  ? FlatButton(
                      child: Image(image: AssetImage('images/github icon.png')),
                      splashColor: Colors.white,
                      onPressed: () {
                        launchURL(url);
                      },
                      focusColor: Colors.white,
                    )
                  : Container(),
              SizedBox(height: 100),
            ]),
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
