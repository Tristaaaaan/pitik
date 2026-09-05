import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../features/package/presentation/widget/regular_button.dart';

class DataPlaceHolder extends StatelessWidget {
  final String imagePath;
  final double imageHeight;
  final double imageWidth;
  final String title;
  final double titleTextSize;
  final String description;
  final double descriptionTextSize;
  final bool? withButton;
  final VoidCallback? onTap;
  final String? buttonText;
  const DataPlaceHolder({
    super.key,
    required this.imagePath,
    required this.imageHeight,
    required this.imageWidth,
    required this.titleTextSize,
    required this.descriptionTextSize,
    required this.title,
    required this.description,
    this.withButton = false,
    this.onTap,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              imagePath,
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 15),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: titleTextSize,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              textAlign: TextAlign.center,
              description,
              style: TextStyle(
                fontSize: descriptionTextSize,
                fontStyle: FontStyle.italic,
              ),
            ),

            if (withButton!) ...[
              const SizedBox(height: 30),
              RegularButton(
                onTap: () {
                  if (withButton!) {
                    onTap!();
                  }
                },
                suffixIcon: false,
                text: buttonText ?? '',
                backgroundColor: Theme.of(context).colorScheme.surface,
                withBorder: true,
                textColor: Theme.of(context).colorScheme.primary,
                buttonKey: buttonText ?? '',
                width: 300,
                withIcon: false,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
