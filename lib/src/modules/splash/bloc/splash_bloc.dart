import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashStarted>(_onSplashStarted);
    on<BackgroundAnimationCompleted>(_onBackgroundAnimationCompleted);
    on<LogoAnimationCompleted>(_onLogoAnimationCompleted);
    on<TextAnimationCompleted>(_onTextAnimationCompleted);
    on<BackgroundProgressUpdate>(_onBackgroundProgressUpdate);
    on<LogoProgressUpdate>(_onLogoProgressUpdate);
    on<TextProgressUpdate>(_onTextProgressUpdate);
  }

  Timer? _backgroundTimer;
  Timer? _logoTimer;
  Timer? _textTimer;

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    // Démarrer immédiatement l'animation de l'arrière-plan
    emit(
      state.copyWith(animationPhase: SplashAnimationPhase.backgroundStarted),
    );

    // Démarrer l'animation de l'arrière-plan
    _startBackgroundAnimation();

    // Attendre 300ms puis démarrer l'animation du logo
    await Future.delayed(const Duration(milliseconds: 300));
    if (!emit.isDone) {
      emit(state.copyWith(animationPhase: SplashAnimationPhase.logoStarted));
      _startLogoAnimation();
    }

    // Attendre 800ms puis démarrer l'animation du texte
    await Future.delayed(const Duration(milliseconds: 800));
    if (!emit.isDone) {
      emit(state.copyWith(animationPhase: SplashAnimationPhase.textStarted));
      _startTextAnimation();
    }
  }

  void _startBackgroundAnimation() {
    const duration = Duration(milliseconds: 2000);
    const interval = Duration(milliseconds: 16); // ~60fps
    final steps = duration.inMilliseconds / interval.inMilliseconds;
    int currentStep = 0;

    _backgroundTimer = Timer.periodic(interval, (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }

      currentStep++;
      final progress = (currentStep / steps).clamp(0.0, 1.0);

      // Utiliser add au lieu de emit directement dans le timer
      if (!isClosed) {
        add(BackgroundProgressUpdate(progress));
      }

      if (progress >= 1.0) {
        timer.cancel();
        if (!isClosed) {
          add(BackgroundAnimationCompleted());
        }
      }
    });
  }

  void _startLogoAnimation() {
    const duration = Duration(milliseconds: 1500);
    const interval = Duration(milliseconds: 16);
    final steps = duration.inMilliseconds / interval.inMilliseconds;
    int currentStep = 0;

    _logoTimer = Timer.periodic(interval, (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }

      currentStep++;
      final progress = (currentStep / steps).clamp(0.0, 1.0);

      // Utiliser add au lieu de emit directement dans le timer
      if (!isClosed) {
        add(LogoProgressUpdate(progress));
      }

      if (progress >= 1.0) {
        timer.cancel();
        if (!isClosed) {
          add(LogoAnimationCompleted());
        }
      }
    });
  }

  void _startTextAnimation() {
    const duration = Duration(milliseconds: 1000);
    const interval = Duration(milliseconds: 16);
    final steps = duration.inMilliseconds / interval.inMilliseconds;
    int currentStep = 0;

    _textTimer = Timer.periodic(interval, (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }

      currentStep++;
      final progress = (currentStep / steps).clamp(0.0, 1.0);

      // Utiliser add au lieu de emit directement dans le timer
      if (!isClosed) {
        add(TextProgressUpdate(progress));
      }

      if (progress >= 1.0) {
        timer.cancel();
        if (!isClosed) {
          add(TextAnimationCompleted());
        }
      }
    });
  }

  void _onBackgroundProgressUpdate(
    BackgroundProgressUpdate event,
    Emitter<SplashState> emit,
  ) {
    emit(state.copyWith(backgroundProgress: event.progress));
  }

  void _onLogoProgressUpdate(
    LogoProgressUpdate event,
    Emitter<SplashState> emit,
  ) {
    emit(state.copyWith(logoProgress: event.progress));
  }

  void _onTextProgressUpdate(
    TextProgressUpdate event,
    Emitter<SplashState> emit,
  ) {
    emit(state.copyWith(textProgress: event.progress));
  }

  void _onBackgroundAnimationCompleted(
    BackgroundAnimationCompleted event,
    Emitter<SplashState> emit,
  ) {
    // Animation de l'arrière-plan terminée
    // Vous pouvez ajouter ici de la logique spécifique si nécessaire
  }

  void _onLogoAnimationCompleted(
    LogoAnimationCompleted event,
    Emitter<SplashState> emit,
  ) {
    // Animation du logo terminée
    // Vous pouvez ajouter ici de la logique spécifique si nécessaire
  }

  void _onTextAnimationCompleted(
    TextAnimationCompleted event,
    Emitter<SplashState> emit,
  ) {
    // Toutes les animations sont terminées
    emit(
      state.copyWith(
        animationPhase: SplashAnimationPhase.completed,
        isLoading: false,
      ),
    );
  }

  @override
  Future<void> close() {
    _backgroundTimer?.cancel();
    _logoTimer?.cancel();
    _textTimer?.cancel();
    return super.close();
  }
}
