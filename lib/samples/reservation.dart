class Reservation {
  final String place;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final int numOfPeople;
  final String purpose;

  Reservation({
    required this.place,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.numOfPeople,
    required this.purpose,
  });
}

List<Reservation> reservations = [
  Reservation(
    place: '아치라운지 대회의실',
    date: DateTime(2023, 5, 12),
    startTime: DateTime(2023, 5, 12, 17),
    endTime: DateTime(2023, 5, 12, 19),
    numOfPeople: 6,
    purpose: '팀플',
  ),
  Reservation(
    place: '아치라운지 소회의실 A',
    date: DateTime(2023, 5, 9),
    startTime: DateTime(2023, 5, 9, 16),
    endTime: DateTime(2023, 5, 9, 17, 30),
    numOfPeople: 4,
    purpose: '팀플',
  ),
  Reservation(
    place: '해과기관 스터디존 C',
    date: DateTime(2023, 4, 25),
    startTime: DateTime(2023, 4, 25, 9, 30),
    endTime: DateTime(2023, 4, 25, 11),
    numOfPeople: 5,
    purpose: '팀플',
  ),
  Reservation(
    place: '아치라운지 소회의실 B',
    date: DateTime(2023, 4, 13),
    startTime: DateTime(2023, 4, 13, 15),
    endTime: DateTime(2023, 4, 13, 17),
    numOfPeople: 3,
    purpose: '팀플',
  ),
];
