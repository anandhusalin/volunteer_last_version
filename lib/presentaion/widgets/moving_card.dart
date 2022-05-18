import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final String url;
  const BannerCard({
    required this.url,
    Key? key,
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
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 15, right: 10),
                child: Text(
                  "Bhama",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: "Poppins"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 10),
                child: Text(
                  "Task Title",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: "Poppins"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 10),
                child: Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
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
