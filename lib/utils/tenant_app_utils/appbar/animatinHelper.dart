import 'package:flutter/material.dart';

class CustomAnimationHelper {

  late AnimationController _animationController , _textAnimationController ,  _navBarAnimationController;
  late Animation _hotelTween, _iconTween, _colorsTween2;
  late Animation<Color?> _colorsTween;

  // NavBar Animation Controller var
  late Animation<Offset> _navBarOffsetAnimation;
  bool isScrollingDown = false;
  double lastOffset = 0;

  CustomAnimationHelper(TickerProvider vsync) {
    _animationController =
        AnimationController(vsync: vsync, duration: Duration(seconds: 0));

    _colorsTween2 = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_animationController);

    // _colorsTween = ColorTween(
    //   begin: Color(0xff62a3da),
    //   end: Colors.white
    // ).animate(_animationController);

    _hotelTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);

    _textAnimationController =
        AnimationController(vsync: vsync, duration: Duration(seconds: 0));

    _navBarAnimationController =
        AnimationController(vsync: vsync, duration: Duration(seconds: 0));
    _navBarOffsetAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _navBarAnimationController, curve: Curves.easeInOut));
  }


  void scrollListener(ScrollNotification scrollNotification) {
    if (scrollNotification.metrics.axis == Axis.vertical) {
      double currentOffset = scrollNotification.metrics.pixels;

          if (currentOffset > lastOffset && !isScrollingDown) {
            isScrollingDown = true;
            _navBarAnimationController.reverse();
          } else if (currentOffset < lastOffset && isScrollingDown) {
            isScrollingDown = false;
            _navBarAnimationController.forward();
          }

      // if ((currentOffset - lastOffset).abs() > 5) {
      //   if (currentOffset > lastOffset && !isScrollingDown) {
      //     isScrollingDown = true;
      //     _navBarAnimationController.reverse();
      //   } else if (currentOffset < lastOffset && isScrollingDown) {
      //     isScrollingDown = false;
      //     _navBarAnimationController.forward();
      //   }
      //
        lastOffset = currentOffset;

        _animationController.animateTo(scrollNotification.metrics.pixels / 80);
        _textAnimationController.animateTo(scrollNotification.metrics.pixels);

     // }
    }
  }

    AnimationController get animationController => _animationController;
    Animation get hotelTween => _hotelTween;
    Animation get iconTween => _iconTween;
    Animation get colorsTween2 => _colorsTween2;
    Animation<Color?> get colorsTween => _colorsTween;
    AnimationController get textAnimationController => _textAnimationController;
    Animation<Offset> get navBarOffsetAnimation => _navBarOffsetAnimation;

  void dispose(){
    _animationController.dispose();
    _textAnimationController.dispose();
    _navBarAnimationController.dispose();
  }
}
