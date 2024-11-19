import 'package:flutter/material.dart';
import 'package:flutter_train_reservation_app/stationlist/station_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedDeparture = '선택'; // 출발역의 초기값 설정
  String selectedArrival = '선택'; // 도착역의 초기값 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기차 예매'), // AppBar 제목 설정
      ),
      backgroundColor: Colors.grey[200], // 배경색 설정
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
          children: [
            // 출발역 선택 컨테이너
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // 모서리 둥글게
                color: Colors.white, // 컨테이너 배경색 흰색
              ),
              height: 200,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // 가로축 중앙 정렬
                children: [
                  // 출발역 선택 컬럼
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, // 세로축 중앙 정렬
                    children: [
                      Text(
                        '출발역',
                        style: TextStyle(
                          fontSize: 16, // 폰트 크기 설정
                          fontWeight: FontWeight.bold, // 볼드체
                          color: Colors.grey, // 글씨 색상 설정
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          // 클릭 시 동작 설정
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StationListPage(), // StationListPage로 이동
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              selectedDeparture = result; // 선택된 출발역 값 설정
                            });
                          }
                        },
                        child: Text(
                          selectedDeparture, // 선택된 출발역 표시
                          style: TextStyle(
                            fontSize: 40, // 폰트 크기 설정
                          ),
                        ),
                      ),
                    ],
                  ),
                  // 출발역과 도착역 사이의 구분선
                  Padding(
                    padding: const EdgeInsets.all(40), // 간격 설정
                    child: Container(
                      width: 2,
                      height: 50,
                      color: Colors.grey[400], // 구분선 색상 설정
                    ),
                  ),
                  // 도착역 선택 컬럼
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, // 세로축 중앙 정렬
                    children: [
                      Text(
                        '도착역',
                        style: TextStyle(
                          fontSize: 16, // 폰트 크기 설정
                          fontWeight: FontWeight.bold, // 볼드체
                          color: Colors.grey, // 글씨 색상 설정
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          // 클릭 시 동작 설정
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StationListPage(), // StationListPage로 이동
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              selectedArrival = result; // 선택된 도착역 값 설정
                            });
                          }
                        },
                        child: Text(
                          selectedArrival, // 선택된 도착역 표시
                          style: TextStyle(
                            fontSize: 40, // 폰트 크기 설정
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20, // 간격 설정
            ),
            // 좌석 선택 버튼
            Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), // 모서리를 둥글게 설정
              ),
              child: ElevatedButton(
                onPressed: () {}, // 버튼 클릭 시 동작 설정
                child: Text(
                  '좌석 선택',
                  style: TextStyle(
                    fontSize: 18, // 폰트 크기 설정
                    fontWeight: FontWeight.bold, // 볼드체
                    color: Colors.white, // 글씨 색상 설정
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // 버튼 배경색 설정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // 모서리를 둥글게 설정
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
