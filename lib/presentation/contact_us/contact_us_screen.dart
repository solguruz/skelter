import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_state.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/contact_us_app_bar.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/contact_us_attachment_section.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/contact_us_description.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/contact_us_email_section.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/contact_us_message_section.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/contact_us_name_section.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/contact_us_submit_button.dart';
import 'package:flutter_skeleton/routes.gr.dart';

@RoutePage()
class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  static int kMaxFileLimit = 5;
  static int kMaxFileSizeInBytes = 5 * 1024 * 1024;
  static int kMessageMaxLength = 250;
  static String kPdfFileSignature = '%PDF-';

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = context.localization;
    return BlocProvider(
      create: (_) => ContactUsBloc(localizations: appLocalizations),
      child: BlocListener<ContactUsBloc, ContactUsState>(
        listener: (context, state) {
          if (state is PickedFilesErrorState) {
            _animateScrollViewToBottom();
          }
          if (state is ContactUsSubmittedState) {
            context.router.replaceAll([const ContactUsSubmittedRoute()]);
          }
        },
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            appBar: const ContactUsAppBar(),
            body: SingleChildScrollView(
              controller: _scrollController,
              child: const ContactUsScreenBody(),
            ),
            bottomNavigationBar: const ContactUsSubmitButton(),
          ),
        ),
      ),
    );
  }

  void _animateScrollViewToBottom() {
    Future.delayed(
      const Duration(milliseconds: 100),
      () => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
      ),
    );
  }
}

class ContactUsScreenBody extends StatelessWidget {
  const ContactUsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 30),
          ContactUsDescription(),
          SizedBox(height: 30),
          ContactUsNameSection(),
          SizedBox(height: 20),
          ContactUsEmailSection(),
          SizedBox(height: 20),
          ContactUsMessageSection(),
          SizedBox(height: 20),
          ContactUsAttachmentSection(),
        ],
      ),
    );
  }
}
