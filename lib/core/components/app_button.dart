import 'package:flutter/material.dart';
 
// ─────────────────────────────────────────────────────────────────────────────
// ENUMS
// ─────────────────────────────────────────────────────────────────────────────
 
/// Controls the visual style of [AppButton].
enum ButtonVariant {
  /// Filled with [ColorScheme.primary]. The default CTA button.
  primary,
 
  /// Filled with [ColorScheme.secondary]. Lower visual weight than primary.
  secondary,
 
  /// Transparent with a 1.5px [ColorScheme.primary] border.
  outline,
 
  /// Transparent with a 1.5px [ColorScheme.error] border.
  destructiveOutline,
 
  /// Filled with [ColorScheme.error]. For irreversible destructive actions.
  destructive,
 
  /// No border, no fill. Looks like a hyperlink. Lowest visual weight.
  ghost,
 
  /// Like ghost but the label is always [ColorScheme.primary] colored.
  link,
}
 
/// Controls the size of [AppButton] and [AppIconButton].
enum ButtonSize { sm, md, lg }
 
/// Controls where the icon is placed relative to the label in [AppButton].
enum ButtonIconPosition { left, right }
 
// ─────────────────────────────────────────────────────────────────────────────
// STYLE RESOLVER — private, single source of truth for all visual decisions
// ─────────────────────────────────────────────────────────────────────────────
 
class _ButtonStyle {
  const _ButtonStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.overlayColor,
    required this.borderSide,
  });
 
  final Color backgroundColor;
  final Color foregroundColor;
  final Color overlayColor;
  final BorderSide? borderSide;
 
  static _ButtonStyle resolve(
    ButtonVariant variant,
    ColorScheme cs,
    bool isDisabled,
  ) {
    if (isDisabled) {
      return _ButtonStyle(
        backgroundColor: cs.onSurface.withOpacity(0.08),
        foregroundColor: cs.onSurface.withOpacity(0.38),
        overlayColor: Colors.transparent,
        borderSide: null,
      );
    }
 
    return switch (variant) {
      ButtonVariant.primary => _ButtonStyle(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          overlayColor: cs.onPrimary.withOpacity(0.08),
          borderSide: null,
        ),
      ButtonVariant.secondary => _ButtonStyle(
          backgroundColor: cs.secondary,
          foregroundColor: cs.primary,
          overlayColor: cs.primary.withOpacity(0.08),
          borderSide: null,
        ),
      ButtonVariant.outline => _ButtonStyle(
          backgroundColor: Colors.transparent,
          foregroundColor: cs.primary,
          overlayColor: cs.primary.withOpacity(0.06),
          borderSide: BorderSide(color: cs.primary, width: 1.5),
        ),
      ButtonVariant.destructiveOutline => _ButtonStyle(
          backgroundColor: Colors.transparent,
          foregroundColor: cs.error,
          overlayColor: cs.error.withOpacity(0.06),
          borderSide: BorderSide(color: cs.error, width: 1.5),
        ),
      ButtonVariant.destructive => _ButtonStyle(
          backgroundColor: cs.error,
          foregroundColor: cs.onError,
          overlayColor: cs.onError.withOpacity(0.08),
          borderSide: null,
        ),
      ButtonVariant.ghost => _ButtonStyle(
          backgroundColor: Colors.transparent,
          foregroundColor: cs.onSurface,
          overlayColor: cs.onSurface.withOpacity(0.06),
          borderSide: null,
        ),
      ButtonVariant.link => _ButtonStyle(
          backgroundColor: Colors.transparent,
          foregroundColor: cs.primary,
          overlayColor: cs.primary.withOpacity(0.06),
          borderSide: null,
        ),
    };
  }
}
 
// ─────────────────────────────────────────────────────────────────────────────
// SIZE RESOLVER — padding, font size, icon size, border radius
// ─────────────────────────────────────────────────────────────────────────────
 
class _ButtonSizeTokens {
  const _ButtonSizeTokens({
    required this.padding,
    required this.fontSize,
    required this.iconSize,
    required this.borderRadius,
    required this.height,
    required this.iconGap,
  });
 
  final EdgeInsets padding;
  final double fontSize;
  final double iconSize;
  final double borderRadius;
  final double height;
  final double iconGap;
 
  static _ButtonSizeTokens resolve(ButtonSize size) => switch (size) {
        ButtonSize.sm => const _ButtonSizeTokens(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            fontSize: 13,
            iconSize: 15,
            borderRadius: 8,
            height: 34,
            iconGap: 5,
          ),
        ButtonSize.md => const _ButtonSizeTokens(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            fontSize: 14,
            iconSize: 17,
            borderRadius: 10,
            height: 42,
            iconGap: 7,
          ),
        ButtonSize.lg => const _ButtonSizeTokens(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            fontSize: 16,
            iconSize: 19,
            borderRadius: 12,
            height: 50,
            iconGap: 8,
          ),
      };
}
 
// ─────────────────────────────────────────────────────────────────────────────
// APP BUTTON
// ─────────────────────────────────────────────────────────────────────────────
 
/// A single, composable button widget covering all visual variants.
///
/// Behavior is identical across all variants — only the visual style changes.
/// Use [variant] to control appearance, [size] for sizing, [icon] + [iconPosition]
/// for optional leading/trailing icons. Pass [isLoading] to swap the label
/// for a [CircularProgressIndicator] while an async operation runs.
///
/// ```dart
/// // Primary CTA
/// AppButton(
///   label: 'Continue',
///   onPressed: _submit,
/// )
///
/// // Outline with leading icon
/// AppButton(
///   label: 'Add photo',
///   icon: Icon(Icons.add_photo_alternate_outlined),
///   variant: ButtonVariant.outline,
///   onPressed: _pickImage,
/// )
///
/// // Destructive with loading state
/// AppButton(
///   label: 'Delete account',
///   variant: ButtonVariant.destructive,
///   isLoading: _isDeleting,
///   onPressed: _deleteAccount,
/// )
///
/// // Full-width
/// AppButton(
///   label: 'Sign in',
///   expand: true,
///   onPressed: _signIn,
/// )
/// ```
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.md,
    this.icon,
    this.iconPosition = ButtonIconPosition.left,
    this.isLoading = false,
    this.expand = false,
    this.enabled = true,
  });
 
  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
 
  /// Optional icon rendered beside the label.
  final Widget? icon;
  final ButtonIconPosition iconPosition;
 
  /// When true, swaps content for a [CircularProgressIndicator] and disables
  /// the button. The button keeps its current width to avoid layout jumps.
  final bool isLoading;
 
  /// When true, the button stretches to fill its parent's width.
  final bool expand;
 
  /// Hard-disables the button independent of [isLoading].
  final bool enabled;
 
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tokens = _ButtonSizeTokens.resolve(size);
    final isDisabled = !enabled || isLoading;
    final style = _ButtonStyle.resolve(variant, cs, isDisabled);
    final isLink = variant == ButtonVariant.link;
 
    final buttonStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.all(style.backgroundColor),
      foregroundColor: WidgetStateProperty.all(style.foregroundColor),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) return style.overlayColor;
        if (states.contains(WidgetState.hovered)) {
          return style.overlayColor.withOpacity(0.04);
        }
        return Colors.transparent;
      }),
      padding: WidgetStateProperty.all(tokens.padding),
      minimumSize: WidgetStateProperty.all(Size(0, tokens.height)),
      maximumSize: WidgetStateProperty.all(
        expand ? const Size(double.infinity, double.infinity) : Size.infinite,
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            isLink ? 4 : tokens.borderRadius,
          ),
          side: style.borderSide ?? BorderSide.none,
        ),
      ),
      elevation: WidgetStateProperty.all(0),
      textStyle: WidgetStateProperty.all(
        TextStyle(
          fontSize: tokens.fontSize,
          fontWeight: FontWeight.w500,
          //decoration: isLink ? TextDecoration.underline : TextDecoration.none,
          decorationColor: style.foregroundColor,
        ),
      ),
      splashFactory: InkRipple.splashFactory,
    );
 
    final child = _ButtonContent(
      label: label,
      icon: icon,
      iconPosition: iconPosition,
      iconSize: tokens.iconSize,
      iconGap: tokens.iconGap,
      isLoading: isLoading,
      foregroundColor: style.foregroundColor,
      fontSize: tokens.fontSize,
    );
 
    final button = TextButton(
      style: buttonStyle,
      onPressed: isDisabled ? null : onPressed,
      child: child,
    );
 
    return expand
        ? SizedBox(width: double.infinity, child: button)
        : IntrinsicWidth(child: button);
  }
}
 
// ─────────────────────────────────────────────────────────────────────────────
// BUTTON CONTENT — handles loading state and icon placement
// ─────────────────────────────────────────────────────────────────────────────
 
class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.label,
    required this.icon,
    required this.iconPosition,
    required this.iconSize,
    required this.iconGap,
    required this.isLoading,
    required this.foregroundColor,
    required this.fontSize,
  });
 
  final String label;
  final Widget? icon;
  final ButtonIconPosition iconPosition;
  final double iconSize;
  final double iconGap;
  final bool isLoading;
  final Color foregroundColor;
  final double fontSize;
 
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: fontSize + 4,
        height: fontSize + 4,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: foregroundColor,
        ),
      );
    }
 
    final labelWidget = Text(label);
 
    if (icon == null) return labelWidget;
 
    final iconWidget = IconTheme(
      data: IconThemeData(size: iconSize, color: foregroundColor),
      child: icon!,
    );
 
    final children = iconPosition == ButtonIconPosition.left
        ? [iconWidget, SizedBox(width: iconGap), labelWidget]
        : [labelWidget, SizedBox(width: iconGap), iconWidget];
 
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
 
// ─────────────────────────────────────────────────────────────────────────────
// APP ICON BUTTON — icon-only, circular tap target
// Separate widget because shape, padding, and semantics are structurally
// different from labeled buttons. Adding it to AppButton would require
// nullable labels, special-cased padding, and forced circular radius.
// ─────────────────────────────────────────────────────────────────────────────
 
/// A circular icon-only button.
///
/// Structurally distinct from [AppButton] — different shape, different
/// tap target semantics, no label. Shares the same [ButtonVariant] and
/// [ButtonSize] enums for consistency.
///
/// ```dart
/// AppIconButton(
///   icon: Icon(Icons.close),
///   tooltip: 'Dismiss',
///   onPressed: Navigator.of(context).pop,
/// )
///
/// AppIconButton(
///   icon: Icon(Icons.bookmark_outline),
///   variant: ButtonVariant.outline,
///   onPressed: _save,
/// )
/// ```
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.variant = ButtonVariant.ghost,
    this.size = ButtonSize.md,
    this.tooltip,
    this.enabled = true,
    this.isLoading = false,
  });
 
  final Widget icon;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final String? tooltip;
  final bool enabled;
  final bool isLoading;
 
  double _buttonSize(ButtonSize size) => switch (size) {
        ButtonSize.sm => 34,
        ButtonSize.md => 42,
        ButtonSize.lg => 50,
      };
 
  double _iconSize(ButtonSize size) => switch (size) {
        ButtonSize.sm => 16,
        ButtonSize.md => 18,
        ButtonSize.lg => 22,
      };
 
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDisabled = !enabled || isLoading;
    final style = _ButtonStyle.resolve(variant, cs, isDisabled);
    final dimension = _buttonSize(size);
    final iSize = _iconSize(size);
 
    Widget child = isLoading
        ? SizedBox(
            width: iSize,
            height: iSize,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: style.foregroundColor,
            ),
          )
        : IconTheme(
            data: IconThemeData(size: iSize, color: style.foregroundColor),
            child: icon,
          );
 
    final button = SizedBox(
      width: dimension,
      height: dimension,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(style.backgroundColor),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) return style.overlayColor;
            return Colors.transparent;
          }),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          minimumSize: WidgetStateProperty.all(Size(dimension, dimension)),
          maximumSize: WidgetStateProperty.all(Size(dimension, dimension)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(dimension / 2),
              side: style.borderSide ?? BorderSide.none,
            ),
          ),
          elevation: WidgetStateProperty.all(0),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: child,
      ),
    );
 
    return tooltip != null
        ? Tooltip(message: tooltip!, child: button)
        : button;
  }
}
 
// ─────────────────────────────────────────────────────────────────────────────
// USAGE EXAMPLES
// ─────────────────────────────────────────────────────────────────────────────
//
// ── Variants ──────────────────────────────────────────────────────────────────
//
// AppButton(label: 'Continue', onPressed: _next)
// AppButton(label: 'Save draft', variant: ButtonVariant.secondary, onPressed: _save)
// AppButton(label: 'Cancel', variant: ButtonVariant.outline, onPressed: _cancel)
// AppButton(label: 'Remove', variant: ButtonVariant.destructiveOutline, onPressed: _remove)
// AppButton(label: 'Delete account', variant: ButtonVariant.destructive, onPressed: _delete)
// AppButton(label: 'Maybe later', variant: ButtonVariant.ghost, onPressed: _skip)
// AppButton(label: 'Learn more', variant: ButtonVariant.link, onPressed: _open)
//
// ── Sizes ─────────────────────────────────────────────────────────────────────
//
// AppButton(label: 'Small', size: ButtonSize.sm, onPressed: _action)
// AppButton(label: 'Medium', size: ButtonSize.md, onPressed: _action)   // default
// AppButton(label: 'Large', size: ButtonSize.lg, onPressed: _action)
//
// ── With icons ────────────────────────────────────────────────────────────────
//
// AppButton(
//   label: 'Upload',
//   icon: Icon(Icons.upload_outlined),
//   onPressed: _upload,
// )
//
// AppButton(
//   label: 'Next',
//   icon: Icon(Icons.arrow_forward),
//   iconPosition: ButtonIconPosition.right,
//   onPressed: _next,
// )
//
// ── Full width ────────────────────────────────────────────────────────────────
//
// AppButton(
//   label: 'Sign in',
//   expand: true,
//   isLoading: _isSigningIn,
//   onPressed: _signIn,
// )
//
// ── Icon-only ─────────────────────────────────────────────────────────────────
//
// AppIconButton(
//   icon: Icon(Icons.close),
//   tooltip: 'Dismiss',
//   onPressed: Navigator.of(context).pop,
// )
//
// AppIconButton(
//   icon: Icon(Icons.more_vert),
//   variant: ButtonVariant.ghost,
//   onPressed: _openMenu,
// )
 