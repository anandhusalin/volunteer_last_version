import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String text1;
  const SearchBar({
    required this.text1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const SizedBox(
            width: 17,
          ),
          const Icon(
            Icons.search,
            color: Color.fromARGB(255, 169, 164, 164),
            size: 30,
          ),
          Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.all(8.0),
            child: Text(
              text1,
              style: const TextStyle(
                color: Color.fromARGB(255, 139, 132, 132),
              ),
            ),
          )
        ],
      ),
      height: 50,
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromARGB(255, 194, 180, 180))),
    );
  }
}
