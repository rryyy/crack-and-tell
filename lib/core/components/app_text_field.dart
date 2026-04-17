import 'package:crack_and_tell/theme/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ENUMS & CONFIG
// ─────────────────────────────────────────────────────────────────────────────

enum AppTextFieldSize { sm, md, lg }

/// Internal config object built by each public widget and passed to
/// [_BaseTextField]. This is the seam that prevents duplication.
class _TextFieldConfig {
  const _TextFieldConfig({
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.labelText,
    required this.helperText,
    required this.errorText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.obscureText,
    required this.keyboardType,
    required this.textInputAction,
    required this.inputFormatters,
    required this.maxLines,
    required this.minLines,
    required this.maxLength,
    required this.enabled,
    required this.readOnly,
    required this.autofocus,
    required this.size,
    required this.onChanged,
    required this.onSubmitted,
    required this.onTap,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final AppTextFieldSize size;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
}

// ─────────────────────────────────────────────────────────────────────────────
// PRIVATE BASE — never import this directly
// All shared concerns live here: theming, sizing, border, error/helper text.
// ─────────────────────────────────────────────────────────────────────────────

class _BaseTextField extends StatelessWidget {
  const _BaseTextField({required this.config});

  final _TextFieldConfig config;

  EdgeInsets _contentPadding(AppTextFieldSize size) => switch (size) {
        AppTextFieldSize.sm => const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        AppTextFieldSize.md => const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        AppTextFieldSize.lg => const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      };

  double _fontSize(AppTextFieldSize size) => switch (size) {
        AppTextFieldSize.sm => 13,
        AppTextFieldSize.md => 15,
        AppTextFieldSize.lg => 16,
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasError = config.errorText != null;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.sm),
      borderSide: BorderSide(
        color: hasError ? colorScheme.error : colorScheme.outline,
        width: 1,
      ),
    );

    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.sm),
      borderSide: BorderSide(
        color: hasError ? colorScheme.error : colorScheme.primary,
        width: 1.5,
      ),
    );

    final disabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.sm),
      borderSide: BorderSide(
        color: colorScheme.outline.withOpacity(0.4),
        width: 1,
      ),
    );

    return TextField(
      controller: config.controller,
      focusNode: config.focusNode,
      obscureText: config.obscureText,
      keyboardType: config.keyboardType,
      textInputAction: config.textInputAction,
      inputFormatters: config.inputFormatters,
      maxLines: config.obscureText ? 1 : config.maxLines,
      minLines: config.minLines,
      maxLength: config.maxLength,
      enabled: config.enabled,
      readOnly: config.readOnly,
      autofocus: config.autofocus,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontSize: _fontSize(config.size),
        color: config.enabled
            ? colorScheme.onSurface
            : colorScheme.onSurface.withOpacity(0.4),
      ),
      onChanged: config.onChanged,
      onSubmitted: config.onSubmitted,
      onTap: config.onTap,
      decoration: InputDecoration(
        hintText: config.hintText,
        labelText: config.labelText,
        helperText: config.helperText,
        errorText: config.errorText,
        prefixIcon: config.prefixIcon,
        suffixIcon: config.suffixIcon,
        contentPadding: _contentPadding(config.size),
        filled: true,
        fillColor: config.enabled
            ? theme.inputDecorationTheme.fillColor
            : colorScheme.onSurface.withOpacity(0.04),
        border: border,
        enabledBorder: border,
        focusedBorder: focusedBorder,
        disabledBorder: disabledBorder,
        errorBorder: border,
        focusedErrorBorder: focusedBorder,
        counterText: '',               // suppress default maxLength counter
        isDense: config.size == AppTextFieldSize.sm,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// 1. AppTextField — general purpose
// ─────────────────────────────────────────────────────────────────────────────

/// A general-purpose text field.
///
/// ```dart
/// AppTextField(
///   labelText: 'Email',
///   hintText: 'you@example.com',
///   prefixIcon: Icon(Icons.email_outlined),
///   keyboardType: TextInputType.emailAddress,
///   onChanged: (v) => setState(() => email = v),
/// )
/// ```
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.size = AppTextFieldSize.md,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final AppTextFieldSize size;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return _BaseTextField(
      config: _TextFieldConfig(
        controller: controller,
        focusNode: focusNode,
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        obscureText: false,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        enabled: enabled,
        readOnly: readOnly,
        autofocus: autofocus,
        size: size,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onTap: onTap,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// 2. AppPasswordField — secure input with show/hide toggle
// ─────────────────────────────────────────────────────────────────────────────

/// A password field with an eye icon that toggles visibility.
/// Manages its own obscure state internally — callers don't need to.
///
/// ```dart
/// AppPasswordField(
///   labelText: 'Password',
///   errorText: passwordError,
///   onChanged: (v) => setState(() => password = v),
/// )
/// ```
class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText = 'Password',
    this.hintText,
    this.helperText,
    this.errorText,
    this.textInputAction,
    this.enabled = true,
    this.autofocus = false,
    this.size = AppTextFieldSize.md,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextInputAction? textInputAction;
  final bool enabled;
  final bool autofocus;
  final AppTextFieldSize size;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return _BaseTextField(
      config: _TextFieldConfig(
        controller: widget.controller,
        focusNode: widget.focusNode,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        errorText: widget.errorText,
        prefixIcon: const Icon(Icons.lock_outline, size: 20),
        suffixIcon: IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            size: 20,
          ),
          onPressed: () => setState(() => _obscure = !_obscure),
          tooltip: _obscure ? 'Show password' : 'Hide password',
        ),
        obscureText: _obscure,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: widget.textInputAction,
        inputFormatters: null,
        maxLines: 1,
        minLines: null,
        maxLength: null,
        enabled: widget.enabled,
        readOnly: false,
        autofocus: widget.autofocus,
        size: widget.size,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        onTap: null,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// 3. AppSearchField — search input with clear button
// ─────────────────────────────────────────────────────────────────────────────

/// A search field. Shows a clear (×) button when the field has text.
/// Optionally shows a loading indicator via [isLoading] for async search.
///
/// ```dart
/// AppSearchField(
///   hintText: 'Search products...',
///   onChanged: (q) => bloc.add(SearchQueryChanged(q)),
///   onSubmitted: (q) => bloc.add(SearchSubmitted(q)),
/// )
/// ```
class AppSearchField extends StatefulWidget {
  const AppSearchField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText = 'Search...',
    this.enabled = true,
    this.autofocus = false,
    this.isLoading = false,
    this.size = AppTextFieldSize.md,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final bool enabled;
  final bool autofocus;

  /// Shows a [CircularProgressIndicator] in the suffix when true.
  final bool isLoading;

  final AppTextFieldSize size;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  /// Called when the user taps the clear (×) button.
  final VoidCallback? onClear;

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late final TextEditingController _controller;
  bool _hasText = false;
  bool _ownsController = false;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController();
      _ownsController = true;
    } else {
      _controller = widget.controller!;
    }
    _controller.addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) setState(() => _hasText = hasText);
  }

  void _clear() {
    _controller.clear();
    widget.onClear?.call();
    widget.onChanged?.call('');
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

  Widget? get _suffix {
    if (widget.isLoading) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }
    if (_hasText) {
      return IconButton(
        icon: const Icon(Icons.close, size: 18),
        onPressed: _clear,
        tooltip: 'Clear',
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return _BaseTextField(
      config: _TextFieldConfig(
        controller: _controller,
        focusNode: widget.focusNode,
        hintText: widget.hintText,
        labelText: null,
        helperText: null,
        errorText: null,
        prefixIcon: const Icon(Icons.search, size: 20),
        suffixIcon: _suffix,
        obscureText: false,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        inputFormatters: null,
        maxLines: 1,
        minLines: null,
        maxLength: null,
        enabled: widget.enabled,
        readOnly: false,
        autofocus: widget.autofocus,
        size: widget.size,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        onTap: null,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// 4. AppTextArea — multiline variant
// ─────────────────────────────────────────────────────────────────────────────

/// A multiline text area. Grows vertically between [minLines] and [maxLines].
///
/// ```dart
/// AppTextArea(
///   labelText: 'Bio',
///   hintText: 'Tell us about yourself...',
///   maxLength: 300,
///   onChanged: (v) => setState(() => bio = v),
/// )
/// ```
class AppTextArea extends StatelessWidget {
  const AppTextArea({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.minLines = 3,
    this.maxLines = 6,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.size = AppTextFieldSize.md,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final AppTextFieldSize size;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return _BaseTextField(
      config: _TextFieldConfig(
        controller: controller,
        focusNode: focusNode,
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: null,
        suffixIcon: null,
        obscureText: false,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        inputFormatters: null,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        enabled: enabled,
        readOnly: readOnly,
        autofocus: false,
        size: size,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onTap: null,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// USAGE EXAMPLES
// ─────────────────────────────────────────────────────────────────────────────
//
// // 1. Plain field
// AppTextField(
//   labelText: 'Full name',
//   hintText: 'Jane Doe',
//   prefixIcon: Icon(Icons.person_outline),
//   onChanged: (v) {},
// )
//
// // 2. Email with validation error
// AppTextField(
//   labelText: 'Email',
//   hintText: 'you@example.com',
//   prefixIcon: Icon(Icons.email_outlined),
//   keyboardType: TextInputType.emailAddress,
//   errorText: emailError,
//   textInputAction: TextInputAction.next,
//   onChanged: (v) {},
// )
//
// // 3. Password — toggle managed internally, no extra state needed
// AppPasswordField(
//   labelText: 'Password',
//   errorText: passwordError,
//   textInputAction: TextInputAction.done,
//   onSubmitted: (_) => _submit(),
// )
//
// // 4. Search with async loading state
// AppSearchField(
//   hintText: 'Search products...',
//   isLoading: searchState.isLoading,
//   onChanged: (q) => bloc.add(SearchQueryChanged(q)),
//   onClear: () => bloc.add(SearchCleared()),
// )
//
// // 5. Bio textarea
// AppTextArea(
//   labelText: 'Bio',
//   maxLength: 300,
//   helperText: 'Max 300 characters',
//   onChanged: (v) {},
// )
//
// // 6. Small size variant
// AppTextField(
//   hintText: 'Filter...',
//   size: AppTextFieldSize.sm,
//   onChanged: (v) {},
// )
