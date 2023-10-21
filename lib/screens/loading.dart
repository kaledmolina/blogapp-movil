import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 219, 207, 221),
        child: const Center(
              child: CircularProgressIndicator(
            color: Colors.purple,
          ),
        ),
    );
  }
}
