import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 5),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            child: const CircularProgressIndicator(
              value: 8 / 10,
              valueColor: AlwaysStoppedAnimation(primaryColor),
              backgroundColor: Colors.grey,
            ),
          ),
          const Text(
            '10%',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              // color: ,
            ),
          )
        ],
      ),
    );
  }
}
