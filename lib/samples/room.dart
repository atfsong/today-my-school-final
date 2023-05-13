class Room {
  final String place;
  final String location;
  final List availablTime;
  final int maxTime;
  final int maxCapacity;
  final List? facilities;
  final String image;

  Room({
    required this.place,
    required this.location,
    required this.availablTime,
    required this.maxTime,
    required this.maxCapacity,
    this.facilities,
    required this.image,
  });
}

Map<int, String> timeSet = {
  10: '10:00-11:00',
  11: '11:00-12:00',
  12: '12:00-13:00',
  13: '13:00-14:00',
  14: '14:00-15:00',
  15: '15:00-16:00',
  16: '16:00-17:00',
  17: '17:00-18:00',
  18: '18:00-19:00',
  19: '19:00-20:00',
};

List<Room> rooms = [
  Room(
    place: '아치라운지 대회의실',
    location: '어울림관 4층',
    availablTime: [timeSet],
    maxTime: 2,
    maxCapacity: 10,
    facilities: ['LED TV', 'PC', '화이트보드'],
    image: 'assets/images/sample.jpg',
  ),
  Room(
    place: '아치라운지 소회의실 A',
    location: '어울림관 4층',
    availablTime: [timeSet],
    maxTime: 2,
    maxCapacity: 4,
    facilities: ['LED TV', 'PC', '화이트보드'],
    image: 'assets/images/sample.jpg',
  ),
  Room(
    place: '아치라운지 소회의실 B',
    location: '어울림관 4층',
    availablTime: [timeSet],
    maxTime: 2,
    maxCapacity: 4,
    facilities: ['LED TV', 'PC', '화이트보드'],
    image: 'assets/images/sample.jpg',
  ),
  Room(
    place: '아치라운지 소회의실 C',
    location: '어울림관 4층',
    availablTime: [timeSet],
    maxTime: 2,
    maxCapacity: 4,
    facilities: ['LED TV', 'PC', '화이트보드'],
    image: 'assets/images/sample.jpg',
  ),
  Room(
    place: '해과기관 스터디존 A',
    location: '해양과학기술관 2층',
    availablTime: [timeSet],
    maxTime: 2,
    maxCapacity: 4,
    image: 'assets/images/sample.jpg',
  ),
  Room(
    place: '해과기관 스터디존 B',
    location: '해양과학기술관 2층',
    availablTime: [timeSet],
    maxTime: 2,
    maxCapacity: 4,
    image: 'assets/images/sample.jpg',
  ),
  Room(
    place: '해과기관 스터디존 C',
    location: '해양과학기술관 2층',
    availablTime: [timeSet],
    maxTime: 2,
    maxCapacity: 4,
    image: 'assets/images/sample.jpg',
  ),
  Room(
    place: '해과기관 스터디존 D',
    location: '해양과학기술관 2층',
    availablTime: [timeSet],
    maxTime: 2,
    maxCapacity: 4,
    image: 'assets/images/sample.jpg',
  ),
  Room(
    place: '해과기관 스터디존 E',
    location: '해양과학기술관 2층',
    availablTime: [timeSet],
    maxTime: 2,
    maxCapacity: 4,
    image: 'assets/images/sample.jpg',
  ),
];
