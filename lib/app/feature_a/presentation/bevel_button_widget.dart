import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';

class BevelButtonWidget extends StatefulWidget {
  const BevelButtonWidget({
    required this.height,
    required this.width,
    required this.icon,
    this.callback,
    this.widgetBackground,
    this.shape = BoxShape.circle,
    Key? key,
  }) : super(key: key);

  final BoxShape shape;
  final double height;
  final double width;
  final VoidCallback? callback;
  final Widget icon;
  final Widget? widgetBackground;

  @override
  State<BevelButtonWidget> createState() => _BevelButtonWidgetState();
}

class _BevelButtonWidgetState extends State<BevelButtonWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late final Animation<double> _backgroundScaleAnimation;
  late final Animation<double> _backgroundOpacityAnimation;

  var _isPressed = false;

  @override
  void initState() {
    _animationController = AnimationController(
      value: 0,
      vsync: this,
    );

    _backgroundScaleAnimation = Tween<double>(
      begin: 1,
      end: 0.98,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    _backgroundOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapCancel: _handleTapCancel,
      onTapUp: _handleTapUp,
      child: _buildOuterShape(context),
    );
  }

  Widget _buildOuterShape(BuildContext context) {
    Widget? icon;
    if (widget.widgetBackground != null) {
      try {
        final bevelInnerContainer =
            widget.widgetBackground! as BevelInnerContainer;
        icon = bevelInnerContainer.icon;
      } catch (_) {}
    }

    return Container(
      decoration: AlohaBoxDecoration(
        shape: widget.shape,
        gradient:
        AlohaTheme.of(context).lightEffect.lightEffectDimHighIntensity.toLinearGradient(),
        boxShadow: [
          AlohaTheme.of(context).shadow.shadowBevelBottomHigh.toBoxShadow(),
        ],
      ),
      child: Container(
        decoration: AlohaBoxDecoration(
          shape: widget.shape,
          gradient: AlohaTheme.of(context).lightEffect.lightEffectDimHighIntensity
              .toLinearGradient(),
          boxShadow: [
            AlohaTheme.of(context).shadow.shadowBevelBottomHigh.toBoxShadow(),
          ],
        ),
        padding: const EdgeInsets.all(3.5),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: SizedBox(
                height: widget.height,
                width: widget.width,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildMiddleShape(),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: _getInnerStack(icon),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiddleShape() {
    if (widget.widgetBackground != null) {
      return widget.widgetBackground!;
    }
    final innerGradientColor = AlohaTheme.of(context).brightness == Brightness.light
        ? AlohaTheme.of(context).colors.fillMutePrimary
        : AlohaTheme.of(context).colors.fillBackgroundPrimary;
    return BevelInnerContainer(
      shape: widget.shape,
      outerRingColor: AlohaTheme.of(context).colors.fillBackgroundPrimary,
      innerGradientColor: innerGradientColor,
    );
  }

  Widget _getInnerStack(Widget? innerIcon) {
    return Stack(
      children: [
        _buildIcon(innerIcon),
        _buildPressedOverlay(context),
      ],
    );
  }

  Widget _buildIcon(Widget? innerIcon) {
    return Container(
      decoration: AlohaBoxDecoration(
        shape: widget.shape,
        gradient: AlohaTheme.of(context).lightEffect.lightEffectBrightHighIntensity
            .toLinearGradient(),
      ),
      child: Container(
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        child: innerIcon ?? widget.icon,
      ),
    );
  }

  Widget _buildPressedOverlay(BuildContext context) {
    return ScaleTransition(
      scale: _backgroundScaleAnimation,
      child: FadeTransition(
        opacity: _backgroundOpacityAnimation,
        child: Container(
          decoration: _pressedDecoration(context),
          child: SizedBox(height: widget.height, width: widget.width),
        ),
      ),
    );
  }

  AlohaBoxDecoration _pressedDecoration(BuildContext context) {
    return AlohaBoxDecoration(
      shape: widget.shape,
      gradient:
      AlohaTheme.of(context).lightEffect.lightEffectDimHighIntensity.toLinearGradient(),
    );
  }

  void _handleTapDown(details) {
    _isPressed = true;
    _animateTaps();
  }

  void _handleTapUp(details) {
    if (_isPressed) {
      _isPressed = false;
      _animateTaps();
    }
  }

  void _handleTapCancel() {
    if (_isPressed) {
      _isPressed = false;
      _animateTaps(cancelled: true);
    }
  }

  void _animateTaps({cancelled = false}) {
    // Prevent multiple animations to start when tap down/up/cancel events
    // happen quickly.
    if (_animationController.isAnimating) {
      return;
    }

    // Plays tap down animation and registers a future to play a rebound (up)
    // animation.
    final wasButtonHeldDown = _isPressed;
    void _downAnimation() {
      _animationController
          .animateTo(1, duration: const Duration(milliseconds: 33))
          .then((_) {
        // Trigger a rebound animation
        if (mounted && wasButtonHeldDown != _isPressed) {
          _animateTaps(cancelled: cancelled);
        }
      });
    }

    // Resets the button from pressed to normal state and triggers the onTap
    // callback if the gesture wasn't cancelled.
    void _upAnimation() {
      _animationController
          .animateBack(0,
              duration: const Duration(milliseconds: 183),
              curve: const Interval(100 / 183, 1))
          .then((_) {
        if (!cancelled) widget.callback?.call();
      });
    }

    _isPressed ? _downAnimation() : _upAnimation();
  }
}

class BevelInnerContainer extends StatelessWidget {
  final Color outerRingColor;
  final Color innerGradientColor;
  final BoxShape shape;
  final Widget? icon;
  final double? bevelBrightness;

  const BevelInnerContainer({
    Key? key,
    required this.outerRingColor,
    required this.innerGradientColor,
    required this.shape,
    this.icon,
    this.bevelBrightness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AlohaBoxDecoration(
        shape: shape,
        color: outerRingColor,
        boxShadow: [
          AlohaTheme.of(context).shadow.shadowHigh.toBoxShadow(),
        ],
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: AlohaBoxDecoration(
          shape: shape,
          color: innerGradientColor,
        ),
        child: _innerShape(context),
      ),
    );
  }

  Widget _innerShape(
    BuildContext context,
  ) {
    final opacity =
    AlohaTheme.of(context).brightness == Brightness.light ? 0.7 : 0.04;
    return Container(
      decoration: AlohaBoxDecoration(
        shape: shape,
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(bevelBrightness ?? opacity),
            outerRingColor.withOpacity(bevelBrightness != null ? 0 : opacity),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Container(
        decoration: AlohaBoxDecoration(
          shape: shape,
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(bevelBrightness ?? opacity),
              innerGradientColor
                  .withOpacity(bevelBrightness != null ? 0 : opacity),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
