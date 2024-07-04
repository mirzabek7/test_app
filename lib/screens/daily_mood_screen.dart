import 'package:flutter/material.dart';
import 'package:test_app/utils/custom_colors.dart';
import 'package:test_app/utils/moods.dart';
import 'package:test_app/widgets/custom_slider.dart';

import '../widgets/mood_item.dart';

class DailyMoodScreen extends StatefulWidget {
  const DailyMoodScreen({super.key});

  @override
  State<DailyMoodScreen> createState() => _DailyMoodScreenState();
}

class _DailyMoodScreenState extends State<DailyMoodScreen> {
  double _stressValue = 0.5;
  double _rating = 0.5;
  bool _isSelected = false;
  int? moodIndex;
  String selectedFeeling = '';

  void setNewStressValue(double value) {
    setState(() {
      _stressValue = value;
    });
  }

  void setNewRatingValue(double value) {
    setState(() {
      _rating = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Что чувствуешь?',
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 134,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                var moods = Moods.moodsList;
                return InkWell(
                  onTap: () {
                    setState(() {
                      _isSelected = true;
                      moodIndex = index;
                    });
                  },
                  child: MoodItem(
                    title: moods.keys.toList()[index],
                    imagePath: moods.values.toList()[index],
                    isSelected: (_isSelected && moodIndex == index),
                  ),
                );
              },
              itemCount: Moods.moodsList.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _isSelected
                    ? Wrap(
                        children: List.generate(
                          Moods.feelings.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedFeeling = Moods.feelings[index];
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 8),
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color:
                                      selectedFeeling == Moods.feelings[index]
                                          ? CustomColors.mandarin
                                          : Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      spreadRadius: 0,
                                      blurRadius: 10.8,
                                      offset: Offset(2, 4),
                                      color:
                                          Color.fromRGBO(182, 161, 192, 0.11),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  Moods.feelings[index],
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox(),
                _isSelected
                    ? const SizedBox(
                        height: 36,
                      )
                    : const SizedBox(),
                const Text(
                  'Уровень стресса',
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomSlider(
                  value: _stressValue,
                  setValue: setNewStressValue,
                  firstTitle: 'Низкий',
                  lastTitle: 'Высокий',
                ),
                const SizedBox(
                  height: 36,
                ),
                const Text(
                  'Самооценка',
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomSlider(
                  value: _rating,
                  setValue: setNewRatingValue,
                  firstTitle: 'Неуверенность',
                  lastTitle: 'Уверенность',
                ),
                const SizedBox(
                  height: 36,
                ),
                const Text(
                  'Заметки',
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      spreadRadius: 0,
                      blurRadius: 10.8,
                      offset: Offset(2, 4),
                      color: Color.fromRGBO(182, 161, 192, 0.11),
                    ),
                  ], borderRadius: BorderRadius.all(Radius.circular(13))),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(13),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    maxLines: 4,
                    style: const TextStyle(
                      color: CustomColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 44),
                    backgroundColor: CustomColors.mandarin,
                  ),
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
