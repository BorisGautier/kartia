// lib/src/modules/splash/presentation/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartia/generated/l10n.dart';
import 'package:kartia/src/core/utils/sizes.util.dart';
import '../bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashStarted()),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;

  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoFadeAnimation;
  late Animation<double> _logoRotationAnimation;
  late Animation<double> _textFadeAnimation;

  @override
  void initState() {
    super.initState();

    // Contrôleur pour le logo
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Contrôleur pour le texte
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Animations du logo
    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _logoFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _logoRotationAnimation = Tween<double>(begin: -0.2, end: 0.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    // Animations du texte
    _textFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          // Démarrer les animations selon la phase
          switch (state.animationPhase) {
            case SplashAnimationPhase.logoStarted:
              _logoController.forward();
              break;
            case SplashAnimationPhase.textStarted:
              _textController.forward();
              break;
            case SplashAnimationPhase.completed:
              // Naviguer vers la page suivante ou effectuer d'autres actions
              // par exemple, Navigator.pushReplacementNamed(context, '/home');
              break;
            default:
              break;
          }
        },
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.surface,
                    Theme.of(context).colorScheme.surface.withAlpha(80),
                    Theme.of(context).colorScheme.primary.withAlpha(10),
                  ],
                  stops: [0.0, 0.5 + (state.backgroundProgress * 0.3), 1.0],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(fixPadding),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Logo animé
                      Transform.rotate(
                        angle: _logoRotationAnimation.value,
                        child: Transform.scale(
                          scale: _logoScaleAnimation.value,
                          child: FadeTransition(
                            opacity: _logoFadeAnimation,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary.withAlpha(
                                      (0.3 * _logoFadeAnimation.value * 255)
                                          .toInt(),
                                    ),
                                    blurRadius: 20 * _logoFadeAnimation.value,
                                    spreadRadius: 5 * _logoFadeAnimation.value,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/images/logo.png',
                                width: 200.0,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: heightSpace.height! * 2),
                      SizedBox(height: heightSpace.height!),

                      // Indicateur de chargement animé
                      if (state.isLoading)
                        AnimatedBuilder(
                          animation: _textFadeAnimation,
                          builder: (context, child) {
                            // Afficher la barre de chargement dès que l'animation du texte est démarrée
                            final opacity =
                                state.animationPhase.index >=
                                        SplashAnimationPhase.textStarted.index
                                    ? _textFadeAnimation.value
                                    : 0.0;
                            return Opacity(
                              opacity: opacity,
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: CircularProgressIndicator(
                                  strokeWidth: 4,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                      SizedBox(height: heightSpace.height!),

                      // Texte de chargement
                      if (state.isLoading)
                        AnimatedBuilder(
                          animation: _textFadeAnimation,
                          builder: (context, child) {
                            // Afficher le texte dès que l'animation du texte est démarrée
                            final opacity =
                                state.animationPhase.index >=
                                        SplashAnimationPhase.textStarted.index
                                    ? _textFadeAnimation.value
                                    : 0.0;
                            return Opacity(
                              opacity: opacity,
                              child: Text(
                                KartiaLocalizations.of(context).loading,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withAlpha(70),
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
