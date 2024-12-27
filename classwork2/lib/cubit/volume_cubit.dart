import 'package:flutter_bloc/flutter_bloc.dart';

class VolumeCubit extends Cubit<double> {
  VolumeCubit() : super(0.0);

  void calculateVolume(double radius, double height) {
    final volume = 3.14159 * radius * radius * height;
    emit(volume);
  }
}
