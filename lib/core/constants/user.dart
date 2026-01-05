import 'package:portfolio/domain/entities/user.dart';

// The user data used for the portfolio.
const User user = User(
  introductionData: IntroductionData(
    name: 'Moaz Salem',
    title: 'Flutter Developer',
    description:
        'Software Engineer with a passion for clean code, challenging UIs, and building adaptive & responsive cross-platform applications.',
    avatarUrl: 'assets/images/avatar.webp',
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
  workExperiences: [
    WorkExperience(
      companyName: "PUIUX",
      position: "Junior Flutter Developer",
      startDate: "Apr 2025",
      endDate: "Nov 2025",
      responsibilities: [
        "Led the development of a scalable, high-performance mobile application, focusing on user experience and feature-rich functionality.",
        "Improved app performance and reduced load time by 30% through optimized state management and caching, and increased user engagement by 25% after redesigning UI with animations and adaptive layouts.",
        "Reduced crash rate by 40% using automated testing (unit & widget tests).",
      ],
    ),
    WorkExperience(
      companyName: "Freelancer",
      position: "Flutter Developer",
      startDate: "Oct 2022",
      endDate: "Present",
      responsibilities: [
        "Delivered multiple mobile applications for clients, implementing features such as Google AdSense monetization and local notifications.",
        "Developed a desktop mapping app to visualize and highlight locations, improving usability for client workflows.",
        "Collaborated directly with clients to refine requirements, ensuring on-time delivery and high satisfaction.",
      ],
    ),
    WorkExperience(
      companyName: "Egyptian Armed Forces",
      position: "IT Support Specialist",
      startDate: "Mar 2024",
      endDate: "Mar 2025",
      responsibilities: [
        "Managed and maintained a network of over 30 computers, including printer configuration, and customized existing systems to meet organizational requirements.",
        "Provided technical management and coordination for multiple seminars across Egypt, ensuring smooth operations and effective on-site support.",
        "Created, edited, and formatted professional documents and presentations using Microsoft Word and PowerPoint.",
      ],
    ),
    WorkExperience(
      companyName: "OnClick Marketing Agency",
      position: "Junior Flutter Developer",
      startDate: "Jan 2023",
      endDate: "Dec 2023",
      responsibilities: [
        "Collaborated with a dynamic team to develop and enhance multiple mobile applications, ensuring high-quality user experiences.",
        "Diagnosed and resolved bugs in production environments, contributing to improved app stability and performance.",
        "Provided ongoing support for production applications, streamlining processes, and reducing downtime by 20%.",
      ],
    ),
    WorkExperience(
      companyName: "ITI - Information Technology Institute",
      position: "Cross platform Software Mobile Development Training",
      startDate: "Jun 2022",
      endDate: "Sep 2022",
      responsibilities: [
        "Built a team-based capstone project, applying agile methodologies, Git version control, and UI design principles.",
        "Gained practical experience in Flutter & Dart fundamentals with structured training.",
        "Contributed to full app lifecycle: planning, feature development, and presentation.",
      ],
    ),
    WorkExperience(
      companyName: "Huawei",
      position: "Certified Graphic Designer",
      startDate: "2019",
      endDate: "2023",
      responsibilities: [
        "Designed and developed both free and paid graphic designs for Huawei Mobile Themes and watch faces, achieving millions of downloads worldwide.",
        "Participated in large-scale, internationally organized design competitions, earning 1st place globally in a watch face design competition and 3rd place in the MENA region for a mobile themes competition.",
      ],
    ),
  ],
  projects: [
    Project(
      name: "Pills Reminder",
      description:
          "An intuitive medication reminder app that helps users schedule custom pill alerts so they never miss a dose. You can set one-time, daily, or weekly reminders, and the app works offline with persistent notifications. It also supports both English and Arabic, with dark/light themes for different preferences.",
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
          "A design showcase app that recreates a complex user interface for an AI mental health app (Freud UI Kit). It highlights a visually stunning, feature-rich design with custom animations and shapes, demonstrating a clean, layered layout that adapts well to different screens.",
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
      description:
          "Otex is a modern Flutter-built e-commerce application designed to showcase a complete shopping experience in a polished and user-friendly way. It was developed as a preview submission for the IT Legend application task and highlights core shopping app features that anyone would find familiar and intuitive.",
      tags: ["Flutter", "Bloc", "Figma", "Clean Architecture"],
      clickUrl: "https://github.com/MoazSalem/otex-flutter",
      assetsLocation: ["assets/images/previews/otex.webp"],
    ),
    Project(
      name: "Image Sorter",
      description:
          "A handy Android utility app for fixing image or video files that have wrong date stamps. It automatically finds the original date (from file name or metadata) and updates the file’s timestamps accordingly, ensuring your photo gallery shows the correct dates. The interface is a simple black-and-white Material 3 design for straightforward use.",
      tags: ["Flutter", "Platform Channels", "Android"],
      clickUrl: "https://github.com/MoazSalem/image-sorter-flutter",
      assetsLocation: ["assets/images/previews/sorter.webp"],
    ),
    Project(
      name: "FakeStore E-Commerce",
      description:
          "A sample e-commerce app using a dummy store API to simulate an online shopping experience. Users can browse a catalog of products, view details, add items to a cart, and go through a mock checkout with test payment options. The design is responsive so it works smoothly on both mobile devices and web browsers.",
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
          "A responsive web app for discovering movies and TV shows using The Movie Database (TMDB) API. It features a clean, minimal design that looks good on any device and allows quick searching of popular films and series. The interface works smoothly with both touch and mouse controls.",
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
          "A modern remake of the classic Snake game built with Flutter. It delivers smooth, arcade-style gameplay in a polished mobile interface. The app offers adjustable difficulty levels and game settings so both casual and experienced players can enjoy it, and it even includes an online leaderboard (with offline handling) for competing with friends.",
      tags: ["Flutter", "Game", "Firebase", "Firestore", "Bloc"],
      clickUrl: "https://github.com/MoazSalem/snake-game-flutter",
      assetsLocation: ["assets/images/previews/snake.webp"],
    ),
    Project(
      name: "Colorful Notes",
      description:
          "A vibrant, modern note-taking app where you can create and organize colorful notes using text or voice. It offers powerful search and multiple view styles to help you manage your ideas, and supports both English and Arabic interfaces.",
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
    Project(
      name: "Advanced Driver Assistance Systems",
      description:
          "ADAS App is a Flutter-built mobile application created as a graduation project that brings advanced driver assistance systems to the user’s smartphone with a smooth and intuitive experience. This project blends practical vehicle interaction with modern, user-friendly UI design based on Material 3 and Samsung One UI principles.",
      tags: ["Flutter", "BLE", "WebSockets", "Encryption"],
      clickUrl: "https://github.com/e7na/adas_app",
      assetsLocation: ["assets/images/previews/adas.webp"],
    ),
  ],
  email: "moaztalaat6@gmail.com",
);
