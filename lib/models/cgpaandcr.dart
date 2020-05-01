import 'package:flutter/foundation.dart';

class CGPAandCR with ChangeNotifier {
  double totalcr = 0;
  double cgpa = 0;

  update({cgpa, totalcr}) {
    cgpa = cgpa;
    totalcr = totalcr;
    notifyListeners();
  }

  reset() {
    totalcr = 0;
    cgpa = 0;
  }
}
