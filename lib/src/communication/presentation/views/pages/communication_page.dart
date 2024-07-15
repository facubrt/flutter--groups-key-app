import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groupskey/core/utils/transitions.dart';
import 'package:groupskey/src/communication/presentation/views/widgets/buttons_action.dart';
import 'package:groupskey/src/communication/presentation/views/widgets/field_text.dart';
import 'package:groupskey/src/communication/presentation/views/widgets/keys_group.dart';
import 'package:groupskey/src/customisation/presentation/providers/customisation_controller.dart';
import 'package:groupskey/src/customisation/presentation/views/pages/config_page.dart';

class CommunicationPage extends ConsumerWidget {
  const CommunicationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appParameters.highContrast ? Colors.black : Colors.white,
      appBar: MediaQuery.of(context).orientation == Orientation.portrait
          ? AppBar(
              title: const Text(
                'Groups KEY',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              backgroundColor: const Color(0xFF003A70),
              centerTitle: true,
              elevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      FadeTransitionRoute(
                        widget: const ConfigPage(),
                      ),
                    );
                  },
                ),
              ],
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SafeArea(
                child: SizedBox.shrink(),
              ),
            ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            MediaQuery.of(context).orientation != Orientation.portrait
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Expanded(child: FieldTextWidget()),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      const ButtonsActionWidget()
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const FieldTextWidget(),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),
                      const ButtonsActionWidget()
                    ],
                  ),
            const Expanded(child: KeysGroup()),
          ],
        ),
      ),
    );
  }
}
