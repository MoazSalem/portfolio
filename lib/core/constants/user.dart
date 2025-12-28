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
      NumericalDescription(title: 'Clients', value: 3),
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
      imgUrl:
          "https://github.com/user-attachments/assets/adf3c1cf-a773-47a2-89dd-f67084660539",
      url: "https://github.com/MoazSalem/pills-reminder-flutter",
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
      imgUrl:
          "https://github-production-user-asset-6210df.s3.amazonaws.com/88838071/502971249-1e10011b-9c74-42bc-b0c2-5f205ebc5a0e.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20251228%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20251228T133814Z&X-Amz-Expires=300&X-Amz-Signature=8e7fe19a13df5da6d315f89881832f80592d2f1604b91d42684949370760e0ac&X-Amz-SignedHeaders=host",
      url: "https://github.com/MoazSalem/otex-flutter",
    ),
    Project(
      name: "Image Sorter",
      description:
          "An Android app built with Flutter to rescue your photos with messed-up dates and timestamps.",
      tags: ["Flutter", "Native", "Android"],
      imgUrl:
          "https://github.com/user-attachments/assets/331fbd22-be52-47cd-b008-dc10722c28d2",
      url: "https://github.com/MoazSalem/image-sorter-flutter",
    ),
    Project(
      name: "FakeStore E-Commerce",
      description:
          "E-Commerce app with Clean Architecture and BLoC, featuring seamless API integration, offline persistence, optimized image handling, and Payment Integration (Paymob).",
      tags: ["Flutter", "Payment Integration", "Bloc", "Caching"],
      imgUrl:
          "https://github.com/user-attachments/assets/4d4f86fb-9002-4b93-b935-a4d802b2c6dc",
      url: "https://github.com/MoazSalem/fakestore-e-commerce-flutter",
    ),
    Project(
      name: "TMDB",
      description:
          "Flutter Web app implementing TMDB API, integrated Deep Linking using go_router and Bloc state management.",
      tags: ["Flutter", "Web", "Bloc", "Deep Linking"],
      imgUrl:
          "https://github.com/MoazSalem/tmdb-flutter-web/assets/88838071/d25e8705-6ba3-4ebf-ac60-796002cc8e52",
      url: "https://github.com/MoazSalem/tmdb-flutter-web",
    ),
    Project(
      name: "Snake",
      description:
          "Mobile game with online leaderboard using Firestore, Bloc, and MVVM principles; optimized for smooth performance.",
      tags: ["Flutter", "Firebase", "Firestore", "Bloc"],
      imgUrl:
          "https://github.com/MoazSalem/snake-game-flutter/assets/88838071/53bd0bd1-26e6-4084-a1f7-87c3075a6185",
      url: "https://github.com/MoazSalem/snake-game-flutter",
    ),
    Project(
      name: "Colorful Notes",
      description:
          "Notes app with Clean Architecture and Riverpod, text & voice notes, Arabic localization, customizable themes, and offline storage (sqflite).",
      tags: ["Flutter", "Riverpod", "Sqflite", "Voice Recording"],
      imgUrl:
          "https://github.com/MoazSalem/colorful-notes-flutter/assets/88838071/03e46cc3-022a-4f76-a740-a885d5203131",
      url: "https://github.com/MoazSalem/colorful-notes-flutter",
    ),
  ],
);
