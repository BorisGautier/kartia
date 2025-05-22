part of 'splash_bloc.dart';

enum SplashAnimationPhase {
  initial,
  backgroundStarted,
  logoStarted,
  textStarted,
  completed,
}

class SplashState extends Equatable {
  const SplashState({
    this.animationPhase = SplashAnimationPhase.initial,
    this.backgroundProgress = 0.0,
    this.logoProgress = 0.0,
    this.textProgress = 0.0,
    this.isLoading = true,
  });

  final SplashAnimationPhase animationPhase;
  final double backgroundProgress;
  final double logoProgress;
  final double textProgress;
  final bool isLoading;

  SplashState copyWith({
    SplashAnimationPhase? animationPhase,
    double? backgroundProgress,
    double? logoProgress,
    double? textProgress,
    bool? isLoading,
  }) {
    return SplashState(
      animationPhase: animationPhase ?? this.animationPhase,
      backgroundProgress: backgroundProgress ?? this.backgroundProgress,
      logoProgress: logoProgress ?? this.logoProgress,
      textProgress: textProgress ?? this.textProgress,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
    animationPhase,
    backgroundProgress,
    logoProgress,
    textProgress,
    isLoading,
  ];
}
