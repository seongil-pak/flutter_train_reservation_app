import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  final String departureStation;
  final String arrivalStation;

  SeatPage({required this.departureStation, required this.arrivalStation});

  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  List<List<String>> seats =
      List.generate(10, (i) => List.filled(4, 'available'));
  List<String> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${widget.departureStation}',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple)),
                Text('${widget.arrivalStation}',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple)),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(10, (row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (col) {
                        String seatNumber =
                            '${String.fromCharCode(65 + col)}${row + 1}';
                        bool isSelected = selectedSeats.contains(seatNumber);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedSeats.remove(seatNumber);
                                selectedSeats.add(seatNumber);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(4.0),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.purple : Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: isSelected
                                ? Center(
                                    child: Text(
                                      seatNumber,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : Container(),
                          ),
                        );
                      }),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: selectedSeats.isEmpty
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('좌석 예약 완료'),
                              content:
                                  Text('선택된 좌석: ${selectedSeats.join(', ')}'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('확인'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                child: Text(
                  '예매 하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
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
