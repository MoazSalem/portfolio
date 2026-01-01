import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/feature/education_module/widgets/education_card.dart';
import 'package:web/web.dart' as web show window;

class EducationModule extends StatefulWidget {
  const EducationModule({super.key, required this.educationData});
  final EducationData educationData;

  @override
  State<EducationModule> createState() => _EducationModuleState();
}

class _EducationModuleState extends State<EducationModule>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.moduleInnerVerticalPadding,
          horizontal: AppSizes.moduleInnerHorizontalPadding,
        ),
        child: Column(
          spacing: AppSizes.p20,
          children: [
            Row(
              spacing: AppSizes.p20,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Education",
                  style: theme.textTheme.titleLarge?.copyWith(height: 1),
                ),
                Icon(
                  Icons.school,
                  color: theme.colorScheme.primary,
                  size: AppSizes.iconSizeLarge,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.p20),
            EducationCard(
              firstText: widget.educationData.degreeName,
              secondText: widget.educationData.universityName,
              thirdText:
                  "${widget.educationData.startDate} - ${widget.educationData.endDate}",
            ),
            if (widget.educationData.graduationProject != null) ...[
              Center(
                child: Container(
                  height: 40,
                  width: AppSizes.defaultLinkWidth,
                  color: theme.colorScheme.outline,
                ),
              ),
              EducationCard(
                firstText: widget.educationData.graduationProject!.title,
                secondText:
                    "(Score: ${widget.educationData.graduationProject!.score})",
                thirdText: widget.educationData.graduationProject!.description,
                onTap: () => web.window.open(
                  widget.educationData.graduationProject!.link!,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
