import 'package:flutter/material.dart';
import 'package:portfolio/sizeHelper.dart';
import 'ContactForm.dart';
import 'ProjectTiles.dart';

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
                tabs: [
                  TabWords(text: 'About'),
                  TabWords(text: 'Portfolio'),
                  TabWords(text: 'Contact')
                ],
              ),
              title: Center(
                child: Column(
                  children: [
                    Text(
                      'Tateyana Hendricks',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
//                          fontSize: displayWidth(context) * .06),
                      ),
                    ),
                    Text(
                      'Flutter Developer',
//                      style: TextStyle(fontSize: displayWidth(context) * .06),
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                ListView(children: [
                  Center(
                    child: Column(
                      children: [
                        //Image of Me
                        Image.asset(
                          'images/cartoonMe.png',
                          height: displayHeight(context) * .5,
                          width: displayWidth(context) * .5,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: displayWidth(context) * .6,
                          child: Text(
                            'I am a cross platform software developer that utilizes '
                            'the Flutter Framework to create mobile and web applications.'
                            ' When I am not creating applications you will find me spoiling my dog or'
                            ' reading a book.',
                            style: TextStyle(
                                fontSize: displayWidth(context) * .06),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
                ListView(
                  children: [
                    Center(
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: displayHeight(context) * .02,
                              bottom: displayHeight(context) * .01),
                          child: Text(
                            'Portfolio',
                            style: TextStyle(
                                fontSize: displayWidth(context) * .08,
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: displayWidth(context) * .9,
                          child: Text(
                            'Unless otherwise specified in the app description I am the sole'
                            'developer on these projects.',
                            style: TextStyle(
                                fontSize: displayWidth(context) * .05),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: displayHeight(context) * .6,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
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
                                    ExactAssetImage(
                                        'images/weather forcaste.png'),
                                    ExactAssetImage(
                                        'images/weather search.png'),
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
                                    ExactAssetImage(
                                        'images/Shoppinglist log in.png'),
                                    ExactAssetImage(
                                        'images/Shopping list main.png'),
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
                                  shortDescription:
                                      'A Breathing Meditation app...',
                                  longDescription: 'A mobile application '
                                      'that guides the user through a breathing meditation exercise. '
                                      'This app was created for the 2020 Flutter Hackathon in '
                                      'collaboration with myself and Nolan Sherman',
                                  images: [
                                    ExactAssetImage('images/home.png'),
                                    ExactAssetImage(
                                        'images/Breathe_app_demo.gif'),
                                    ExactAssetImage('images/stats.png'),
                                  ],
                                  github: true,
                                  url: "https://github.com/weare10/breathe",
                                ),
                                MobileProjectTiles(
                                  title: 'Portfolio',
                                  appIcon: 'images/cartoonMe.png',
                                  shortDescription:
                                      'I created this Portfolio site using Flutter web...',
                                  longDescription:
                                      'I created this Portfoio site using Flutter web. That means '
                                      'that I used the same programing language (Dart) that I do when I am programming '
                                      'mobile applications. That is the beauty of Flutter. I can code everything with a single '
                                      'language and it will take care of converting it so that it will work on multiple platforms.',
                                  github: true,
                                  url:
                                      'https://github.com/Thendricks25/Portfolio',
                                  images: [
                                    ExactAssetImage(
                                        'images/mobileviewPortfolio.png'),
                                    ExactAssetImage(
                                        'images/desktopviewPortfolio.png'),
                                  ],
                                  nolan: false,
                                ),
                              ]),
                        ),
                      ]),
                    ),
                  ],
                ),
                ListView(children: [
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0, bottom: 8),
                          child: Center(
                            child: Text(
                              'Contact',
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.lightBlueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        ContactForm(),
                      ],
                    ),
                  ),
                ]),
              ],
            )));
  }
}

class TabWords extends StatelessWidget {
  TabWords({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 15));
  }
}
