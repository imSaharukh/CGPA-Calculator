import 'package:cgpacalculator/models/cgpaandcr.dart';
import 'package:cgpacalculator/models/data/arrays.dart';
import 'package:cgpacalculator/widgets/circle.dart';
import 'package:cgpacalculator/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cgpaandcr = Provider.of<CGPAandCR>(context, listen: false);
    double totalcr = 0;
    double cgpa = 0;
    final _formKey = GlobalKey<FormState>();
    FullDetails fullDetails = FullDetails();
    final counter = Provider.of<DataArrays>(context, listen: false);
    void calculate() {
      double temp = 0;
      totalcr = 0;
      cgpa = 0;
      for (int i = 0; fullDetails.credits.length > i; i++) {
        temp = temp + (fullDetails.credits[i] * fullDetails.gpa[i]);

        totalcr = totalcr + fullDetails.credits[i];
      }
      cgpa = temp / totalcr;
      print(fullDetails.credits);
      print((fullDetails.gpa));
      // fullDetails.credits;
      // fullDetails.gpa;
      // print("cr = ${fullDetails.credits}");
      // print("object")
    }

    return Consumer<CGPAandCR>(
      builder: (context, cGPAandCR, _) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleTop(
                      number: cgpa.toStringAsFixed(2),
                      title: 'CGPA',
                    ),
                    CircleTop(
                      number: totalcr.toString(),
                      title: 'Credits',
                    ),
                  ],
                ),
                DetailsForm(
                  fullDetails: fullDetails,
                  formkey: _formKey,
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 100),
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.help),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: new Text("This is a Alpha build"),
                              content: new Text(
                                  "if u face any problem contract Saharukh"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Profile Link"),
                                  onPressed: () async {
                                    const url =
                                        'https://facebook.com/imSaharukh';
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                ),
                                // usually buttons at the bottom of the dialog
                                new FlatButton(
                                  child: new Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    }),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  color: Colors.blue,
                  child: Text('Calculate'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print("DONE");
                      calculate();
                      cgpaandcr.reset();
                      cgpaandcr.update(cgpa: cgpa, totalcr: totalcr);
                    }
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                // final counter = Provider.of<DataArrays>(context, listen: false);
                counter.plus();
              }),
        );
      },
    );
  }
}
