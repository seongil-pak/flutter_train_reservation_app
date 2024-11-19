import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final List<String> stations = [
    '수서',
    '동탄',
    '평택',
    '천안',
    '오송',
    '대전',
    '구미',
    '동대구',
    '경주',
    '울산',
    '부산',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('출발역'),
      ),
      body: ListView.builder(
          itemCount: stations.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              child: ListTile(
                title: Text(
                  stations[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context, stations[index]);
                },
              ),
            );
          }),
    );
  }
}
