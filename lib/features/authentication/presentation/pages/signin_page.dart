import 'package:crack_and_tell/core/components/app_button.dart';
import 'package:crack_and_tell/core/components/app_text_field.dart';
import 'package:crack_and_tell/theme/app_paddings.dart';
import 'package:crack_and_tell/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: AppPadding.screen,
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100.0),
                Text(
                  'Koalma',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Capture your thoughts, moods and moments with care',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xl),
                AppTextField(
                  labelText: 'Full name',
                  hintText: 'Jane Doe',
                  prefixIcon: Icon(Icons.person_outline),
                  onChanged: (v) {},
                ),
                const SizedBox(height: AppSpacing.lg),
                AppPasswordField(
                  labelText: 'Password',
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => {},
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: AppButton(label: 'Forgot Password?', variant: ButtonVariant.link, onPressed: () => print('Forgot Password button pressed')),
                ),
                const SizedBox(height: AppSpacing.lg),
                AppButton(
                  label: "Sign in", 
                  variant: ButtonVariant.primary,
                  expand: true,
                  onPressed: () => print('Sign in button pressed')
                ),
                const SizedBox(height: AppSpacing.lg),
                Text('Or'),
                const SizedBox(height: AppSpacing.lg),
                AppButton(
                  label: "Continue with Google", 
                  variant: ButtonVariant.outline,
                  expand: true,
                  onPressed: () => print('Sign in button pressed')
                ),
                const SizedBox(height: AppSpacing.lg),
                AppButton(label: 'Continue as guest', variant: ButtonVariant.ghost, onPressed: () => print('Continue as guest pressed')),
                Spacer(),
                AppButton(label: 'Don\'t have an account? Sign Up', variant: ButtonVariant.link, onPressed: () => print('Sign up button pressed')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
