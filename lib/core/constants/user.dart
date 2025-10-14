import 'package:portfolio/core/models/user.dart';

// The user data used for the portfolio.
const User user = User(
  introductionData: IntroductionData(
    name: 'Moaz Salem',
    title: 'Flutter Developer',
    description:
        'Software Engineer with a passion for clean code, challenging UIs, and building adaptive & responsive cross-platform applications.',
    avatarUrl:
        'https://media.licdn.com/dms/image/v2/D4D03AQHw1dNS8d2J3Q/profile-displayphoto-crop_800_800/B4DZjB7Y6IGkAI-/0/1755600229242?e=1762992000&v=beta&t=3qkGjDfeih2y7ZKBWqh_sT4DBw7S3Q2VPuDLjkMFaUE',
    numericalDescriptions: [
      NumericalDescription(title: 'Age', value: 25),
      NumericalDescription(title: 'Years of Experience', value: 3),
      NumericalDescription(title: 'Projects', value: 10),
      NumericalDescription(title: 'Clients', value: 5),
    ],
  ),
  externalLinks: [
    ExternalLink(
      name: 'CV',
      url:
          'https://drive.google.com/file/d/1viWJ5lCL-ovu1606cpyWby8WItkZ2yMK/view?usp=drive_link',
    ),
    ExternalLink(
      name: 'GitHub',
      iconAssetName: '',
      url: 'https://github.com/MoazSalem',
    ),
    ExternalLink(
      name: 'LinkedIn',
      iconAssetName: '',
      url: 'https://www.linkedin.com/in/moaztalaat/',
    ),
  ],
);
