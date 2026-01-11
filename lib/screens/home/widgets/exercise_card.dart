import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/constants/shadows.dart';
import 'package:fitness_app/screens/home/utils/exercise_card_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' show pi;

class ExerciseCard extends StatefulWidget {
  final String exerciseName;
  final String description;
  final String gifURL;

  const ExerciseCard({
    super.key,
    required this.exerciseName,
    required this.description,
    required this.gifURL,
  });

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _animationController;

  late Animation<double> _imageRotationAnimation;
  late Animation<double> _imageTranslationAnimationX;
  late Animation<double> _imageTranslationAnimationY;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _imageRotationAnimation = Tween<double>(
      begin: 0,
      end: (pi / 2),
    ).animate(_animationController);

    _imageTranslationAnimationX = Tween<double>(
      begin: 0,
      end: -94.0,
    ).animate(_animationController);

    _imageTranslationAnimationY = Tween<double>(
      begin: 0,
      end: 75,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpaned() {
    setState(() {
      isExpanded = !isExpanded;
      isExpanded
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpaned,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        padding: isExpanded
            ? EdgeInsets.only(left: 16.0, bottom: 164.0, right: 16.0, top: 32.0)
            : EdgeInsets.only(left: 16.0, bottom: 0, right: 16.0, top: 32.0),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Stack(
              children: [
                //Exercise Card Background Image
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translateByDouble(
                      _imageTranslationAnimationX.value,
                      _imageTranslationAnimationY.value,
                      0,
                      1,
                    )
                    ..rotateZ(_imageRotationAnimation.value),

                  child: ClipPath(
                    clipper: ExerciseCardClipper(),
                    child: Stack(
                      children: [
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/bicep-curl.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 160,
                          color: const Color.fromARGB(
                            255,
                            42,
                            7,
                            7,
                          ).withValues(alpha: 0.4),
                        ),
                        //Gradient Overlay top left to bottom right
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black.withValues(alpha: 1),
                                AppColors.backgroundColor.withValues(
                                  alpha: 0.4,
                                ),
                                AppColors.backgroundColor.withValues(
                                  alpha: 0.4,
                                ),
                                AppColors.primaryColor.withValues(alpha: 0.7),
                              ],
                              stops: [0.0, 0.4, 0.6, 1.0],
                            ),
                          ),
                        ),
                        //Gradient Overlay top right to bottom left
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.black.withValues(alpha: 1),
                                Colors.transparent,
                                Colors.transparent,
                                AppColors.primaryColor.withValues(alpha: 1),
                              ],
                              stops: [0.0, 0.2, 0.7, 1.0],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Exercise Card Title
                Padding(
                  padding: EdgeInsets.only(
                    top: 12.0,
                    left: 0.0,
                    right: 16.0,
                    bottom: 0.0,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    height: 34,
                    decoration: BoxDecoration(
                      boxShadow: AppShadows.labelShadow,
                      color: AppColors.primaryColor.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      widget.exerciseName.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'BlackOps',
                        fontSize: 18,
                        letterSpacing: 1.1,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ),
                // Sets and Reps Widget
                Positioned(
                  bottom: 24,
                  right: 28,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8.0,
                    children: [
                      //Weight
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 2.0,
                        ),
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: AppShadows.descriptionlabelShadow,
                        ),
                        child: Text(
                          "60 lbs",
                          style: TextStyle(
                            fontFamily: 'BlackOps',
                            fontSize: 14,
                            letterSpacing: -0.12,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),

                      //Sets
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 2.0,
                        ),
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: AppShadows.descriptionlabelShadow,
                        ),
                        child: Text(
                          "Sets: 4",
                          style: TextStyle(
                            fontFamily: 'BlackOps',
                            fontSize: 14,
                            letterSpacing: -0.12,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),

                      //Reps
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 2.0,
                        ),
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: AppShadows.descriptionlabelShadow,
                        ),
                        child: Text(
                          "Reps: 12",
                          style: TextStyle(
                            fontFamily: 'BlackOps',
                            fontSize: 14,
                            letterSpacing: -0.12,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
