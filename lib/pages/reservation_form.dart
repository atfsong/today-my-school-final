import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:today_my_school_final/models/model_reservation.dart';
import 'package:today_my_school_final/models/model_reserve.dart';
import 'package:today_my_school_final/samples/room.dart';
import 'package:today_my_school_final/style.dart';

class ReservationForm extends StatefulWidget {
  const ReservationForm({super.key});

  @override
  State<ReservationForm> createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  static final _formKey = GlobalKey<FormState>();
  final String _place = rooms[0].place;
  final String _location = rooms[0].location;
  final int _maxTime = rooms[0].maxTime;
  final int _maxCapacity = rooms[0].maxCapacity;
  final String _image = rooms[0].image;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReserveFieldModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.white,
          foregroundColor: ColorPalette.blue,
          title: const Text('예약 정보 입력'),
        ),
        body: SafeArea(
          bottom: false,
          child: Center(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: RoomInfo(
                            place: _place,
                            location: _location,
                            maxTime: _maxTime,
                            maxCapacity: _maxCapacity,
                            image: _image),
                      ),
                      Container(
                        height: 16.h,
                        color: ColorPalette.blue.withOpacity(0.05),
                      ),
                      const DatePicker(),
                      Container(
                        height: 16.h,
                        color: ColorPalette.blue.withOpacity(0.05),
                      ),
                      const TimePicker(),
                      Container(
                        height: 16.h,
                        color: ColorPalette.blue.withOpacity(0.05),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 16.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            InputGuide(),
                            NameDisplay(),
                            PhoneDisplay(),
                            TimeDisplay(),
                            NumOfPeopleInput(),
                            PurposeInput(),
                          ],
                        ),
                      ),
                      const ReserveButton(),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RoomInfo extends StatelessWidget {
  final String place;
  final String location;
  final int maxTime;
  final int maxCapacity;
  final String image;

  const RoomInfo({
    super.key,
    required this.place,
    required this.location,
    required this.maxTime,
    required this.maxCapacity,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(24.w, 0, 16.w, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 80.w,
              height: 80.h,
              child: Image.asset(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place,
              style: TextStyleSet.semibold18,
            ),
            Text(
              location,
              style: TextStyleSet.light15,
            ),
            Text(
              '최대 $maxTime시간 이용 가능',
              style: TextStyleSet.light13,
            ),
            Text(
              '최대 $maxCapacity명 이용 가능',
              style: TextStyleSet.light13,
            ),
          ],
        ),
      ],
    );
  }
}

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final reserveField = Provider.of<ReserveFieldModel>(context, listen: false);
    return ExpansionTile(
      title: const Text('날짜'),
      children: [
        TableCalendar(
          locale: 'ko_KR',
          focusedDay: focusedDay,
          firstDay: DateTime.utc(2023, 1, 1),
          lastDay: DateTime.utc(2024, 12, 31),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              this.selectedDay = selectedDay;
              this.focusedDay = selectedDay;
            });
            reserveField.date = selectedDay;
          },
          selectedDayPredicate: (day) =>
              day.year == selectedDay.year &&
              day.month == selectedDay.month &&
              day.day == selectedDay.day,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
          ),
          calendarStyle: CalendarStyle(
              todayTextStyle: const TextStyle(color: ColorPalette.black),
              todayDecoration: BoxDecoration(
                color: ColorPalette.blue.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              selectedTextStyle: const TextStyle(color: ColorPalette.white),
              selectedDecoration: const BoxDecoration(
                color: ColorPalette.blue,
                shape: BoxShape.circle,
              ),
              outsideTextStyle: const TextStyle(color: ColorPalette.grey),
              disabledTextStyle: const TextStyle(color: ColorPalette.grey),
              defaultTextStyle: const TextStyle(color: ColorPalette.black)),
        )
      ],
    );
  }
}

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('시간'),
      children: [
        ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(width: 8.h);
          },
          itemCount: 10,
          itemBuilder: (context, index) {
            return;
          },
        )
      ],
    );
  }
}

class InputGuide extends StatelessWidget {
  const InputGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '* ',
        style: TextStyleSet.semibold15.copyWith(color: ColorPalette.red),
        children: <TextSpan>[
          TextSpan(text: '예약자 정보', style: TextStyleSet.medium18),
        ],
      ),
    );
  }
}

class NameDisplay extends StatefulWidget {
  const NameDisplay({super.key});

  @override
  State<NameDisplay> createState() => _NameDisplayState();
}

class _NameDisplayState extends State<NameDisplay> {
  String name = '';
  String phone = '';

  Future _getUser() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (snapshot) async {
        if (snapshot.exists) {
          setState(() {
            name = snapshot.data()!['name'];
            phone = snapshot.data()!['phone'];
            snapshot.data()!['uid'];
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    final reserveField = Provider.of<ReserveFieldModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            '이름',
            style: TextStyleSet.light13,
          ),
        ),
        SizedBox(
          width: 192.w,
          height: 64.h,
          child: TextFormField(
            initialValue: name.isEmpty ? '이름' : name,
            style: TextStyleSet.regular15,
            decoration: InputDecoration(
              helperText: '',
              errorStyle:
                  TextStyleSet.light11.copyWith(color: ColorPalette.red),
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.grey,
                  width: 1,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.grey,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.blue,
                  width: 2,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.red,
                  width: 1,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.red,
                  width: 2,
                ),
              ),
            ),
            enabled: false,
            cursorColor: ColorPalette.black,
          ),
        ),
      ],
    );
  }
}

class PhoneDisplay extends StatefulWidget {
  const PhoneDisplay({super.key});

  @override
  State<PhoneDisplay> createState() => _PhoneDisplayState();
}

class _PhoneDisplayState extends State<PhoneDisplay> {
  String name = '';
  String phone = '';

  Future _getUser() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (snapshot) async {
        if (snapshot.exists) {
          setState(() {
            name = snapshot.data()!['name'];
            phone = snapshot.data()!['phone'];
            snapshot.data()!['uid'];
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    final reserveField = Provider.of<ReserveFieldModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            '연락처',
            style: TextStyleSet.light13,
          ),
        ),
        SizedBox(
          width: 192.w,
          height: 64.h,
          child: TextFormField(
            initialValue: phone.isEmpty
                ? '연락처'
                : '${phone.substring(0, 3)}-${phone.substring(3, 7)}-${phone.substring(7)}',
            style: TextStyleSet.regular15,
            decoration: InputDecoration(
              helperText: '',
              errorStyle:
                  TextStyleSet.light11.copyWith(color: ColorPalette.red),
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.grey,
                  width: 1,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.grey,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.blue,
                  width: 2,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.red,
                  width: 1,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.red,
                  width: 2,
                ),
              ),
            ),
            enabled: false,
            cursorColor: ColorPalette.black,
          ),
        ),
      ],
    );
  }
}

class TimeDisplay extends StatelessWidget {
  const TimeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final reserveField = Provider.of<ReserveFieldModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            '이용 시간',
            style: TextStyleSet.light13,
          ),
        ),
        SizedBox(
          width: 192.w,
          height: 64.h,
          child: TextFormField(
            initialValue: '이용 시간',
            style: TextStyleSet.regular15,
            decoration: InputDecoration(
              helperText: '',
              errorStyle:
                  TextStyleSet.light11.copyWith(color: ColorPalette.red),
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.grey,
                  width: 1,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.grey,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.blue,
                  width: 2,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.red,
                  width: 1,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.red,
                  width: 2,
                ),
              ),
            ),
            enabled: false,
            cursorColor: ColorPalette.black,
          ),
        ),
      ],
    );
  }
}

class NumOfPeopleInput extends StatelessWidget {
  const NumOfPeopleInput({super.key});

  @override
  Widget build(BuildContext context) {
    final reserveField = Provider.of<ReserveFieldModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            '이용 인원',
            style: TextStyleSet.light13,
          ),
        ),
        SizedBox(
          width: 192.w,
          height: 64.h,
          child: TextFormField(
            keyboardType: TextInputType.number,
            onChanged: (numOfPeople) {
              reserveField.setNumOfPeople(0);
            },
            validator: (numOfPeople) {
              if (numOfPeople!.trim().isEmpty) {
                return '이용 인원을 입력하세요';
              }
              return null;
            },
            style: TextStyleSet.regular15,
            decoration: InputDecoration(
              helperText: '',
              errorStyle:
                  TextStyleSet.light11.copyWith(color: ColorPalette.red),
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.grey,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.blue,
                  width: 2,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.red,
                  width: 1,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.red,
                  width: 2,
                ),
              ),
            ),
            cursorColor: ColorPalette.black,
          ),
        ),
      ],
    );
  }
}

class PurposeInput extends StatelessWidget {
  const PurposeInput({super.key});

  @override
  Widget build(BuildContext context) {
    final reserveField = Provider.of<ReserveFieldModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            '이용 목적',
            style: TextStyleSet.light13,
          ),
        ),
        SizedBox(
          width: 192.w,
          height: 64.h,
          child: TextFormField(
            onChanged: (purpose) {
              reserveField.setPurpose(purpose);
            },
            validator: (purpose) {
              if (purpose!.trim().isEmpty) {
                return '이용 목적을 입력하세요';
              }
              return null;
            },
            style: TextStyleSet.regular15,
            decoration: InputDecoration(
              helperText: '',
              errorStyle:
                  TextStyleSet.light11.copyWith(color: ColorPalette.red),
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.grey,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.blue,
                  width: 2,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.red,
                  width: 1,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: ColorPalette.red,
                  width: 2,
                ),
              ),
            ),
            cursorColor: ColorPalette.black,
          ),
        ),
      ],
    );
  }
}

class ReserveButton extends StatelessWidget {
  const ReserveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final reservation = Provider.of<ReservationModel>(context, listen: false);
    final reserveField = Provider.of<ReserveFieldModel>(context, listen: false);
    return SizedBox(
      width: 128.w,
      height: 40.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPalette.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () async {
          if (_ReservationFormState._formKey.currentState!.validate()) {
            await reservation
                .reserveRoom(
              reserveField.place,
              reserveField.date,
              reserveField.startTime,
              reserveField.endTime,
              reserveField.numOfPeople,
              reserveField.purpose,
            )
                .then(
              (reservationStatus) {
                if (reservationStatus == ReservationStatus.success) {
                  Navigator.of(context)
                      .pushReplacementNamed('/reservation_result');
                } else {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(content: Text('예약에 실패했어요 다시 시도해주세요')),
                    );
                  Navigator.pop(context);
                }
              },
            );
          }
        },
        child: Text(
          '예약하기',
          style: TextStyleSet.bold16.copyWith(color: ColorPalette.white),
        ),
      ),
    );
  }
}
