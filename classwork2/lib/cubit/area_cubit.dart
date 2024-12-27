import 'package:flutter_bloc/flutter_bloc.dart';

class AreaCubit extends Cubit<double> {
  AreaCubit() : super(0);

  void calculateArea(double radius) {
    emit(3.14159 * radius * radius);
  }
}
