import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    //Simulating a delay for data fetch
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'Shashwat';
    });

    //Bio of the user
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'Vegan , Dickhead , And i don\'t give a fuck bout your felling attitude';
    });

    print('$username -  $bio');
  }

  @override
  void initState() {
    super.initState();
    getData();
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
      body: const Text('Choose Location'),
      backgroundColor: Colors.grey[200],
    );
  }
}
