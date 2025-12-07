import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template/app/models/base_repository.dart';
import 'package:template/app/providers/app_provider.dart';
import 'package:template/app/providers/repository_provider.dart';
import 'package:template/app/repositories/user/model/user_model.dart';
import 'package:template/app/repositories/user/user_repository.dart';
import 'package:template/l10n/l10n.dart';

import 'package:template/main.dart';
import 'package:uloc/uloc.dart';

const testEmail = 'test@mail.com';

class MockUserProvider extends UserRepository {
  MockUserProvider(super.client, super.endpoint, super.locale);

  @override
  DataResult<User> fetchUserProfile() async {
    return Result<User>(
      code: 200,
      result: User(id: "", email: testEmail),
    );
  }
}

class MockRepositoryProvider extends RepositoryProvider {
  MockRepositoryProvider(super.endpoint, super.locale);

  @override
  UserRepository get userRepository =>
      MockUserProvider(client, endpoint, locale);
}

void main() {
  testWidgets('Home widget test', (WidgetTester tester) async {
    final mockEndpoint = 'https://api.example.com';
    final mockLocale = L10nEnum.english;

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppProvider(context)),
          Provider<RepositoryProvider>.value(
            value: MockRepositoryProvider(mockEndpoint, mockLocale),
          ),
        ],
        child: Builder(
          builder: (context) {
            return buildMaterialApp(context, mockLocale.locale);
          },
        ),
      ),
    );

    expect(
      find.text('Home has not yet implemented'),
      findsOneWidget,
      reason: 'Initial content is not displayed',
    );

    await tester.pump(const Duration(seconds: 1));

    expect(
      find.text(testEmail),
      findsOneWidget,
      reason: 'User email is not displayed after fetching profile',
    );
  });
}
