import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/volume_cubit.dart';

class VolumeView extends StatelessWidget {
  VolumeView({super.key});

  final _radiusController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volume of Cylinder'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter the radius of the cylinder base:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _radiusController,
              decoration: const InputDecoration(
                labelText: 'Radius',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.circle),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter the height of the cylinder:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _heightController,
              decoration: const InputDecoration(
                labelText: 'Height',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final radius = double.tryParse(_radiusController.text);
                final height = double.tryParse(_heightController.text);
                if (radius != null && height != null) {
                  context.read<VolumeCubit>().calculateVolume(radius, height);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Calculate Volume', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            BlocBuilder<VolumeCubit, double>(
              builder: (context, volume) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blueAccent, width: 2),
                  ),
                  child: Text(
                    'Volume: ${volume.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
