import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:portfolio/sizeHelper.dart';
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
    return Padding(
      padding: EdgeInsets.only(
          left: 8.0, bottom: displayHeight(context) * .1, top: 8),
      child: Container(
        width: displayWidth(context) * .9,
        color: Colors.white10,
        child: ListView(children: [
          Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: displayWidth(context) * .07,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: displayWidth(context) * .2,
                          height: displayHeight(context) * .2,
                          child: Image(image: AssetImage(appIcon))),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      nolan
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Developers:',
                                  style: TextStyle(
                                      fontSize: displayWidth(context) * .04),
                                ),
                                Text(
                                  'Tateyana Hendricks',
                                  style: TextStyle(
                                      fontSize: displayWidth(context) * .04),
                                ),
                                InkWell(
                                  child: Text(
                                    'Nolan Sherman',
                                    style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontSize: displayWidth(context) * .04,
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
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: displayWidth(context) * .6,
                        child: Text(
                          shortDescription,
                          style:
                              TextStyle(fontSize: displayWidth(context) * .04),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'Learn More',
                          style: TextStyle(
                              color: Colors.lightBlueAccent,
                              decoration: TextDecoration.underline,
                              fontSize: displayWidth(context) * .04),
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
                    ],
                  ),
                ],
              ),
              OutlineButton(
                  child: Text(
                    'View App Screenshots',
                    style: TextStyle(fontSize: displayWidth(context) * .04),
                  ),
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
                      child: Container(
                        width: displayWidth(context) * .1,
                        height: displayHeight(context) * .1,
                        child:
                            Image(image: AssetImage('images/github icon.png')),
                      ),
                      splashColor: Colors.white,
                      onPressed: () {
                        launchURL(url);
                      },
                      focusColor: Colors.white,
                    )
                  : Container(),
            ],
          ),
        ]),
      ),
    );
  }
}
