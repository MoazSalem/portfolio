class User {
  final IntroductionData introductionData;
  final List<ExternalLink> externalLinks;
  final EducationData educationData;

  const User({
    required this.introductionData,
    required this.externalLinks,
    required this.educationData,
  });
}

class IntroductionData {
  final String name;
  final String title;
  final String description;
  final String avatarUrl;
  final List<NumericalDescription> numericalDescriptions;

  const IntroductionData({
    required this.name,
    required this.title,
    required this.description,
    required this.avatarUrl,
    required this.numericalDescriptions,
  });
}

class EducationData {
  final String universityName;
  final String degreeName;
  final String startDate;
  final String endDate;
  final GraduationProject? graduationProject;

  const EducationData({
    required this.universityName,
    required this.degreeName,
    required this.startDate,
    required this.endDate,
    this.graduationProject,
  });
}

class GraduationProject {
  final String title;
  final String description;
  final String score;
  final String? link;
  const GraduationProject({
    required this.title,
    required this.description,
    required this.score,
    this.link,
  });
}

class NumericalDescription {
  final int value;
  final String title;
  const NumericalDescription({required this.value, required this.title});
}

class ExternalLink {
  final String name;
  final String? iconAssetName;
  final String url;
  const ExternalLink({
    required this.name,
    this.iconAssetName,
    required this.url,
  });
}
