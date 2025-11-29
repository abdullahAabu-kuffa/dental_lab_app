import 'package:dental_lab_app/generated/l10n.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmModel extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const ConfirmModel({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.onCancel,
    this.confirmText = "Confirm",
    this.cancelText = "Cancel",
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.isDark ? Colors.white : Colors.black,
              ),
            ),

            const SizedBox(height: 15),

            // Message
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: theme.isDark ? Colors.white70 : Colors.black87),
            ),

            const SizedBox(height: 25),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Cancel Button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (onCancel != null) onCancel!();
                  },
                  child: Text(
                    S.of(context).Cancel,
                    style: TextStyle(color: theme.isDark ? Colors.white70 : Colors.black87),
                  ),
                ),

                const SizedBox(width: 10),

                // Confirm Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onConfirm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(S.of(context).Confirm, style: const TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
