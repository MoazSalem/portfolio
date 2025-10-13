import 'package:flutter/material.dart';
import 'package:portfolio/core/models/user.dart';

class ExternalLinksWrap extends StatelessWidget {
  final List<ExternalLink> externalLinks;
  const ExternalLinksWrap({super.key, required this.externalLinks});

  @override
  Widget build(BuildContext context) {
    // TODO: implement external links
    return Wrap(
      spacing: 10,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: Size(140, 60),
            maximumSize: Size(140, 60),
          ),
          onPressed: () {},
          child: Row(
            spacing: 10,
            children: [
              Text("VIEW CV", style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(Icons.find_in_page),
            ],
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: Size(60, 60),
            maximumSize: Size(70, 60),
          ),
          onPressed: () {},
          child: Row(spacing: 10, children: [Icon(Icons.android)]),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: Size(60, 60),
            maximumSize: Size(70, 60),
          ),
          onPressed: () {},
          child: Row(spacing: 10, children: [Icon(Icons.android)]),
        ),
      ],
    );
  }
}
