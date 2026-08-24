import 'package:audio_book/constants/string_const.dart';
import 'package:audio_book/core/app_colors.dart';
import 'package:audio_book/core/app_icons.dart';
import 'package:audio_book/core/app_textstyles.dart';
import 'package:audio_book/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';

import '../widgets/primary_btn.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final List<_GenreItemData> _items = const [
    _GenreItemData(
      assetPath: AppIcons.fantasyImg,
      leftFactor: 0.08,
      topFactor: 0.08,
      widthFactor: 0.42,
      beginDxFactor: -0.5,
      beginDyFactor: -0.2,
      intervalStart: 0.0,
      intervalEnd: 0.42,
    ),
    _GenreItemData(
      assetPath: AppIcons.historicalImg,
      leftFactor: 0.49,
      topFactor: 0.18,
      widthFactor: 0.48,
      beginDxFactor: 0.55,
      beginDyFactor: -0.15,
      intervalStart: 0.12,
      intervalEnd: 0.54,
    ),
    _GenreItemData(
      assetPath: AppIcons.dramaImg,
      leftFactor: 0.02,
      topFactor: 0.36,
      widthFactor: 0.56,
      beginDxFactor: -0.6,
      beginDyFactor: 0.1,
      intervalStart: 0.18,
      intervalEnd: 0.62,
    ),
    _GenreItemData(
      assetPath: AppIcons.novelImg,
      leftFactor: 0.50,
      topFactor: 0.42,
      widthFactor: 0.33,
      beginDxFactor: 0.0,
      beginDyFactor: 0.45,
      intervalStart: 0.3,
      intervalEnd: 0.74,
    ),
    _GenreItemData(
      assetPath: AppIcons.tragedyImg,
      leftFactor: -0.01,
      topFactor: 0.56,
      widthFactor: 0.34,
      beginDxFactor: -0.35,
      beginDyFactor: 0.5,
      intervalStart: 0.42,
      intervalEnd: 0.84,
    ),
    _GenreItemData(
      assetPath: AppIcons.detectiveImg,
      leftFactor: 0.46,
      topFactor: 0.67,
      widthFactor: 0.52,
      beginDxFactor: 0.6,
      beginDyFactor: 0.35,
      intervalStart: 0.52,
      intervalEnd: 1.0,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const .only(top: 73.0),
        child: Column(
          children: [
            Padding(
              padding: const .symmetric(horizontal: 50.0),
              child: RichText(
                  textAlign: .center,
                  text: TextSpan(
                text: "Choose Your Favorite ",
                style: AppTextStyles.headingTextStyle.copyWith(fontFamily: StringConst.appFontFamily, ),
                children: [
                  TextSpan(
                    text: "Genre",
                    style: AppTextStyles.headingTextStyle.copyWith(fontFamily: StringConst.appFontFamily,  color: AppColors.primaryColor),
                  )
                ]
              )),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  final height = constraints.maxHeight;

                  return Stack(
                    clipBehavior: Clip.none,
                    children: _items.map((item) => _AnimatedGenreItem(controller: _controller, data: item, canvasWidth: width, canvasHeight: height,),).toList(),
                  );
                },
              ),
            ),
            Container(
              width: .infinity,
              margin: .symmetric(horizontal: 20, vertical: 45),
              child: PrimaryBtn(btnText: "Next", onTap: ()=> context.push(NamedRoutes.home.routeName),),
            )
          ],
        ),
      ),
    );
  }
}

class _AnimatedGenreItem extends StatelessWidget {
  const _AnimatedGenreItem({
    required this.controller,
    required this.data,
    required this.canvasWidth,
    required this.canvasHeight,
  });

  final AnimationController controller;
  final _GenreItemData data;
  final double canvasWidth;
  final double canvasHeight;

  @override
  Widget build(BuildContext context) {
    final animation = CurvedAnimation(
      parent: controller,
      curve: Interval(
        data.intervalStart,
        data.intervalEnd,
        curve: Curves.easeOutCubic,
      ),
    );

    final itemWidth = canvasWidth * data.widthFactor;
    final finalLeft = canvasWidth * data.leftFactor;
    final finalTop = canvasHeight * data.topFactor;

    return Positioned(
      left: finalLeft,
      top: finalTop,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final value = animation.value;

          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(
                canvasWidth * data.beginDxFactor * (1 - value),
                canvasHeight * data.beginDyFactor * (1 - value),
              ),
              child: Transform.scale(
                scale: 0.9 + (0.1 * value),
                child: child,
              ),
            ),
          );
        },
        child: Image.asset(
          data.assetPath,
          width: itemWidth,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _GenreItemData {
  const _GenreItemData({
    required this.assetPath,
    required this.leftFactor,
    required this.topFactor,
    required this.widthFactor,
    required this.beginDxFactor,
    required this.beginDyFactor,
    required this.intervalStart,
    required this.intervalEnd,
  });

  final String assetPath;
  final double leftFactor;
  final double topFactor;
  final double widthFactor;
  final double beginDxFactor;
  final double beginDyFactor;
  final double intervalStart;
  final double intervalEnd;
}