import 'package:flutter/material.dart';
import 'package:tesla_app/car_model.dart';
import 'car_cards.dart';
class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pg = PageController();
  var _currentPage = 0.0;

  onPageChange() {
    setState(() {
      _currentPage = _pg.page!;
    });
  }

  @override
  void initState() {
    _pg.addListener(onPageChange);
    super.initState();
  }

  @override
  void dispose() {
    _pg.removeListener(onPageChange);
    _pg.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.notes_rounded,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Stack(
          children: [


            PageView.builder(
              controller: _pg,
              itemCount: boats.length,
              itemBuilder: (context, index) {
                final boat = boats[index];
                final value = index < _currentPage
                    ? _currentPage - index
                    : index - _currentPage;
                final opacity =
                (1 - (value == 1.0 ? 1.0 : value * 2)).clamp(0.25, 1.0);
                return Transform.scale(
                  scale: opacity.clamp(0.85, 1.0),
                  child: Opacity(
                    opacity: opacity,
                    child: BoatCard(boat: boat),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
