import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100.0),
                Text(
                  'YesterNote',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Capture your thoughts, moods and moments with care',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center

                ),
                const SizedBox(height: 40.0),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder()
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => print("Forgot Password?"),
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.bodySmall
                    )
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.fromMap({
                        WidgetState.any: Theme.of(context).colorScheme.primaryContainer
                      }),
                    foregroundColor: WidgetStateProperty.fromMap({
                      WidgetState.any: Theme.of(context).colorScheme.onPrimaryContainer
                    }),
                    minimumSize: WidgetStateProperty.all(Size(double.infinity, 48)), // Full width, 48px height
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )
                    )
                  ),
                  onPressed: () => print('Sign in button pressed'),
                  child: Text('Sign In')
                ),
                const SizedBox(height: 20),
                Text('Or'),
                const SizedBox(height: 20),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.fromMap({
                      WidgetState.any: Theme.of(context).colorScheme.surface
                    }),
                    foregroundColor: WidgetStateProperty.fromMap({
                      WidgetState.any: Theme.of(context).colorScheme.onSurface
                    }),
                    minimumSize: WidgetStateProperty.all(Size(double.infinity, 48)),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder( 
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                          width: 1
                        )
                      )
                    )
                  ),
                  child: Text(
                    "Continue with Google",
                  ),
                  onPressed: () => print("Continue with Google")
                ),
                TextButton(
                  onPressed: () => print("Don't have account?"),
                  child: Text(
                    "Continue as Guest",
                    style: Theme.of(context).textTheme.titleSmall
                  )
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => print("Don't have account?"),
                  child: Text(
                    "Don't have an account? Sign Up",
                  )
                )
              ],
            )
          )
        )
      )
    );
  }
}