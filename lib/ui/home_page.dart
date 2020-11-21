import 'package:flutter/material.dart';
import 'package:task/ui/facts_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: ListView(
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
            ),
            child: _createGridView(context),
          )),
        ],
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
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFFF8F8),
              ),
              width: 518,
              child: TextField(
                textAlign: TextAlign.center,
                autofocus: false,
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
              color: Color(0xFFC4C4C4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {},
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
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 21,
        crossAxisSpacing: 86,
        childAspectRatio: 7.04,
      ),
      itemBuilder: (context, index) {
        return FactsCard();
      },
      itemCount: 4,
    );
  }
}
