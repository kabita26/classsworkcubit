import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/simple_interest_cubit.dart';

class InterestView extends StatelessWidget {
  InterestView({super.key});

  final _principalController = TextEditingController();
  final _rateController = TextEditingController();
  final _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest Calculator'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter the details below:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _principalController,
              decoration: InputDecoration(
                labelText: 'Principal',
                border: OutlineInputBorder(),
                suffixIcon: const Icon(Icons.attach_money),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _rateController,
              decoration: InputDecoration(
                labelText: 'Rate (%)',
                border: OutlineInputBorder(),
                suffixIcon: const Icon(Icons.percent),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Time (Years)',
                border: OutlineInputBorder(),
                suffixIcon: const Icon(Icons.timer),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final principal = double.tryParse(_principalController.text);
                final rate = double.tryParse(_rateController.text);
                final time = double.tryParse(_timeController.text);
                if (principal != null && rate != null && time != null) {
                  context.read<InterestCubit>().calculateInterest(principal, rate, time);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Calculate', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            BlocBuilder<InterestCubit, double>(builder: (context, interest) {
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.greenAccent, width: 2),
                ),
                child: Text(
                  'Simple Interest: ${interest.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
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
