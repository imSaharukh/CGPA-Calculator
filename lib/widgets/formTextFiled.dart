import 'package:cgpacalculator/models/data/arrays.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormFieldTEXT extends StatelessWidget {
  final int index;
  final FullDetails fullDetails;
  FormFieldTEXT({this.index, this.fullDetails});
  @override
  Widget build(BuildContext context) {
    String course;
    double gpa;
    double credits;

    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: TextFormField(
            textInputAction: TextInputAction.done,
            decoration:
                InputDecoration(hintText: 'COURSE', border: InputBorder.none),
            validator: (v) {
              if (v.isEmpty) {
                return 'Enter Course';
              } else {
                return null;
              }
            },
            onSaved: (v) {
              course = v;
              // updatedata();
              fullDetails.course[index] = course;
              print(fullDetails.course[index]);
            },
            // onChanged: (v) {
            //   // fullDetails.course[index] = v;
            //   course = v;

            //   //print(course);
            // },
            // onFieldSubmitted: (_) {
            //   print('DONE');
            //   updatedata();
            // },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 2,
          child: TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            decoration:
                InputDecoration(hintText: 'Credits', border: InputBorder.none),
            // onChanged: (v) {
            //   // fullDetails.credits[index] = double.parse(v);
            //   credits = double.parse(v);
            // },
            // onFieldSubmitted: (_) {
            //   print('DONE');
            //   updatedata();
            // },
            validator: (v) {
              if (v.isEmpty) {
                return 'Please Enter Credits';
              } else {
                return null;
              }
            },
            onSaved: (v) {
              credits = double.parse(v);
              // updatedata();
              fullDetails.credits[index] = credits;
              print(fullDetails.credits[index]);
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 2,
          child: TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            decoration:
                InputDecoration(hintText: 'GPA', border: InputBorder.none),
            // onChanged: (v) {
            //   fullDetails.gpa[index] = double.parse(v);
            //   print(v);
            // },
            validator: (v) {
              if (v.isEmpty) {
                return 'Please Enter GPA';
              } else if (double.parse(v) > 4) {
                return 'Can\'t be more then 4.00';
              } else {
                return null;
              }
            },
            onSaved: (v) {
              gpa = double.parse(v);
              //updatedata();
              fullDetails.gpa[index] = gpa;
              print(fullDetails.gpa[index]);
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            final counter = Provider.of<DataArrays>(context, listen: false);
            counter.delete(index);
          },
        )
      ],
    );
  }
}
