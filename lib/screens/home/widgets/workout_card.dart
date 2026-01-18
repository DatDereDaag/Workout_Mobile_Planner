import 'dart:math';

import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/constants/shadows.dart';
import 'package:fitness_app/screens/home/widgets/button.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatefulWidget {
  const WorkoutCard({super.key});

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _lastCardRotation;
  late Animation<double> _secondCardRotation;
  late Animation<double> _firstCardRotation;

  late Animation<Offset> _lastCardTranslation;
  late Animation<Offset> _secondCardTranslation;
  late Animation<Offset> _firstCardTranslation;

  late Animation<double> _firstNewCardRotAnim;
  late Animation<double> _secondNewCardRotAnim;

  late Animation<Offset> _firstNewCardTranslation;
  late Animation<Offset> _secondNewCardTranslation;

  final double _lastCardOriginalRotation = -pi / 12;
  final double _lastCardNewRotation = -pi / 4;

  final Offset _lastCardOriginalPos = Offset(-20, -35);
  final Offset _lastCardNewPos = Offset(-110, -170);

  final double _secondCardOriginalRotation = -pi / 32;
  final double _secondCardNewRotation = -pi / 7;

  final Offset _secondCardOriginalPos = Offset(-8, -20);
  final Offset _secondCardNewPos = Offset(-60, -150);

  final double _firstCardNewRotation = -pi / 64;

  //New Cards Values
  final double _firstNewCardRotation = -pi / 10;
  final Offset _firstNewCardPos = Offset(-20, -110);

  final double _secondNewCardRotaiton = -pi / 16;
  final Offset _secondNewCardPos = Offset(0, -60);

  bool cardsAnimating = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _lastCardRotation = Tween<double>(
      begin: _lastCardOriginalRotation,
      end: _lastCardNewRotation,
    ).animate(_animationController);

    _lastCardTranslation = Tween<Offset>(
      begin: _lastCardOriginalPos,
      end: _lastCardNewPos,
    ).animate(_animationController);

    _secondCardRotation = Tween<double>(
      begin: _secondCardOriginalRotation,
      end: _secondCardNewRotation,
    ).animate(_animationController);

    _secondCardTranslation = Tween<Offset>(
      begin: _secondCardOriginalPos,
      end: _secondCardNewPos,
    ).animate(_animationController);

    _firstCardRotation = Tween<double>(
      begin: 0,
      end: _firstCardNewRotation,
    ).animate(_animationController);

    //Animations For New Instantiated Cards
    _firstNewCardRotAnim = Tween<double>(
      begin: 0,
      end: _firstNewCardRotation,
    ).animate(_animationController);

    _firstNewCardTranslation = Tween<Offset>(
      begin: Offset(0, 0),
      end: _firstNewCardPos,
    ).animate(_animationController);

    _secondNewCardRotAnim = Tween<double>(
      begin: 0,
      end: _secondNewCardRotaiton,
    ).animate(_animationController);

    _secondNewCardTranslation = Tween<Offset>(
      begin: Offset(0, 0),
      end: _secondNewCardPos,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void togglePageChange() {
    setState(() {
      cardsAnimating = true;
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Stack(
          children: [
            //Last Card
            Transform.translate(
              offset: _lastCardTranslation.value,
              child: Transform.rotate(
                angle: _lastCardRotation.value,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    top: 40,
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: AppShadows.labelShadow,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/images/ab.jpg'),
                        opacity: 0.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //Gradient Over Last Card
            Transform.translate(
              offset: _lastCardTranslation.value,
              child: Transform.rotate(
                angle: _lastCardRotation.value,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    top: 40,
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black.withValues(alpha: 0.1),
                          AppColors.backgroundColor.withValues(alpha: 0.4),
                          AppColors.backgroundColor.withValues(alpha: 0.4),
                          AppColors.primaryColor.withValues(alpha: 0.5),
                        ],
                        stops: [0.0, 0.4, 0.5, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),

            //Second Card
            Transform.translate(
              offset: _secondCardTranslation.value,
              child: Transform.rotate(
                angle: _secondCardRotation.value,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    top: 40,
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: AppShadows.labelShadow,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/images/squat.jpg'),
                        opacity: 0.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //Gradient Over 2nd Card
            Transform.translate(
              offset: _secondCardTranslation.value,
              child: Transform.rotate(
                angle: _secondCardRotation.value,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    top: 40,
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black.withValues(alpha: 0.1),
                          AppColors.backgroundColor.withValues(alpha: 0.4),
                          AppColors.backgroundColor.withValues(alpha: 0.4),
                          AppColors.primaryColor.withValues(alpha: 0.5),
                        ],
                        stops: [0.0, 0.4, 0.5, 1.0],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //Extra Cards For Animation
            if (cardsAnimating)
              Stack(
                children: [
                  //First New Card After
                  Transform.translate(
                    offset: _firstNewCardTranslation.value,
                    child: Transform.rotate(
                      angle: _firstNewCardRotAnim.value,
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(
                          top: 40,
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: AppShadows.labelShadow,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/images/bicep-curl.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: _firstNewCardTranslation.value,
                    child: Transform.rotate(
                      angle: _firstNewCardRotAnim.value,
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(
                          top: 40,
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black.withValues(alpha: 0.1),
                                AppColors.backgroundColor.withValues(
                                  alpha: 0.4,
                                ),
                                AppColors.backgroundColor.withValues(
                                  alpha: 0.4,
                                ),
                                AppColors.primaryColor.withValues(alpha: 0.5),
                              ],
                              stops: [0.0, 0.4, 0.5, 1.0],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Second New Card After
                  Transform.translate(
                    offset: _secondNewCardTranslation.value,
                    child: Transform.rotate(
                      angle: _secondNewCardRotAnim.value,
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(
                          top: 40,
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: AppShadows.labelShadow,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/images/bicep-curl.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: _secondNewCardTranslation.value,
                    child: Transform.rotate(
                      angle: _secondNewCardRotAnim.value,
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(
                          top: 40,
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black.withValues(alpha: 0.1),
                                AppColors.backgroundColor.withValues(
                                  alpha: 0.4,
                                ),
                                AppColors.backgroundColor.withValues(
                                  alpha: 0.4,
                                ),
                                AppColors.primaryColor.withValues(alpha: 0.5),
                              ],
                              stops: [0.0, 0.4, 0.5, 1.0],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            //First Card
            Transform.rotate(
              angle: _firstCardRotation.value,
              child: Padding(
                padding: EdgeInsetsGeometry.only(
                  top: 40,
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: AppShadows.labelShadow,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/bicep-curl.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            //Gradient Over First Card
            Transform.rotate(
              angle: _firstCardRotation.value,
              child: Padding(
                padding: EdgeInsetsGeometry.only(
                  top: 40,
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black.withValues(alpha: 0.1),
                        AppColors.backgroundColor.withValues(alpha: 0.4),
                        AppColors.backgroundColor.withValues(alpha: 0.4),
                        AppColors.primaryColor.withValues(alpha: 0.5),
                      ],
                      stops: [0.0, 0.4, 0.5, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            //Buttons
            Positioned(
              bottom: 50,
              right: 30,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: togglePageChange,
                    child: Button(text: "View Workout"),
                  ),
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: togglePageChange,
                    child: Button(text: "Start Workout"),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
