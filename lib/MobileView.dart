import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'ContactForm.dart';
import 'ProjectTiles.dart';
import 'main.dart';

class MobileView extends StatefulWidget {
  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [Text('About'), Text('Portfolio'), Text('Contact Me')],
              ),
              title: Text('Tateyana Hendricks  Flutter Developer'),
            ),
            body: TabBarView(
              children: [
                Center(
                  child: Row(
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
                Center(
                  child: Column(children: [
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
                      style: TextStyle(
                          fontSize: getValueForScreenType(
                              context: context, desktop: 18, mobile: 14)),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 500,
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                        MobileProjectTiles(
                          title: 'Weather',
                          appIcon: 'images/weather app icon.png',
                          shortDescription:
                              'A mobile weather application that...',
                          longDescription:
                              'A mobile weather application that uses the devices GPS to find the users'
                              ' location and displays the current and forecasted weather '
                              'information for their current location. The weather data is '
                              'obtained from several weather APIs. The User can also search for '
                              'weather for another location.',
                          images: [
                            ExactAssetImage('images/weather main.png'),
                            ExactAssetImage('images/weather forcaste.png'),
                            ExactAssetImage('images/weather search.png'),
                          ],
                          nolan: false,
                          github: false,
                        ),
                        MobileProjectTiles(
                          title: 'Shopping List',
                          appIcon: 'images/shopping list icon2.png',
                          shortDescription:
                              'A shopping list that can be managed from a smartphone or browser...',
                          longDescription:
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
                        MobileProjectTiles(
                          title: 'Breathe',
                          appIcon: 'images/Breathe app icon.png',
                          nolan: true,
                          shortDescription: 'A Breathing Mediation app...',
                          longDescription: 'A mobile application '
                              'that guides the user through a breathing mediation exercise. '
                              'This app was created for the 2020 Flutter Hackathon in '
                              'collaboration with myself and Nolan Sherman',
                          images: [
                            ExactAssetImage('images/home.png'),
                            ExactAssetImage('images/Breathe_app_demo.gif'),
                            ExactAssetImage('images/stats.png'),
                          ],
                          github: true,
                          url: "https://github.com/weare10/breathe",
                        )
//                        Card(
//                          child: ProjectTile(
//                            appTitle: 'Breathe',
//                            appDescription: 'A mobile application '
//                                'that guides the user through a breathing mediation exercise. '
//                                'This app was created for the 2020 Flutter Hackathon in '
//                                'collaboration with myself and Nolan Sherman',
//                            images: [
//                              ExactAssetImage('images/home.png'),
//                              ExactAssetImage('images/Breathe_app_demo.gif'),
//                              ExactAssetImage('images/stats.png'),
//                            ],
//                            url: "https://github.com/weare10/breathe",
//                            nolan: true,
//                            github: true,
//                          ),
//                        ),
                      ]),
                    ),
                  ]),
                ),
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 20),
                        child: Center(
                          child: Text(
                            'Contact me',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
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
              ],
            )));
  }
}
