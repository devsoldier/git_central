import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:git_central/features/trending_repo/screens/trending_repo/trending_repo_page.dart';
import 'package:git_central/utils/custom_widgets/custom_snackbar.dart';
import 'package:git_central/utils/custom_widgets/global_messenger.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    GetIt.I<GlobalMessenger>().messenger.stream.listen((event) {
      if (event is NoNetwork) {
        if (!mounted) return;
        showWarningSnackBar(context,
            message: 'You have no internet connection');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const TrendingRepoPage();
  }
}
