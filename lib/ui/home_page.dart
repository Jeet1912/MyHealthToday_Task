import 'package:flutter/material.dart';
import 'package:task/data_model/cursor_helper.dart';
import 'package:task/data_model/facts_model.dart';
import 'package:task/service/api_service.dart';
import 'package:task/service/validator.dart';
import 'package:task/ui/facts_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Facts> _facts;
  int _n = 0;
  bool _submitted = false;
  bool _check = false;
  TextEditingControllerWithCursorPosition _controller =
      new TextEditingControllerWithCursorPosition();
  @override
  void initState() {
    _facts = ApiService().getFacts();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: Scrollbar(
        child: ListView(
          children: [
            SizedBox(
              height: 54.0,
            ),
            _createTopPortion(),
            Center(
                child: Padding(
              padding: EdgeInsets.only(
                left: 227,
                right: 227.0,
                top: 113.0,
                bottom: 100,
              ),
              child: _createGridView(context),
            )),
          ],
        ),
      ),
    );
  }

  Widget _createTopPortion() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          "https://bestofmycat.com/wp-content/uploads/2019/08/cat-facts-800x445.png",
          height: 361,
          width: 670,
        ),
        SizedBox(
          height: 21,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFFF8F8),
              ),
              width: 518,
              child: TextField(
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                autofocus: true,
                controller: _controller,
                onChanged: (value) {
                  _controller.text = value;
                  _check = Validators().isNumeric(_controller.text);
                },
                onEditingComplete: () {
                  setState(() {
                    if (_check == true) {
                      _submitted = true;
                      _n = int.parse(_controller.text);
                    }
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter Numer of Facts you want",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 18,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF9A9797),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF9A9797), width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              width: 24,
            ),
            FlatButton(
              height: 52,
              minWidth: 116,
              disabledColor:
                  _controller.text.isEmpty ? Colors.grey : Color(0xFFC4C4C4),
              color: Color(0xFFC4C4C4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {
                setState(() {
                  if (_check == true) {
                    _submitted = true;
                    _n = int.parse(_controller.text);
                  }
                });
              },
              child: Text(
                "Get Facts",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _createGridView(BuildContext context) {
    return _submitted && _check && Validators().isLess(_n)
        ? FutureBuilder<Facts>(
            future: _facts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return FactsCard(n: _n, snapshot: snapshot);
              } else {
                return Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            })
        : Text(
            "Please enter a numeric value from 1,2,3...,287 only.",
            style: TextStyle(
              color: Colors.red[400],
              fontSize: 15,
            ),
          );
  }
}
