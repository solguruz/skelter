import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/home/widgets/home_app_bar.dart';
import 'package:flutter_skeleton/utils/date_time_picker_util.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                DateTimePickerUtil.showRangeDatePicker(
                  context: context,
                  onRangeSelected: (range) {
                    print('Start: ${range.start}, End: ${range.end}');
                  },
                );
              },
              child: const Text('Pick Date Range'),
            ),
            ElevatedButton(
              onPressed: () {
                DateTimePickerUtil.showSingleDatePicker(
                  context: context,
                  onDateSelected: (date) {
                    print('Date: $date');
                  },
                );
              },
              child: const Text('Pick Date Range'),
            ),
            ElevatedButton(
              onPressed: () {
                DateTimePickerUtil.showDateTimePicker(
                  context: context,
                  onDateTimeSelected: (dateTime) {
                    print("User picked: $dateTime");
                  },
                );
              },
              child: const Text('Pick Date and time'),
            ),
          ],
        ),
      ),
    );
  }
}
