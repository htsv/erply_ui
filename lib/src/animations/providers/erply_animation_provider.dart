import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Manages global animation settings and preferences
class ErplyAnimationProvider extends StateNotifier<AnimationSettings> {
  ErplyAnimationProvider() : super(AnimationSettings());

  /// Toggle global animation state
  void toggleAnimations(bool enabled) {
    state = state.copyWith(animationsEnabled: enabled);
  }

  /// Set global animation speed
  void setAnimationSpeed(double speed) {
    state = state.copyWith(animationSpeed: speed);
  }
}

/// Represents global animation settings
class AnimationSettings {
  /// Whether animations are globally enabled
  final bool animationsEnabled;

  /// Global animation speed multiplier
  final double animationSpeed;

  AnimationSettings({
    this.animationsEnabled = true,
    this.animationSpeed = 1.0,
  });

  /// Create a copy of the settings with optional overrides
  AnimationSettings copyWith({
    bool? animationsEnabled,
    double? animationSpeed,
  }) {
    return AnimationSettings(
      animationsEnabled: animationsEnabled ?? this.animationsEnabled,
      animationSpeed: animationSpeed ?? this.animationSpeed,
    );
  }
}

/// Provider for managing global animation settings
final animationProvider =
    StateNotifierProvider<ErplyAnimationProvider, AnimationSettings>((ref) {
  return ErplyAnimationProvider();
});
