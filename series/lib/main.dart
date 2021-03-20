import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:series/VideoContainer.dart';
import 'package:series/VideoWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';
    final PageController controller =
        PageController(initialPage: 1, viewportFraction: 0.45);

    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.ranchersTextTheme(
          Theme.of(context).textTheme
        )
      ),
      title: title,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text("Femi Apps" , style: TextStyle(
                fontSize: 48
              ),),
              SizedBox(
                height: 700,
                child: PageView(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Card(
                        child: Column(
                          children: [

                            Flexible(
                              flex: 80,
                              child: ClipRect(
                                child: VideoContainer(
                                  link: "femiapps1.mp4",
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 20,
                              child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: ListTile(
                                  title: Text("Week 9, 2021", style: TextStyle(
                                      fontSize: 24
                                  ),),
                                  subtitle: Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child:  Text("If Rust Lang was a person, Football app and more apps",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Card(
                        child: Column(
                          children: [

                            Flexible(
                              flex: 80,
                              child: GestureDetector(
                                onTap: (){
                                  print("dd");
                                },
                                onDoubleTap: (){
                                  print("dd00");
                                },
                                child: ClipRect(
                                  child: VideoContainer(
                                    link: "femiapps2.mp4",
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 20,
                              child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: ListTile(
                                  title: Text("Week 10, 2021", style: TextStyle(
                                      fontSize: 24
                                  ),),
                                  subtitle: Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child:  Text("Open Banking, Football app results, Apple pie",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Expanded(
// flex: 15,
// child: ListTile(
// leading: Icon(Icons.add),
// title: Text("Week 9",style: TextStyle(
// fontSize: 32
// ),),
// subtitle: Text("2021"),
// ),
// ),
