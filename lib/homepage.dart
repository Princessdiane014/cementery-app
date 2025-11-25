import 'package:flutter/material.dart';
import 'cemetery_map.dart';
import 'reservation_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cemetery Reservation"),
      ),

      // 👇 HINDI BINAGO ANG STYLE NG HOMEPAGE MO
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo stays here
            Image.asset(
              "assets/logo.png",
              width: 120,
            ),

            const SizedBox(height: 20),

            const Text(
              "Welcome to Cemetery Reservation",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              child: const Text("Open Cemetery Map"),
              onPressed: () async {
                final selectedLot = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CemeteryMapScreen(),
                  ),
                );

                // kung may napiling lote → proceed to reservation
                if (selectedLot != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReservationForm(
                        selectedLot: selectedLot,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
