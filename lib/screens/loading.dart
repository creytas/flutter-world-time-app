import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';

  void setupWorldTime() async {
    WorldTime locationInstance = WorldTime(
      location: 'Kinshasa',
      flag: 'drc_flag.png',
      url: 'Africa/Kinshasa',
    );
    await locationInstance.getTime();
    setState(() {
      time = locationInstance.time!;
    });

    if (kDebugMode) {
      print(
          "${locationInstance.time} - ${locationInstance.flag} - ${locationInstance.location}");
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();

    if (kDebugMode) {
      print('initState function ran');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
