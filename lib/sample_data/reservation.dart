import 'package:today_my_school_final/models/model_reservation.dart';

List<Reservation> reservations = [
  Reservation(
    place: '아치라운지 대회의실',
    date: DateTime(2023, 5, 31),
    startTime: DateTime(2023, 5, 31, 17),
    endTime: DateTime(2023, 5, 31, 19),
    numOfPeople: 6,
    purpose: '팀플',
    uid: 'fg6ovxzoyUZi3PBHiui3n5SiiDs1',
    rid: 'AchiLounge_1',
  ),
  Reservation(
    place: '아치라운지 소회의실 A',
    date: DateTime(2023, 5, 12),
    startTime: DateTime(2023, 5, 12, 16),
    endTime: DateTime(2023, 5, 12, 17, 30),
    numOfPeople: 4,
    purpose: '팀플',
    uid: 'fg6ovxzoyUZi3PBHiui3n5SiiDs1',
    rid: 'AchiLounge_2',
  ),
  Reservation(
    place: '해과기관 스터디존 C',
    date: DateTime(2023, 5, 9),
    startTime: DateTime(2023, 5, 9, 9, 30),
    endTime: DateTime(2023, 5, 9, 11),
    numOfPeople: 5,
    purpose: '팀플',
    uid: 'fg6ovxzoyUZi3PBHiui3n5SiiDs1',
    rid: 'StudyZone_3',
  ),
  Reservation(
    place: '아치라운지 소회의실 B',
    date: DateTime(2023, 4, 25),
    startTime: DateTime(2023, 4, 25, 15),
    endTime: DateTime(2023, 4, 25, 17),
    numOfPeople: 3,
    purpose: '팀플',
    uid: 'fg6ovxzoyUZi3PBHiui3n5SiiDs1',
    rid: 'AchiLounge_3',
  ),
];
