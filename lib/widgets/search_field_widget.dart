import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
    required this.controller,
    required this.function,
  });
  final TextEditingController controller;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller,
            onChanged: (value) {
              function(value);
            },
            decoration: const InputDecoration(
              label: Text("Search"),
              floatingLabelStyle: TextStyle(fontSize: 20, color: Colors.black),
              fillColor: Color(0xffA9B388),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xff5F6F52)),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
