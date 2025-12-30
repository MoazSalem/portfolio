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
      clickUrl: "https://github.com/MoazSalem/pills-reminder-flutter",
      assetsLocation: ["assets/images/previews/pills.webp"],
      externalLinks: [
        ExternalLink(
          name: "playstore",
          iconAssetName: "playstore",
          displayName: "Google Play",
          url:
              "https://play.google.com/store/apps/details?id=com.moazsalem.pills_reminder",
        ),
      ],
    ),
    Project(
      name: "Freud AI UI Kit",
      description:
          "Converted complex Figma design to Flutter UI, implemented responsive layouts and reusable components.",
      tags: ["Flutter", "Figma", "Design", "Complex UI"],
      // imgUrl: "",
      clickUrl: "https://github.com/MoazSalem/freud-ui-kit-flutter",
      assetsLocation: ["assets/images/previews/freud.webp"],
      externalLinks: [
        ExternalLink(
          name: "demo",
          displayName: "Live Demo",
          url: "https://moazsalem.github.io/freud-ui-kit-flutter/",
        ),
      ],
    ),
    Project(
      name: "Otex E-Commerce",
      description: "E-Commerce app with Clean Architecture and BLoC.",
      tags: ["Flutter", "Bloc", "Figma", "Clean Architecture"],
      clickUrl: "https://github.com/MoazSalem/otex-flutter",
      assetsLocation: ["assets/images/previews/otex.webp"],
    ),
    Project(
      name: "Image Sorter",
      description:
          "An Android app built with Flutter to rescue your photos with messed-up dates and timestamps.",
      tags: ["Flutter", "Platform Channels", "Android"],
      clickUrl: "https://github.com/MoazSalem/image-sorter-flutter",
      assetsLocation: ["assets/images/previews/sorter.webp"],
    ),
    Project(
      name: "FakeStore E-Commerce",
      description:
          "E-Commerce app with Clean Architecture and BLoC, featuring seamless API integration, offline persistence, optimized image handling, and Payment Integration (Paymob).",
      tags: ["Flutter", "Payment Integration", "Bloc", "Caching"],
      clickUrl: "https://github.com/MoazSalem/fakestore-e-commerce-flutter",
      assetsLocation: ["assets/images/previews/fakestore.webp"],
      externalLinks: [
        ExternalLink(
          name: "demo",
          displayName: "Live Demo",
          url: "https://moazsalem.github.io/fakestore-e-commerce-flutter/",
        ),
      ],
    ),
    Project(
      name: "TMDB",
      description:
          "Flutter Web app implementing TMDB API, integrated Deep Linking using go_router and Bloc state management.",
      tags: ["Flutter", "Api", "Web", "Bloc", "Deep Linking"],
      clickUrl: "https://github.com/MoazSalem/tmdb-flutter-web",
      assetsLocation: ["assets/images/previews/tmdb.webp"],
      externalLinks: [
        ExternalLink(
          name: "demo",
          displayName: "Live Demo",
          url: "https://tmdb55.web.app/js/",
        ),
      ],
    ),
    Project(
      name: "Snake",
      description:
          "Mobile game with online leaderboard using Firestore, Bloc, and MVVM principles; optimized for smooth performance.",
      tags: ["Flutter", "Game", "Firebase", "Firestore", "Bloc"],
      clickUrl: "https://github.com/MoazSalem/snake-game-flutter",
      assetsLocation: ["assets/images/previews/snake.webp"],
    ),
    Project(
      name: "Colorful Notes",
      description:
          "Notes app with Clean Architecture and Riverpod, text & voice notes, Arabic localization, customizable themes, and offline storage (sqflite).",
      tags: ["Flutter", "Riverpod", "Sqflite", "Voice Recording"],
      clickUrl: "https://github.com/MoazSalem/colorful-notes-flutter",
      assetsLocation: ["assets/images/previews/colorful.webp"],
      externalLinks: [
        ExternalLink(
          name: "playstore",
          iconAssetName: "playstore",
          displayName: "Google Play",
          url:
              'https://play.google.com/store/apps/details?id=com.moazsalem.notes',
        ),
      ],
    ),
  ],
  email: "moaztalaat6@gmail.com",
);
