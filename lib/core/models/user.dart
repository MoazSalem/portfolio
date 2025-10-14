class User {
  final IntroductionData introductionData;
  final List<ExternalLink> externalLinks;

  const User({required this.introductionData, required this.externalLinks});
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
