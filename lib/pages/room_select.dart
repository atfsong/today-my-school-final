import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:today_my_school_final/samples/room.dart';
import 'package:today_my_school_final/style.dart';

class RoomSelectPage extends StatefulWidget {
  const RoomSelectPage({super.key});

  @override
  State<RoomSelectPage> createState() => _RoomSelectPageState();
}

class _RoomSelectPageState extends State<RoomSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.blue,
        foregroundColor: ColorPalette.white,
        title: const Text(
          '예약하기',
          style: TextStyle(color: ColorPalette.white),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 154.h,
                decoration: const BoxDecoration(
                  color: ColorPalette.blue,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.zero,
                    bottom: Radius.circular(50),
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 16.h,
                      );
                    },
                    itemCount: rooms.length,
                    itemBuilder: (context, index) {
                      return ReservationStatusCard(
                        place: rooms[index].place,
                        location: rooms[index].location,
                        maxCapacity: rooms[index].maxCapacity,
                        image: rooms[index].image,
                        isAvailable: const {
                          '1': 'true',
                          '2': 'true',
                          '3': 'false',
                          '4': 'false',
                          '5': 'true',
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReservationStatusCard extends StatefulWidget {
  final String place;
  final String location;
  final int maxCapacity;
  final String image;
  Map isAvailable;

  ReservationStatusCard({
    super.key,
    required this.place,
    required this.location,
    required this.maxCapacity,
    required this.image,
    required this.isAvailable,
  });

  @override
  State<ReservationStatusCard> createState() => _ReservationStatusCardState();
}

class _ReservationStatusCardState extends State<ReservationStatusCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        color: ColorPalette.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 72.w,
                    height: 72.h,
                    child: Image.asset(
                      widget.image,
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
                    widget.place,
                    style: TextStyleSet.medium15,
                  ),
                  Text(
                    widget.location,
                    style: TextStyleSet.light13,
                  ),
                  Text(
                    '최대 ${widget.maxCapacity}명 이용 가능',
                    style: TextStyleSet.light13,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 2.w);
              },
              itemCount: widget.isAvailable.length,
              itemBuilder: (context, index) {
                for (var value in widget.isAvailable.values) {
                  if (value == 'true') {
                    StatusBar(
                      color: ColorPalette.green,
                    );
                  }
                  return StatusBar(
                    color: ColorPalette.grey,
                  );
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StatusBar extends StatelessWidget {
  Color color;

  StatusBar({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}
