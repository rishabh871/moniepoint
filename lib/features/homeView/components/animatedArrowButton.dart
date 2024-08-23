import 'package:flutter/material.dart';
import 'package:real_estate_task/core/sizer/responsive_sizer.dart';
import 'package:real_estate_task/core/widgets/blur/blur.dart';

class AnimatedArrowButton extends StatefulWidget {
  @override
  _AnimatedArrowButtonState createState() => _AnimatedArrowButtonState();
}

class _AnimatedArrowButtonState extends State<AnimatedArrowButton>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(milliseconds: 1500), () {
        _toggleExpansion();
      });
    });
  }

  void _toggleExpansion() {
    setState(() {
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 100.w,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          width: _isExpanded ? 100.w : 5.h,
          height: 5.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_isExpanded)
                    Flexible(
                      child: Blur(
                          blur: 8, blurColor: Colors.white, child: Container()),
                    )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_isExpanded)
                    const Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Center(
                          child: Text(
                            'Glokova st 25',
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  Container(
                    width: 5.h,
                    height: 5.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_forward_ios,
                        size: 14, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
