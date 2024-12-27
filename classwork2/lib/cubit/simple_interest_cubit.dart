

import 'package:flutter_bloc/flutter_bloc.dart';

class InterestCubit extends Cubit<double> {
  InterestCubit() : super(0);

  void calculateInterest(double principal, double rate, double time) {
    emit((principal * rate * time) / 100);
  }
}
