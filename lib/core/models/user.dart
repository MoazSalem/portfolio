class User {
  final IntroductionData introductionData;
  final List<ExternalLink> externalLinks;
  final List<NumericalDescription> numericalDescriptions;

  const User({
    required this.introductionData,
    required this.externalLinks,
    required this.numericalDescriptions,
  });
}

class IntroductionData {
  final String name;
  final String title;
  final String description;
  final String avatarUrl;

  const IntroductionData({
    required this.name,
    required this.title,
    required this.description,
    required this.avatarUrl,
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
