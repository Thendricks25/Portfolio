import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectTile extends StatelessWidget {
  ProjectTile(
      {this.appTitle,
      this.appDescription,
      this.images,
      this.url,
      this.github,
      this.nolan});
  final String appTitle;
  final String appDescription;
  final images;
  final url;
  final bool github;
  final bool nolan;

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
      child: Center(
        child: Container(
          child: Row(children: [
            Column(
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
                Row(
                  children: [
                    Container(
                      height: getValueForScreenType(
                          context: context, desktop: 500, mobile: 250),
                      width: getValueForScreenType(
                          context: context, desktop: 300, mobile: 150),
                      child: Carousel(
                        images: images,
                        dotColor: Colors.lightBlueAccent,
                        dotIncreasedColor: Colors.lightBlueAccent,
                        autoplay: false,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    nolan
                        ? Column(
                            children: [
                              Text(
                                'Developers:',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Tateyana Hendricks',
                                style: TextStyle(fontSize: 20),
                              ),
                              InkWell(
                                child: Text(
                                  'Nolan Sherman',
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontSize: 20,
                                      decoration: TextDecoration.underline),
                                ),
                                onTap: () {
                                  launchURL(
                                      'https://www.linkedin.com/in/nolanrsherman');
                                },
                                hoverColor: Colors.white,
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 300,
                  child: Text(
                    appDescription,
                    style: TextStyle(
                        fontSize: getValueForScreenType(
                            context: context, desktop: 25, mobile: 15)),
                  ),
                ),
                //github icon
                github
                    ? FlatButton(
                        child:
                            Image(image: AssetImage('images/github icon.png')),
                        splashColor: Colors.white,
                        onPressed: () {
                          launchURL(url);
                        },
                        focusColor: Colors.white,
                      )
                    : Container(),
              ],
            ),
            SizedBox(height: 100),
          ]),
        ),
      ),
    );
  }
}

class MobileProjectTiles extends StatelessWidget {
  MobileProjectTiles(
      {this.title,
      this.appIcon,
      this.shortDescription,
      this.longDescription,
      this.images,
      this.nolan,
      this.github,
      this.url});
  final String title;
  final String appIcon;
  final String shortDescription;
  final String longDescription;
  final images;
  final bool nolan;
  final bool github;
  final url;

  launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      child: Card(
        margin: EdgeInsets.all(28),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                    width: 150,
                    height: 150,
                    child: Image(image: AssetImage(appIcon))),
              ),
              nolan
                  ? Column(
                      children: [
                        Text(
                          'Developers:',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Tateyana Hendricks',
                          style: TextStyle(fontSize: 20),
                        ),
                        InkWell(
                          child: Text(
                            'Nolan Sherman',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: 20,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            launchURL(
                                'https://www.linkedin.com/in/nolanrsherman');
                          },
                          hoverColor: Colors.white,
                        ),
                      ],
                    )
                  : Container(),
              Text(shortDescription),
              InkWell(
                child: Text(
                  'Learn More',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      decoration: TextDecoration.underline),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('App Description'),
                          content: Text(longDescription),
                          actions: [
                            InkWell(
                              child: Text('Close'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
              OutlineButton(
                  child: Text('View App Screenshots'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Screenshots'),
                          content: Container(
                            height: 300,
                            width: 150,
                            child: Carousel(
                              images: images,
                              dotColor: Colors.lightBlueAccent,
                              dotIncreasedColor: Colors.lightBlueAccent,
                              autoplay: false,
                            ),
                          ),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Close'))
                          ],
                        );
                      },
                    );
                  }),
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
            ],
          ),
        ),
      ),
    );
  }
}
