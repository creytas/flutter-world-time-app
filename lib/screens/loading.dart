import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime locationInstance = WorldTime(
      location: 'Kinshasa',
      flag: 'drc_flag.png',
      url: 'Africa/Kinshasa',
    );
    await locationInstance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': locationInstance.location,
      'time': locationInstance.time,
      'flag': locationInstance.flag,
      'isDayTime': locationInstance.isDayTime,
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
    return const Scaffold(
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.blueAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
