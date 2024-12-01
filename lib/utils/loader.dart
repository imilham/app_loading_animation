import 'dart:ui';

import 'package:app_loading_animation/service/app_states.dart';
import 'package:app_loading_animation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';



class AppLoader extends StatefulWidget {
  final Widget? child;

  const AppLoader({
    super.key,
    this.child,
  });

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> with TickerProviderStateMixin {
  late AppStatesServiceProvider _appStateProvider;
  late Animation<double> _animation;
  late AnimationController _animationController;
  bool showLoading = false;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCubic));
    _appStateProvider = Provider.of<AppStatesServiceProvider>(context, listen: false);
    _appStateProvider.addListener(() => onLoadingStateChanged(_appStateProvider.isLoading));
    super.initState();
  }

  void onLoadingStateChanged(bool value) {
    if (mounted) {
      if (value && !_animationController.isAnimating) {
        setState(() {
          showLoading = true;
        });
        _animationController.forward();
      } else {
        _animationController.reverse().then((value) => setState(() => showLoading = false));
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: widget.child ?? const SizedBox()),
        if (showLoading)
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: _animation.value * 2, sigmaY: _animation.value * 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha((_animation.value * 40).toInt()),
                      ),
                      child: Center(
                        child: FadeTransition(
                          opacity: _animation,
                          child: child,
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: LoadingAnimationWidget.hexagonDots(color: Theme.of(context).colorScheme.primary, size: ScreenUtil.getWidth(context, 0.15)),
            ),
          ),
      ],
    );
  }
}

class OnPageLoader extends StatelessWidget {
  const OnPageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.flickr(leftDotColor: Colors.green, rightDotColor: Colors.red, size: ScreenUtil.getWidth(context, 0.15)),
      ),
    );
  }
}
