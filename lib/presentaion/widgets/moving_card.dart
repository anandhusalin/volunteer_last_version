import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final item;
  final String url;
  const BannerCard({
    required this.url,
    Key? key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(url),
            opacity: 180,
            fit: BoxFit.fill,
          ),
          border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          SizedBox(
              height: 150,
              width: 120,
              child: Image.asset(
                url,
                fit: BoxFit.fill,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                alignment: Alignment.topLeft,
                height: 40,
                width: 170,
                child: Text(
                  '${item.name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    fontFamily: "Poppins",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                width: 170,
                child: Text(
                  '${item.taskTitle}',
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: "Poppins"),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                width: 170,
                child: Text(
                  '${item.taskDesc}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: "Poppins"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
