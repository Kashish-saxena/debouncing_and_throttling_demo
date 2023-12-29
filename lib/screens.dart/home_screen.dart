import 'package:debouncing_and_throttling_demo/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Debouncer debouncer = Debouncer();
  final Throttler throttler = Throttler();

  TextEditingController searchController = TextEditingController();
  List<String> debouncedText = [];
  List<String> throttledText = [];

/*debounce function ensures that the API call is made 1 second after
 the user stops typing. If the user continues typing, the timer is reset,
 preventing the API call from being triggered too frequently.*/

  void textFieldChangeUsingDebouncing(String value) {
    const timeout = Duration(seconds: 1);
    debouncer.debounce(
      duration: timeout,
      onDebounce: () {
        setState(() {
          debouncedText.add(value);
        });
      },
    );
  }

/* Throttle function ensures that it's called at most once every 1 seconds no 
matter how quickly the user scrolls. */

  void textFieldChangeUsingThrottling(String value) {
    const timeout = Duration(seconds: 1);
    throttler.throttle(
      duration: timeout,
      onThrottle: () {
        setState(() {
          throttledText.add(value);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 254, 250, 224),
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SearchFieldWidget(
            controller: searchController,
            function: (value) {
              textFieldChangeUsingDebouncing(value);
              textFieldChangeUsingThrottling(value);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      "Debounced Text:",
                      style: TextStyle(fontSize: 20),
                    ),
                    if (searchController.text.isNotEmpty)
                      Text(
                        debouncedText.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      "Throttled Text:",
                      style: TextStyle(fontSize: 20),
                    ),
                    if (searchController.text.isNotEmpty)
                      Text(
                        throttledText.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
