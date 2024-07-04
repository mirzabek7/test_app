import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:test_app/screens/custom_calendar.dart';
import 'package:test_app/screens/daily_mood_screen.dart';
import 'package:test_app/test_icons.dart';
import 'package:test_app/utils/custom_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('d MMMM hh:mm');
    var widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          format.format(DateTime.now()),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: CustomColors.grey2,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 20, left: 20),
            onPressed: () {
              Navigator.of(context).pushNamed(CustomCalendar.routeName);
            },
            icon: const Icon(
              Test.calendar,
              color: CustomColors.grey2,
              size: 24,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: widthScreen * 0.8,
            height: widthScreen * 0.08,
            decoration: BoxDecoration(
              color: CustomColors.grey4,
              borderRadius: BorderRadius.circular(47),
            ),
            child: TabBar(
              indicator: const BoxDecoration(
                color: CustomColors.mandarin,
                borderRadius: BorderRadius.all(
                  Radius.circular(47),
                ),
              ),
              splashBorderRadius: BorderRadius.circular(47),
              indicatorSize: TabBarIndicatorSize.tab,
              tabAlignment: TabAlignment.fill,
              labelPadding: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              indicatorColor: Colors.transparent,
              dividerHeight: 0,
              controller: tabController,
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: const TextStyle(
                color: CustomColors.grey2,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Test.diary,
                        size: 12,
                        color: tabController.index == 0
                            ? Colors.white
                            : CustomColors.grey2,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        'Дневник настроения',
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Test.diary,
                        size: 12,
                        color: tabController.index == 1
                            ? Colors.white
                            : CustomColors.grey2,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        'Статистика',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 16),
              child: TabBarView(
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  DailyMoodScreen(),
                  Column(
                    children: [Text('Статистика')],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
