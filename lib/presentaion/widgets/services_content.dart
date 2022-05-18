import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../model/profile_list_model.dart';

class ProfileListview extends StatelessWidget {
  final ProfileListViewModel list;
  const ProfileListview({
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.fill, image: AssetImage(list.image1)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      list.text1,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              bottom: 0,
            )
          ],
        ));
  }
}
