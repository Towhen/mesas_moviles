import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mesas_moviles/contenido/banner.dart';
import 'package:mesas_moviles/mesa/mesa_movil.dart';

class MesasPage extends StatefulWidget {
  @override
  _MesasPageState createState() => _MesasPageState();
}

class _MesasPageState extends State<MesasPage> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    // final currentTheme = Provider.of<ThemeProvider>(context);
    // return ChangeNotifierProvider.value(
    //   value: themeChangeProvider,
    child:
    Flexible(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            //done van las mesas
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[400],
                    Colors.blue[800],
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            //menu de navegacion
            SafeArea(
              child: Container(
                width: 200.0,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    DrawerHeader(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage:
                                AssetImage('assets/images/logo-1.jpg'),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Hooka Store',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, 'menu');
                            },
                            leading: Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Home',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, 'mesas');
                            },
                            leading: Icon(
                              Icons.table_view,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Tables',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, 'menu');
                            },
                            leading: Icon(
                              Icons.store,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Products',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, 'menu');
                            },
                            leading: Icon(
                              Icons.card_travel_outlined,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Order',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, 'menu');
                            },
                            leading: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Setting',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            leading: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Go out',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.wb_sunny,
                                // color: currentTheme.isDarkTheme()
                                //     ? Color(0xff2a293d)
                                //     : Colors.white,
                              ),
                              // Switch(
                              //   value: currentTheme.isDarkTheme(),
                              //   onChanged: (value) {
                              //     String newTheme = value
                              //         ? ThemePreference.DARK
                              //         : ThemePreference.DARK;
                              //     currentTheme.setTheme = newTheme;
                              //   },
                              // ),
                              Icon(
                                Icons.brightness_2,
                                // color: currentTheme.isDarkTheme()
                                //     ? Color(0xff2a293d)
                                //     : Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: value),
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                builder: (_, double val, __) {
                  return (Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY((pi / 6) * val),
                    child: Scaffold(
                      // backgroundColor: currentTheme.isDarkTheme()
                      //     ? Color(0xff2a293d)
                      //     : Colors.white,
                      appBar: AppBar(
                        title: Text('Selectable Tables'),
                        // backgroundColor: currentTheme.isDarkTheme()
                        //     ? Colors.black12
                        //     : Colors.blue,
                      ),
                      body: Center(
                        child: Column(
                          children: <Widget>[
                            BannerTienda(),
                            mesa_movil(),
                          ],
                        ),
                      ),
                    ),
                  ));
                }),
            GestureDetector(
              onHorizontalDragUpdate: (e) {
                if (e.delta.dx > 0) {
                  setState(() {
                    value = 1;
                  });
                } else {
                  setState(() {
                    value = 0;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
