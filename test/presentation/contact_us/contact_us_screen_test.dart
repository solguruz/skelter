import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_state.dart';
import 'package:flutter_skeleton/presentation/contact_us/contact_us_screen.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/contact_us_attachment_section.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/contact_us_email_section.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/contact_us_message_section.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/contact_us_name_section.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockContactusBloc extends MockBloc<ContactUsEvent, ContactUsState>
    implements ContactUsBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Widget tests
  group('Contact Us Page', () {
    testWidgets('Contact Us Page', (tester) async {
      await tester.runWidgetTest(
        child: const ContactUsScreen(),
      );
      expect(find.byType(ContactUsScreen), findsOneWidget);
    });
  });

  // Golden tests
  testExecutable(() {
    goldenTest(
      'Contact Us Name Section UI Test',
      fileName: 'contact_us_name_section',
      builder: () {
        final contactUsBlocEmptyName = MockContactusBloc();
        when(() => contactUsBlocEmptyName.state)
            .thenReturn(ContactUsState.test());

        final contactUsBlocValidName = MockContactusBloc();
        when(() => contactUsBlocValidName.state).thenReturn(
          ContactUsState.test(name: 'John Doe'),
        );

        final contactUsBlocLongName = MockContactusBloc();
        when(() => contactUsBlocLongName.state).thenReturn(
          ContactUsState.test(
            name: 'Jonathan Alexander Christopher Doe-Williams',
          ),
        );

        final contactUsBlocErrorName = MockContactusBloc();
        when(() => contactUsBlocErrorName.state).thenReturn(
          ContactUsState.test(name: '', nameError: "Name can't be empty"),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'default name state',
              child: const ContactUsNameSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocEmptyName,
                ),
              ],
            ),
            createTestScenario(
              name: 'valid name state',
              child: const ContactUsNameSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocValidName,
                ),
              ],
            ),
            createTestScenario(
              name: 'long name state',
              child: const ContactUsNameSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocLongName,
                ),
              ],
            ),
            createTestScenario(
              name: 'error name state',
              child: const ContactUsNameSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocErrorName,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Contact Us Email Section UI Test',
      fileName: 'contact_us_email_section',
      builder: () {
        final contactUsBlocEmptyEmail = MockContactusBloc();
        when(() => contactUsBlocEmptyEmail.state)
            .thenReturn(ContactUsState.test());

        final contactUsBlocValidEmail = MockContactusBloc();
        when(() => contactUsBlocValidEmail.state).thenReturn(
          ContactUsState.test(email: 'john@example.com'),
        );

        final contactUsBlocEmptyEmailError = MockContactusBloc();
        when(() => contactUsBlocEmptyEmailError.state).thenReturn(
          ContactUsState.test(email: '', emailError: "Email can't be empty"),
        );

        final contactUsBlocInvalidEmailError = MockContactusBloc();
        when(() => contactUsBlocInvalidEmailError.state).thenReturn(
          ContactUsState.test(
            email: 'invalid@',
            emailError: 'Please enter a valid email address',
          ),
        );

        final contactUsBlocLongEmail = MockContactusBloc();
        when(() => contactUsBlocLongEmail.state).thenReturn(
          ContactUsState.test(
            email: 'very.long.email.address.for.testing.purposes'
                '@example-verylongdomain.com',
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'default email state',
              child: const ContactUsEmailSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocEmptyEmail,
                ),
              ],
            ),
            createTestScenario(
              name: 'valid email state',
              child: const ContactUsEmailSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocValidEmail,
                ),
              ],
            ),
            createTestScenario(
              name: 'long email state',
              child: const ContactUsEmailSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocLongEmail,
                ),
              ],
            ),
            createTestScenario(
              name: 'empty email state',
              child: const ContactUsEmailSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocEmptyEmailError,
                ),
              ],
            ),
            createTestScenario(
              name: 'invalid email state',
              child: const ContactUsEmailSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocInvalidEmailError,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Contact Us Message Section UI Test',
      fileName: 'contact_us_message_section',
      builder: () {
        final contactUsBlocEmptyMessage = MockContactusBloc();
        when(() => contactUsBlocEmptyMessage.state)
            .thenReturn(ContactUsState.test());

        final contactUsBlocValidMessage = MockContactusBloc();
        when(() => contactUsBlocValidMessage.state).thenReturn(
          ContactUsState.test(description: 'This is a sample message.'),
        );

        final contactUsBlocLongMessage = MockContactusBloc();
        when(() => contactUsBlocLongMessage.state).thenReturn(
          ContactUsState.test(
            description:
                'This is a very long message intended to test how the message'
                ' input area handles large blocks of text, especially with '
                'multiple lines, wrapping, and any potential UI overflow '
                'or layout issues.',
          ),
        );

        final contactUsBlocErrorMessage = MockContactusBloc();
        when(() => contactUsBlocErrorMessage.state).thenReturn(
          ContactUsState.test(
            description: '',
            descriptionError: "Message can't' be empty",
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'default message state',
              child: const ContactUsMessageSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocEmptyMessage,
                ),
              ],
            ),
            createTestScenario(
              name: 'valid message state',
              child: const ContactUsMessageSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocValidMessage,
                ),
              ],
            ),
            createTestScenario(
              name: 'long message state',
              child: const ContactUsMessageSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocLongMessage,
                ),
              ],
            ),
            createTestScenario(
              name: 'error message state',
              child: const ContactUsMessageSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocErrorMessage,
                ),
              ],
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Contact Us Attachment Section UI Test',
      fileName: 'contact_us_attachment_section',
      pumpBeforeTest: precacheImages,
      builder: () {
        final contactUsBlocEmptyAttachment = MockContactusBloc();
        when(() => contactUsBlocEmptyAttachment.state)
            .thenReturn(ContactUsState.test());

        final contactUsBlocSingleImageAttachment = MockContactusBloc();
        when(() => contactUsBlocSingleImageAttachment.state).thenReturn(
          ContactUsState.test(
            selectedImages: [XFile(Assets.test.images.testImage.path)],
          ),
        );

        final contactUsBlocSinglePdfAttachment = MockContactusBloc();
        when(() => contactUsBlocSinglePdfAttachment.state).thenReturn(
          ContactUsState.test(selectedPdfs: [File(Assets.test.files.testPdf)]),
        );

        final contactUsBlocMultipleImageAttachment = MockContactusBloc();
        when(() => contactUsBlocMultipleImageAttachment.state).thenReturn(
          ContactUsState.test(
            selectedImages: List.generate(
              5,
              (i) => XFile(Assets.test.images.testImage.path),
            ),
          ),
        );

        final contactUsBlocMultiplePdfAttachment = MockContactusBloc();
        when(() => contactUsBlocMultiplePdfAttachment.state).thenReturn(
          ContactUsState.test(
            selectedPdfs:
                List.generate(5, (i) => File(Assets.test.files.testPdf)),
          ),
        );

        final contactUsBlocErrorAttachment = MockContactusBloc();
        when(() => contactUsBlocErrorAttachment.state).thenReturn(
          ContactUsState.test(
            pickedFilesErrorMessage: 'Please select at least one file',
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'default attachment state',
              child: const ContactUsAttachmentSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocEmptyAttachment,
                ),
              ],
            ),
            createTestScenario(
              name: 'single image selected state',
              child: const ContactUsAttachmentSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocSingleImageAttachment,
                ),
              ],
            ),
            createTestScenario(
              name: 'single pdf selected state',
              child: const ContactUsAttachmentSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocSinglePdfAttachment,
                ),
              ],
            ),
            createTestScenario(
              name: 'five images selected state',
              child: const ContactUsAttachmentSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocMultipleImageAttachment,
                ),
              ],
            ),
            createTestScenario(
              name: 'five pdfs selected state',
              child: const ContactUsAttachmentSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocMultiplePdfAttachment,
                ),
              ],
            ),
            createTestScenario(
              name: 'error attachment state',
              child: const ContactUsAttachmentSection(),
              addScaffold: true,
              providers: [
                BlocProvider<ContactUsBloc>.value(
                  value: contactUsBlocErrorAttachment,
                ),
              ],
            ),
          ],
        );
      },
    );
  });
}
