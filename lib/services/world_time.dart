import 'dart:convert';
import 'package:http/http.dart';

class WorldTime {
  String Location; //This will have location
  late String time; //this will have time of that location
  String flag; //this will contain url of flag of that location
  String url; //this will contain location url for API endpoint

  WorldTime({required this.Location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //print('$datetime - $offset');

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time variable
      time = now.toString();
    } catch (e) {
      print("Caught error : $e");
      time = 'Could not get time data';
    }
  }
}