import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpaceButton extends ConsumerWidget {
  const SpaceButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final appConfig = ref.watch(configProvider);
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.black12,//appConfig.highContrast ? Colors.white : Colors.black12,
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          //ref.read(configProvider.notifier).setText(' ');
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width * 0.14
              : MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.5,
          alignment: Alignment.center,
          child: Text(
            ' '.toUpperCase(),
            style: TextStyle(
              fontSize: 16,
                  // MediaQuery.of(context).orientation == Orientation.portrait
                  //     ? MediaQuery.of(context).size.width *
                  //         0.68 *
                  //         appConfig.factorSize
                  //     : MediaQuery.of(context).size.height *
                  //         0.68 *
                  //         appConfig.factorSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
