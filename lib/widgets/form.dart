import 'package:cgpacalculator/models/data/arrays.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'formTextFiled.dart';

class DetailsForm extends StatelessWidget {
  final formkey;
  final FullDetails fullDetails;
  // final List counter = [0, 1];
  DetailsForm({@required this.formkey, @required this.fullDetails});
  @override
  Widget build(BuildContext context) {
    return Consumer<DataArrays>(
      builder: (context, dataArrays, _) {
        //  final counter = Provider.of<DataArrays>(context);
        return Card(
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: dataArrays.counter.length,
                  itemBuilder: (contex, i) {
                    print("ListView index = $i");

                    return FormFieldTEXT(
                      index: i,
                      fullDetails: fullDetails,
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
