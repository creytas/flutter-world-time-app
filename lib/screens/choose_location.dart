import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
      location: "Tokyo",
      flag: "japon_flag.png",
      url: "Asia/Tokyo",
    ),
    WorldTime(
      location: "London",
      flag: "uk_flag.png",
      url: "Europe/London",
    ),
    WorldTime(
      location: 'Kinshasa',
      flag: 'drc_flag.png',
      url: 'Africa/Kinshasa',
    ),
    WorldTime(
      location: "New York",
      flag: "usa_flag.png",
      url: "America/New_York",
    ),
    WorldTime(
      location: "Sao Paulo",
      flag: "brazil_flag.png",
      url: "America/Sao_Paulo",
    ),
  ];

  void updateTime(index) async {
    WorldTime locationInstance = locations[index];
    await locationInstance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': locationInstance.location,
      'time': locationInstance.time,
      'flag': locationInstance.flag,
      'isDayTime': locationInstance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build function ran');
    }
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text("Choose a Location"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 2.0,
              horizontal: 4.0,
            ),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                  if (kDebugMode) {
                    print(locations[index].location);
                  }
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }
}
