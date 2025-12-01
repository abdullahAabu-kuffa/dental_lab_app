import 'package:dental_lab_app/generated/l10n.dart';
import 'package:dental_lab_app/logic/cubit/rag/rag_cubit.dart';
import 'package:dental_lab_app/logic/cubit/rag/rag_state.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_text_field.dart';

class ChatSheet extends StatefulWidget {
  const ChatSheet({super.key});

  @override
  State<ChatSheet> createState() => _ChatSheetState();
}

class _ChatSheetState extends State<ChatSheet> {
  final List<Map<String, String>> messages = [];
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void sendMessage() {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    // Add User message
    setState(() {
      messages.add({"role": "user", "text": text});
    });

    controller.clear();
    _scrollToBottom();
    context.read<RagCubit>().fetchRagAnswer(text);
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().isDark;
    return BlocListener<RagCubit, RagState>(
      listener: (context, state) {
        if (state is RagLoading) {
          // Add a temporary "typing" message
          setState(() {
            messages.add({"role": "model", "text": "..."}); // loading bubble
          });
          _scrollToBottom();
        }

        if (state is RagSuccess) {
          // Remove loading bubble
          if (messages.isNotEmpty && messages.last["text"] == "...") {
            messages.removeLast();
          }

          // Add model answer
          setState(() {
            messages.add({
              "role": "model",
              "text": state.response.data?.answer ?? "No answer found",
            });
          });
          _scrollToBottom();
        }

        if (state is RagError) {
          if (messages.isNotEmpty && messages.last["text"] == "...") {
            messages.removeLast();
          }

          setState(() {
            messages.add({"role": "model", "text": "Error: ${state.message}"});
          });
          _scrollToBottom();
        }
      },

      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: BoxDecoration(
              color:themeState ? AppColors.darkGreyColor : AppColors.whiteColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 4,
                  width: 60,
                  margin: const EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),

                const SizedBox(height: 10),

                // Chat List
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.all(12),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      final isUser = msg["role"] == "user";
                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            color: isUser
                                ? AppColors.goldenColor
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            msg["text"] ?? "",
                            style: TextStyle(
                              color: isUser ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Input + Send
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 20,
                    top: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: controller,
                          hint: S.of(context).ask_about_your_order,
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: sendMessage,
                        child: CircleAvatar(
                          backgroundColor: AppColors.goldenColor,
                          child: const Icon(
                            Icons.send,
                            color: AppColors.yellowColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
