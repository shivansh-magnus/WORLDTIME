import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', Location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', Location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', Location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', Location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', Location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', Location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', Location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', Location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', Location: 'Kolkata', flag: 'india.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'Location': instance.Location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].Location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
