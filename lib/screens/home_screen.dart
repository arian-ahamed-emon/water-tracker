import 'package:flutter/material.dart';
import 'package:water_tracker/screens/history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassNoTEcontroller = TextEditingController(
    text: '1',
  );

  List<WaterTrack> waterTrackList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Water Tracker',
          style: TextStyle(color: Colors.black87, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryScreen()),
              );
            },
            icon: Icon(Icons.history),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(radius: 36),
                    SizedBox(height: 10),
                    Text('Arian Ahmed'),
                    Text('dev.emon.bd@gmail.com'),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(title: Text('Profile'));
                  },
                  separatorBuilder: (context, index) {
                    return Divider(color: Colors.black);
                  },
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(getTotalGlassCount().toString(), style: TextStyle(fontSize: 25)),
          Text('Glass/s)', style: TextStyle(fontSize: 24)),
          SizedBox(height: 50),
          Container(
            height: 240,
            width: 450,
            child: Column(
              children: [
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: addNewWaterTrack,
                  style: ElevatedButton.styleFrom(
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 30, color: Colors.black26),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 90,
                  width: 110,
                  child: TextField(
                    controller: _glassNoTEcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Number',
                    ),
                  ),
                ),
              ],
            ),
          ),
          buildWaterTrackerListTile(),
        ],
      ),
    );
  }

  Expanded buildWaterTrackerListTile() {
    return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final WaterTrack waterTrack = waterTrackList[index];
              return ListTile(
                title: Text(
                  '${waterTrack.dateTime.hour}:${waterTrack.dateTime.minute}',
                ),
                subtitle: Text(
                  '${waterTrack.dateTime.day}/${waterTrack.dateTime.month}/${waterTrack.dateTime.year}',
                ),
                leading: CircleAvatar(
                  child: Text('${waterTrack.noOfGlasses}'),
                ),
                trailing: IconButton(
                  onPressed: () => onTapDeleteButton(index),
                  icon: Icon(Icons.delete),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: waterTrackList.length,
          ),
        );
  }

  int getTotalGlassCount() {
    int counter = 0;
    for (WaterTrack t in waterTrackList) {
      counter += t.noOfGlasses;
    }
    return counter;
  }

  void addNewWaterTrack() {
    if (_glassNoTEcontroller.text.isEmpty) {
      _glassNoTEcontroller.text = '1';
    }
    final int noOfGlasses = int.tryParse(_glassNoTEcontroller.text) ?? 1;
    WaterTrack waterTrack = WaterTrack(
      noOfGlasses: noOfGlasses,
      dateTime: DateTime.now(),
    );
    waterTrackList.add(waterTrack);
    setState(() {});
  }

  void onTapDeleteButton(int index) {
    waterTrackList.removeAt(index);
    setState(() {});
  }
}

class WaterTrack {
  final int noOfGlasses;
  final DateTime dateTime;

  WaterTrack({required this.noOfGlasses, required this.dateTime});
}
