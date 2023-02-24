import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 55,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFF5F6FA),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFF5F6FA),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFF5F6FA),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                hintText: "${MediaQuery.of(context).size.width}",
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF8F959E),
                ),
                filled: true,
                fillColor: Color(0xFFF5F6FA),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF9775FA),
            ),
            child: Icon(Icons.mic_none),
          ),
        )
      ],
    );
  }
}
