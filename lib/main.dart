import 'package:andeapp/pages/consultaprevia.dart';
import 'package:andeapp/pages/contactos.dart';
import 'package:andeapp/pages/form2.dart';
import 'package:andeapp/pages/home.dart';
import 'package:andeapp/pages/ubicacion.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _pageIndex = 0;

  //crear el indice de las paginas
  final Home _listHome = Home();
  final ConsultaPrevia _lisConsultas = new ConsultaPrevia();
  final Form2 _listForm2 = new Form2();
  final Ubicacion _listUbicacion = new Ubicacion();
  final Contactos _lisContactos = new Contactos();

  Widget showPage = new Home(); //establecer la pestanha de inicio al abrir la aplicacion

  Widget _pageChooser(int page){//establecer la posicion de cada item del menu
    switch (page){
      case 0:
      return _listHome;
      break;
      case 1:
      return _lisConsultas;
      break;
      case 2:
      return _listForm2;
      break;
      case 3:
      return _listUbicacion;
      break;
      case 4:
      return _lisContactos;
      break;
      default:
      return new Container(
        child: new Center(
          child: Text(
            "No ha seleccionado una pagina", style: new TextStyle(fontSize: 30),
          ),
        ),
      );
    }
  }


  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: showPage,
          ),
        ));
  }
}