import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mesas_moviles/contenido/memory_mesas.dart';
import 'package:mesas_moviles/contenido/mesa_emet.dart';

class mesa_movil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: mesas.length,
        itemBuilder: (context, index) {
          final mesa = mesas[index];
          return Iten_mesa_movil(
            mesa: mesa,
          );
        },
      ),
    );
  }
}

class Iten_mesa_movil extends StatefulWidget {
  final Mesas mesa;

  const Iten_mesa_movil({Key key, this.mesa}) : super(key: key);

  @override
  _Iten_mesa_movilState createState() => _Iten_mesa_movilState();
}

class _Iten_mesa_movilState extends State<Iten_mesa_movil> {
  bool accepted = false;
  @override
  Widget build(BuildContext context) {
    Widget mesaspri = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.table_chart,
                      color: Colors.blue,
                      size: 60,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.mesa.name,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Draggable(
              feedback: mesaspri,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.table_chart,
                      color: Colors.blue,
                    ),
                    Text(
                      'Tables',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              //childWhenDragging: Container(),
            ),
            SizedBox(
              height: 150,
            ),
            DragTarget(
              builder: (context, data, rejecteadData) {
                return Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.table_chart,
                            color: Colors.blue,
                          ),
                          Text(
                            'Table',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    accepted == true ? Center(child: mesaspri) : Container(),
                  ],
                );
              },
              onWillAccept: (data) {
                return true;
              },
              onAccept: (data) {
                setState(() {
                  accepted = true;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
