import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/feature/work_module/widgets/work_card.dart';

class WorkModule extends StatefulWidget {
  const WorkModule({super.key, required this.workExperiences});
  final List<WorkExperience> workExperiences;

  @override
  State<WorkModule> createState() => _WorkModuleState();
}

class _WorkModuleState extends State<WorkModule>
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
                  "Work Experience",
                  style: theme.textTheme.titleLarge?.copyWith(height: 1),
                ),
                Icon(
                  Icons.work,
                  color: theme.colorScheme.primary,
                  size: AppSizes.iconSizeLarge,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.p20),
            LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  spacing: AppSizes.p20,
                  children: List.generate(widget.workExperiences.length, (
                    index,
                  ) {
                    return WorkCard(
                      workExperience: widget.workExperiences[index],
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
