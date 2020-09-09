import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/MobileView.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:portfolio/ContactForm.dart';
import 'ProjectTiles.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

//this is for the scrollbar in desktop view
ScrollController scrollController = ScrollController();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  //Everytime the scrollbar is dragged it will update the position of the web page.
  scrollCallBack(DragUpdateDetails dragUpdate) {
    setState(() {
      scrollController.position.moveTo(dragUpdate.globalPosition.dy * 4.5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return getValueForScreenType(
        context: context,
        mobile: MobileView(),
        desktop: Scaffold(
          body: Stack(
            children: [
              DraggableScrollbar.arrows(
                alwaysVisibleScrollThumb: true,
                controller: scrollController,
                child: ListView(
                  controller: scrollController,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TitleLine(
                                  text: 'TateyanaHendricks',
                                  color: Colors.lightBlueAccent),
                              TitleLine(text: ' Flutter Developer'),
                            ],
                          ),
                        ),
                        Center(
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
                                  'I am a cross platform software developer that utilizes '
                                  'the Flutter Framework to create mobile and web applications.'
                                  ' When I am not creating applications you will find me spoiling my dog or'
                                  ' reading a book.',
                                  style: TextStyle(fontSize: 25),
                                ),
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 50.0, bottom: 8),
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
                            ExactAssetImage(
                                'images/Shopping list change bkgrd.png'),
                            ExactAssetImage(
                                'images/Shopping list second bkgd.png'),
                          ],
                          github: false,
                          nolan: false,
                        ),
                        ProjectTile(
                          appTitle: 'Breathe',
                          appDescription: 'A mobile application '
                              'that guides the user through a breathing meditation exercise. '
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
                          padding: const EdgeInsets.only(
                              left: 28.0, bottom: 10, top: 20),
                          child: Center(
                            child: Column(
                              children: [
                                ContactForm(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
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
      style: TextStyle(fontSize: 45, color: color),
    );
  }
}
