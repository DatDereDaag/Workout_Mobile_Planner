import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/constants/shadows.dart';
import 'package:fitness_app/screens/home/utils/exercise_card_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' show pi;

class ExerciseCard extends StatefulWidget {
  final String exerciseName;
  final List<String> exerciseInstructions;
  final String gifURL;

  const ExerciseCard({
    super.key,
    required this.exerciseName,
    required this.exerciseInstructions,
    required this.gifURL,
  });

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _imageRotationAnimation;

  late Animation<double> _detailsContainerFadeInAnimation;
  late Animation<double> _instructionsContainerFadeInAnimation;
  late Animation<double> _gifContainerFadeInAniamtion;

  late Animation<double> _titlePositionAnimation;
  late Animation<double> _titleFontSizeAniamtion;
  late Animation<double> _titlePaddingAnimation;

  late Animation<double> _descriptionFadeInAnimation;
  late Animation<double> _descriptionFadeOutAnimation;

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _imageRotationAnimation = Tween<double>(
      begin: 0,
      end: (pi),
    ).animate(_animationController);

    _detailsContainerFadeInAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.4, 1, curve: Curves.easeInOut),
          ),
        );

    _instructionsContainerFadeInAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.6, 1, curve: Curves.easeInOut),
          ),
        );

    _gifContainerFadeInAniamtion = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.8, 1, curve: Curves.easeInOut),
      ),
    );

    _titlePositionAnimation = Tween<double>(
      begin: 0,
      end: 65,
    ).animate(_animationController);

    _titleFontSizeAniamtion = Tween<double>(
      begin: 18,
      end: 20,
    ).animate(_animationController);

    _titlePaddingAnimation = Tween<double>(
      begin: 4,
      end: 6.0,
    ).animate(_animationController);

    _descriptionFadeInAnimation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Interval(0.3, 1)),
    );

    _descriptionFadeOutAnimation = Tween<double>(begin: 1.0, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Interval(0.2, 1)),
    );
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
    final double originalCardHeight = 160.0;
    final double expandedCardHeight = 540.0;

    final double expandedCardWidth = 240.0;

    final double cardTopPadding = 32.0;
    final double cardSidePadding = 16.0;

    final double originalTitleHeight = 34;
    final double expandedTitleHeight = 40;

    return GestureDetector(
      onTap: _toggleExpaned,
      child: Padding(
        padding: EdgeInsets.only(
          left: cardSidePadding,
          bottom: 0,
          right: cardSidePadding,
          top: cardTopPadding,
        ),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Stack(
              children: [
                //Exercise Card Background Image
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateY(_imageRotationAnimation.value),
                  child: ClipPath(
                    clipper: ExerciseCardClipper(),
                    child: Stack(
                      children: [
                        //Image
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..rotateY(-_imageRotationAnimation.value),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: isExpanded
                                ? expandedCardHeight
                                : originalCardHeight,
                            width: isExpanded
                                ? expandedCardWidth
                                : MediaQuery.of(context).size.width -
                                      (2 * cardSidePadding),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/bicep-curl.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        //Slight darkening of image
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: isExpanded
                              ? expandedCardHeight
                              : originalCardHeight,
                          width: isExpanded
                              ? expandedCardWidth
                              : MediaQuery.of(context).size.width -
                                    (2 * cardSidePadding),
                          color: const Color.fromARGB(
                            255,
                            42,
                            7,
                            7,
                          ).withValues(alpha: 0.4),
                        ),
                        //Gradient Overlay top left to bottom right
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: isExpanded
                              ? expandedCardHeight
                              : originalCardHeight,
                          width: isExpanded
                              ? expandedCardWidth
                              : MediaQuery.of(context).size.width -
                                    (2 * cardSidePadding),
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
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: isExpanded
                              ? expandedCardHeight
                              : originalCardHeight,
                          width: isExpanded
                              ? expandedCardWidth
                              : MediaQuery.of(context).size.width -
                                    (2 * cardSidePadding),
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
                //Details Widgets
                if (isExpanded)
                  Stack(
                    children: [
                      //Details Container
                      FadeTransition(
                        opacity: _detailsContainerFadeInAnimation,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 70,
                            top: 20,
                            right: 0,
                            bottom: 0,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            height: 510,
                            width: 350,
                            decoration: BoxDecoration(
                              color: AppColors.containerColor.withValues(
                                alpha: 0.6,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              boxShadow: AppShadows.containerShadow,
                            ),
                          ),
                        ),
                      ),
                      //Details
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 82,
                          top: 100,
                          right: 0,
                          bottom: 0,
                        ),
                        child: Column(
                          spacing: 12,
                          children: [
                            //Instructions Widget
                            FadeTransition(
                              opacity: _instructionsContainerFadeInAnimation,
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: AppColors.containerColor.withValues(
                                    alpha: 0.8,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  boxShadow: AppShadows.containerShadow,
                                ),
                                child: ListView.builder(
                                  itemCount: widget.exerciseInstructions.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          (index ==
                                              widget
                                                      .exerciseInstructions
                                                      .length -
                                                  1)
                                          ? EdgeInsets.only(bottom: 0)
                                          : EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        widget.exerciseInstructions.elementAt(
                                          index,
                                        ),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            //GIF Widget
                            FadeTransition(
                              opacity: _gifContainerFadeInAniamtion,
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: AppColors.containerColor.withValues(
                                    alpha: 0.8,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  boxShadow: AppShadows.containerShadow,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    16.0,
                                  ),
                                  child: Image.network(
                                    "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExcXY0ZG5vMXgwOHd6NzMxZjk2bXd3aW5ya2g5aXR1c256NHNva2NjdCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/GhjexFacI6U7TGCd09/giphy.gif",
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                //Exercise Card Title
                Padding(
                  padding: EdgeInsets.only(
                    top: 12.0,
                    left: _titlePositionAnimation.value,
                    right: 16.0,
                    bottom: 0.0,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: _titlePaddingAnimation.value,
                    ),
                    height: isExpanded
                        ? expandedTitleHeight
                        : originalTitleHeight,
                    decoration: BoxDecoration(
                      boxShadow: AppShadows.labelShadow,
                      color: AppColors.primaryColor.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      widget.exerciseName.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'BlackOps',
                        fontSize: _titleFontSizeAniamtion.value,
                        letterSpacing: 1.1,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ),
                // Sets, Weight and Reps Widget
                (isExpanded)
                    //Expanded Sets Reps and Weight Position
                    ? Positioned(
                        top: 62,
                        left: 88,
                        child: FadeTransition(
                          opacity: _descriptionFadeInAnimation,
                          child: Row(
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
                      )
                    :
                      //Normal Sets Reps and Weight Position
                      Positioned(
                        bottom: 24,
                        right: 28,
                        child: FadeTransition(
                          opacity: _descriptionFadeOutAnimation,
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
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
