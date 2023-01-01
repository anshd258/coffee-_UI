import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class name_bar2 extends StatelessWidget {
  const name_bar2({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - 30,
      height: size.height - 730,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.access_alarm, color: Color.fromARGB(255, 182, 182, 182)),
          SizedBox(
            width: size.width - 340,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "02/01/2023",
                style: GoogleFonts.inter(
                    color: Color.fromARGB(255, 182, 182, 182), fontSize: 10),
              ),
              Text(
                "Joshua Scanlan",
                style: GoogleFonts.inter(
                    color: Color.fromARGB(255, 182, 182, 182), fontSize: 15),
              )
            ],
          ),
          SizedBox(
            width: size.width - 300,
          ),
          Container(
              alignment: Alignment.center,
              height: size.height - 750,
              width: size.width - 327,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 182, 182, 182)),
              child: Icon(
                Icons.delete_outline,
              )),
          SizedBox(
            width: size.width - 340,
          ),
          Container(
            height: size.height - 750,
            width: size.width - 327,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                    image: AssetImage(
                  "assets/logo.png",
                ))),
          )
        ],
      ),
    );
  }
}
