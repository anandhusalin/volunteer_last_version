import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final progress;
  const ProgressWidget({
    Key? key,
    this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 5),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 35.0,
            width: 35.0,
            child: CircularProgressIndicator(
              value: (progress / 10) / 10,
              valueColor: const AlwaysStoppedAnimation(primaryColor),
              backgroundColor: Colors.grey,
            ),
          ),
          Text(
            '$progress%',
            style: const TextStyle(
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
