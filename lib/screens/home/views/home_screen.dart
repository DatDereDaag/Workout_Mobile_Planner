import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/constants/shadows.dart';
import 'package:fitness_app/screens/home/views/current_workout_screen.dart';
import 'package:fitness_app/screens/home/views/routine_screen.dart';
import 'package:fitness_app/screens/home/widgets/clock.dart';
import 'package:fitness_app/screens/home/widgets/workout_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // //Close Hive when done, Put this code elsewhere since it is needed globally

  // @override
  // void dispose() {
  //   Hive.close();
  //   super.dispose();
  // }

  late AnimationController _animationController;

  late Animation<double> _fadeInAnimation;

  final List<String> bodyParts = [
    'back',
    'cardio',
    'chest',
    'lower arms',
    'lower legs',
    'neck',
    'shoulders',
    'upper arms',
    'upper legs',
    'waist',
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeInAnimation = Tween<double>(begin: 1.0, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Interval(0, 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeInAnimation,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Scaffold(
            body: Stack(
              children: [
                //Background Image
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background2.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topRight,
                      opacity: 0.2,
                      colorFilter: ColorFilter.mode(
                        AppColors.backgroundColor,
                        BlendMode.hue,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [
                        AppColors.buttonColor.withValues(alpha: 0.2),
                        AppColors.backgroundColor.withValues(alpha: 0.5),
                        AppColors.backgroundColor.withValues(alpha: 0.5),
                        AppColors.buttonColor.withValues(alpha: 0.2),
                      ],
                      stops: [0.0, 0.4, 0.5, 1.0],
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 24),
                    Clock(),
                    Transform.translate(
                      offset: Offset(0, -25),
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(
                            "Welcome!",
                            style: TextStyle(
                              fontSize: 28,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontFamily: "ExpletusSans",
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 32),
                    //Workout Container
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          boxShadow: AppShadows.labelShadow,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.backgroundColor,
                              AppColors.primaryColor.withValues(alpha: 0.5),
                            ],
                          ),
                        ),

                        //Workout Card With Buttons
                        child: WorkoutCard(
                          onButtonPressed: (String action) async {
                            await _animationController.forward();
                            if (action == 'view') {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAniamtion,
                                      ) => CurrentWorkoutScreen(),
                                  transitionsBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                        child,
                                      ) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                  transitionDuration: Duration(
                                    milliseconds: 500,
                                  ),
                                ),
                              );

                              //Checks to see if returned, if so reverse animation
                              if (mounted) {
                                await _animationController.forward();
                                _animationController.reverse();
                              }
                            }
                            if (action == 'start') {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAniamtion,
                                      ) => RoutineScreen(),
                                  transitionsBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                        child,
                                      ) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                  transitionDuration: Duration(
                                    milliseconds: 500,
                                  ),
                                ),
                              );

                              //Checks to see if returned, if so reverse animation
                              if (mounted) {
                                await _animationController.forward();
                                _animationController.reverse();
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
