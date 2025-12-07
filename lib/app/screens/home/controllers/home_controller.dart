import 'package:template/app/providers/app_provider.dart';
import 'package:template/app/utility/extensions/context_extension.dart';
import 'package:uloc/uloc.dart';

class HomeController extends ULoCProvider {
  HomeController(super.context);
  String name = "Home";
  String content = "Home has not yet implemented";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future getUser() async {
    final user = await context.repository.userRepository.fetchUserProfile();

    if (!context.mounted) {
      return;
    }

    if (user.success) {
      context.read<AppProvider>().setUser = user.result;
    } else {
      // show error
    }
  }
}
