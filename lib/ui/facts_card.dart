import 'package:flutter/material.dart';
import 'package:task/data_model/facts_model.dart';

class FactsCard extends StatelessWidget {
  final int n;
  final AsyncSnapshot<Facts> snapshot;
  const FactsCard({Key key, @required this.n, @required this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Facts facts = snapshot.data;

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 21,
        crossAxisSpacing: 86,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        var text = facts.all[index].text;

        return Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Color(0xFFC1A7A7),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 23, horizontal: 10),
          child: Center(child: Text("Fact $index - $text")),
        );
      },
      itemCount: n,
    );
  }
}
