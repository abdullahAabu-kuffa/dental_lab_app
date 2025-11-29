import 'package:dental_lab_app/core/constants/app_images.dart';
import 'package:dental_lab_app/core/errorHandler/error_handler.dart';
import 'package:dental_lab_app/core/helpers/cach_helper.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/data/services/api_services.dart';
import 'package:dental_lab_app/generated/l10n.dart';
import 'package:dental_lab_app/logic/cubit/localization/local_cubit.dart';
import 'package:dental_lab_app/logic/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_txt.dart';
import 'package:dental_lab_app/presentation/widgets/custom_btn.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(ApiServices()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocListener<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is SignInError) {
                  ErrorHandler.showSnack(
                    context,
                    S.of(context).somethingWentWrong,
                    Colors.red,
                  );
                } else if (state is SignInSuccess) {
                  ErrorHandler.showSnack(
                    context,
                    S.of(context).loginSuccessfully,
                    Colors.green,
                  );
                  CachHelper.setLoggdIn(true);
                  Navigator.pushNamed(context, Routes.homeRoute);
                }
              },

              child: _buildLoginForm(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    final localeCubit = context.watch<LocalizationCubit>();

    final isEnglish = localeCubit.state.languageCode == 'ar';
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        final cubit = context.read<SignInCubit>();

        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                SvgPicture.asset(AppImages.logo),
                const SizedBox(height: 15),

                CustomText(
                  txt: S.of(context).welcomeBack,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),

                const SizedBox(height: 20),

                CustomText(
                  txt: S.of(context).loginToYourAccount,
                  color: AppColors.whiteColor70,
                ),

                const SizedBox(height: 30),

                _buildLabel(S.of(context).email, isEnglish),
                const SizedBox(height: 12),

                CustomTextField(
                  controller: emailController,
                  hint: S.of(context).enterYourEmail,
                  suffixIcon: const Icon(
                    Icons.email,
                    color: AppColors.greyColor,
                  ),
                ),

                const SizedBox(height: 20),

                _buildLabel(S.of(context).password, isEnglish),
                const SizedBox(height: 12),

                CustomTextField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  hint: S.of(context).enterYourPassword,
                  suffixIcon: IconButton(
                    onPressed: () =>
                        setState(() => isPasswordVisible = !isPasswordVisible),
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                _buildForgotPassword(isEnglish),
                const SizedBox(height: 30),
                CustomBtn(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      cubit.signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                    }
                  },
                  child: state is SignInLoading
                      ? const Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: AppColors.blackColor,
                              strokeWidth: 2,
                            ),
                          ),
                        )
                      : Center(
                          child: CustomText(
                            txt: S.of(context).login,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),

                const SizedBox(height: 16),
                _buildSignUpPrompt(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLabel(String text, bool isEnglish) => Align(
    alignment: isEnglish ? Alignment.centerRight : Alignment.centerLeft,
    child: CustomText(
      txt: text,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w500,
    ),
  );

  Widget _buildForgotPassword(bool isEnglish) => Align(
    alignment: isEnglish ? Alignment.centerLeft : Alignment.centerRight,
    child: CustomText(
      txt: S.of(context).forgotPassword,
      color: AppColors.yellowColor,
      fontWeight: FontWeight.w500,
    ),
  );

  Widget _buildSignUpPrompt(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        S.of(context).dontHaveAnAccount,
        style: TextStyle(color: AppColors.greyColor),
      ),
      const SizedBox(width: 5),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, Routes.registerRoute),
        child: Text(
          S.of(context).signUp,
          style: const TextStyle(
            color: AppColors.yellowColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
