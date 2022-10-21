import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Range Picker',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 74),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTimeRange _dateTimeRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Range Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${_dateTimeRange.duration.inDays}'),
            ElevatedButton(
              onPressed: () async {
                final DateTimeRange? selectedDateTimeRange = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  initialEntryMode: DatePickerEntryMode.input,
                );

                if (selectedDateTimeRange != null) {
                  setState(() {
                    _dateTimeRange = selectedDateTimeRange;
                  });
                }
              },
              child: const Text('Show Date Time Range'),
            ),
          ],
        ),
      ),
    );
  }
}
