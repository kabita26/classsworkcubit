import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/area_cubit.dart';

class AreaView extends StatelessWidget {
  AreaView({super.key});

  final _radiusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter the radius of the circle:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _radiusController,
              decoration: InputDecoration(
                labelText: 'Radius',
                border: OutlineInputBorder(),
                suffixIcon: const Icon(Icons.circle),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final radius = double.tryParse(_radiusController.text);
                if (radius != null) {
                  context.read<AreaCubit>().calculateArea(radius);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Calculate', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            BlocBuilder<AreaCubit, double>(builder: (context, area) {
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blueAccent, width: 2),
                ),
                child: Text(
                  'Area: ${area.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
