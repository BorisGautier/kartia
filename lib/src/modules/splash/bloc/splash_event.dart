part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class SplashStarted extends SplashEvent {}

class BackgroundAnimationCompleted extends SplashEvent {}

class LogoAnimationCompleted extends SplashEvent {}

class TextAnimationCompleted extends SplashEvent {}

// Events internes pour les mises à jour de progrès
class BackgroundProgressUpdate extends SplashEvent {
  const BackgroundProgressUpdate(this.progress);

  final double progress;

  @override
  List<Object> get props => [progress];
}

class LogoProgressUpdate extends SplashEvent {
  const LogoProgressUpdate(this.progress);

  final double progress;

  @override
  List<Object> get props => [progress];
}

class TextProgressUpdate extends SplashEvent {
  const TextProgressUpdate(this.progress);

  final double progress;

  @override
  List<Object> get props => [progress];
}
