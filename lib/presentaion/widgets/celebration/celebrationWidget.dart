import 'package:flutter/material.dart';

class CelebrationWidget extends StatelessWidget {
  final String name;
  final String serviceDescription;
  final void Function() celebrationWidgetAction;
  const CelebrationWidget(
      {Key? key,
      required this.name,
      required this.serviceDescription,
      required this.celebrationWidgetAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: celebrationWidgetAction,
      child: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Container(
          padding: const EdgeInsets.all(5),
          width: width * 0.75,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('images/Servicebnr.jpg'),
              opacity: 180,
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(10),
            // color: Colors.grey,
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 5),
              Container(
                height: 60,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  //  const BorderRadius.only(
                  //   topLeft: Radius.circular(25),
                  //   bottomLeft: Radius.circular(25),
                  // ),
                  child: Image.asset(
                    'images/Servicebnr.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$name',
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: "Poppins",
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      Text(
                        '$serviceDescription',
                        maxLines: 3,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: "Poppins",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 2),
            ],
          ),
        ),
      ),
    );
  }
}
