import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeContent extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;

  const WelcomeContent({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<WelcomeContent> createState() => _WelcomeContentState();
}

class _WelcomeContentState extends State<WelcomeContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Spacer(),
          Image(image: AssetImage(widget.imageUrl),),
          const Spacer(),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(40),
            child: Text(
              widget.description,
              textAlign: TextAlign.justify,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
