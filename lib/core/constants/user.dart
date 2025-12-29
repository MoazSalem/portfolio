import 'package:portfolio/domain/entities/user.dart';

// The user data used for the portfolio.
const User user = User(
  introductionData: IntroductionData(
    name: 'Moaz Salem',
    title: 'Flutter Developer',
    description:
        'Software Engineer with a passion for clean code, challenging UIs, and building adaptive & responsive cross-platform applications.',
    avatarUrl: 'https://avatars.githubusercontent.com/u/88838071?v=4',
    numericalDescriptions: [
      NumericalDescription(title: 'Age', value: 25),
      NumericalDescription(title: 'Years of Experience', value: 2),
      NumericalDescription(title: 'Projects', value: 10),
      NumericalDescription(title: 'Published Apps', value: 2),
    ],
  ),
  externalLinks: [
    ExternalLink(
      // name should be in small case, represents the name of the link. e.g. facebook, github, linkedin
      // or just make sure the asset exists in the assets folder.
      // also make sure the first one is the cv, or change the if condition in the external links wrap widget
      name: 'resume',
      url:
          'https://drive.google.com/file/d/1viWJ5lCL-ovu1606cpyWby8WItkZ2yMK/view?usp=drive_link',
    ),
    ExternalLink(
      name: 'github',
      iconAssetName: '',
      url: 'https://github.com/MoazSalem',
    ),
    ExternalLink(
      name: 'linkedin',
      iconAssetName: '',
      url: 'https://www.linkedin.com/in/moaztalaat/',
    ),
  ],
  // Education Data
  educationData: EducationData(
    universityName: "Zagazig University, Faculty of Engineering",
    degreeName: "Bachelor in Computer Systems Engineering",
    startDate: "2018",
    endDate: "2023",
    // This is optional and can be null.
    graduationProject: GraduationProject(
      title: "Graduation Project: ADAS – Advanced Driver Assistance System",
      description:
          "BLE based multi-device communication and real-time car control via WebSockets",
      score: "94/100",
      link: "https://github.com/e7na/adas_app",
    ),
  ),
  projects: [
    Project(
      name: "Pills Reminder",
      description:
          "Medicine reminder app with Clean Architecture and GetX, precise scheduling via Flutter Local Notifications (persists across reboots).",
      tags: ["Flutter", "Notifications", "GetX"],
      url: "https://github.com/MoazSalem/pills-reminder-flutter",
      assetsLocation: [
        "assets/images/previews/pills/1.webp",
        "assets/images/previews/pills/2.webp",
        "assets/images/previews/pills/3.webp",
        "assets/images/previews/pills/4.webp",
        "assets/images/previews/pills/5.webp",
        "assets/images/previews/pills/6.webp",
        "assets/images/previews/pills/7.webp",
        "assets/images/previews/pills/8.webp",
        "assets/images/previews/pills/9.webp",
        "assets/images/previews/pills/10.webp",
      ],
    ),
    Project(
      name: "Freud AI UI Kit",
      description:
          "Converted complex Figma design to Flutter UI, implemented responsive layouts and reusable components.",
      tags: ["Flutter", "Figma", "Design", "UI"],
      // imgUrl: "",
      url: "https://github.com/MoazSalem/freud-ui-kit-flutter",
    ),
    Project(
      name: "Otex E-Commerce",
      description: "E-Commerce app with Clean Architecture and BLoC.",
      tags: ["Flutter", "Bloc", "Figma", "Clean Architecture"],
      url: "https://github.com/MoazSalem/otex-flutter",
      assetsLocation: [
        "assets/images/previews/otex/1.webp",
        "assets/images/previews/otex/2.webp",
        "assets/images/previews/otex/3.webp",
        "assets/images/previews/otex/4.webp",
        "assets/images/previews/otex/5.webp",
        "assets/images/previews/otex/6.webp",
      ],
    ),
    Project(
      name: "Image Sorter",
      description:
          "An Android app built with Flutter to rescue your photos with messed-up dates and timestamps.",
      tags: ["Flutter", "Native", "Android"],
      url: "https://github.com/MoazSalem/image-sorter-flutter",
      assetsLocation: [
        "assets/images/previews/sorter/1.webp",
        "assets/images/previews/sorter/2.webp",
        "assets/images/previews/sorter/3.webp",
        "assets/images/previews/sorter/4.webp",
      ],
    ),
    Project(
      name: "FakeStore E-Commerce",
      description:
          "E-Commerce app with Clean Architecture and BLoC, featuring seamless API integration, offline persistence, optimized image handling, and Payment Integration (Paymob).",
      tags: ["Flutter", "Payment Integration", "Bloc", "Caching"],
      url: "https://github.com/MoazSalem/fakestore-e-commerce-flutter",
    ),
    Project(
      name: "TMDB",
      description:
          "Flutter Web app implementing TMDB API, integrated Deep Linking using go_router and Bloc state management.",
      tags: ["Flutter", "Web", "Bloc", "Deep Linking"],
      url: "https://github.com/MoazSalem/tmdb-flutter-web",
    ),
    Project(
      name: "Snake",
      description:
          "Mobile game with online leaderboard using Firestore, Bloc, and MVVM principles; optimized for smooth performance.",
      tags: ["Flutter", "Firebase", "Firestore", "Bloc"],
      url: "https://github.com/MoazSalem/snake-game-flutter",
    ),
    Project(
      name: "Colorful Notes",
      description:
          "Notes app with Clean Architecture and Riverpod, text & voice notes, Arabic localization, customizable themes, and offline storage (sqflite).",
      tags: ["Flutter", "Riverpod", "Sqflite", "Voice Recording"],
      url: "https://github.com/MoazSalem/colorful-notes-flutter",
      assetsLocation: [
        "assets/images/previews/colorful/1.webp",
        "assets/images/previews/colorful/2.webp",
        "assets/images/previews/colorful/3.webp",
        "assets/images/previews/colorful/4.webp",
        "assets/images/previews/colorful/5.webp",
        "assets/images/previews/colorful/6.webp",
      ],
    ),
  ],
  email: "moaztalaat6@gmail.com",
);
