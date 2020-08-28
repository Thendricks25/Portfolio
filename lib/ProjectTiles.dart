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
              Row(
                children: [
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
              SizedBox(height: 20),
              Text(
                appDescription,
                style: TextStyle(fontSize: 25),
                overflow: TextOverflow.clip,
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
