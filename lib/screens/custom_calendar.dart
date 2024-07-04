import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test_app/test_icons.dart';
import 'package:test_app/utils/custom_colors.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({super.key});
  static const routeName = '/calendar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Test.cancel,
            color: Color(0xffBCBCBF),
            size: 16,
          ),
        ),
        actions: const [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: const Text(
              'Сегодня',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xffBCBCBF),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(1999),
            lastDay: DateTime(2077),
            calendarFormat: CalendarFormat.month,
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xffBCBCBF),
              ),
              weekendStyle: TextStyle(
                fontSize: 12,
                color: Color(0xffBCBCBF),
              ),
            ),
            onFormatChanged: (format) {},
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                leftChevronVisible: false,
                rightChevronVisible: false,
                headerPadding: EdgeInsets.only(left: 20)),
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, day, focusedDay) {
                return Container(
                  width: 41,
                  height: 41,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: CustomColors.orangeGradient,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('d').format(day),
                      ),
                      Align(
                        alignment: const Alignment(0, 1),
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                              color: CustomColors.mandarin,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      )
                    ],
                  ),
                );
              },
              headerTitleBuilder: (context, day) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('y').format(day),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: CustomColors.grey2,
                      ),
                    ),
                    Text(
                      DateFormat('MMMM').format(day),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: CustomColors.black,
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
