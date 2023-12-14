import 'package:baby_milestones/app_config/utils/asset_resources.dart';

class OnboardingData {
  final String title, subtitle, image;

  OnboardingData(
      {required this.title, required this.subtitle, required this.image});
}

List<OnboardingData> onboardingData = [
  OnboardingData(
      title: 'Welcome to Baby Milestones Tracker!',
      subtitle:
          'Capture and cherish every special moment in your baby\'s journey with our easy-to-use Milestones Tracker.',
      image: AssetResources.onboarding1),
  OnboardingData(
      title: 'Stay Connected with Your Baby\'s Growth',
      subtitle:
          'Record your baby\'s first smiles, steps, and more with a simple tap. Baby Milestone makes it effortless to create a beautiful timeline of your little one\'s achievements.',
      image: AssetResources.onboarding2),
];
