import 'package:flutter/material.dart';
import '../app_theme/text_styles.dart';

class ShowSnackBar {
  static showError(BuildContext context, String? message) {
    final overlay = Overlay.of(context);

    if (overlay == null) {
      return; // Exit if there is no Overlay associated with the current context
    }

    // Declare overlayEntry first
    late OverlayEntry overlayEntry;

    // Now initialize overlayEntry
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10, // Adjust padding from the top
        left: 10,
        right: 10,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF1B75BC),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    message ?? 'Error',
                    style: TextStyles(context).googlePoppinsFontsForButtonText(
                      fontWeight: FontWeight.w200,
                      fontSize: 13,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (overlayEntry.mounted) {
                      overlayEntry.remove(); // Safely remove the snackbar
                    }
                  },
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

    // Insert the overlay
    overlay.insert(overlayEntry);

    // Automatically remove the overlay after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove(); // Safely remove after delay
      }
    });
  }

  static showErrorFromButton(BuildContext context,String? message){
    final snackBar = SnackBar(
      content:  Text(message??'Error',style: TextStyles(context).googlePoppinsFontsForButtonText(fontWeight: FontWeight.w200,fontSize: 13),),
      backgroundColor: const Color(0xFF1B75BC),
      duration: const Duration(seconds: 3),
      // showCloseIcon: true,

      action: SnackBarAction(
        label: 'Ok',
        textColor: Colors.white,
        onPressed: () {
          // Perform some action
          // Navigator.pop(context);
        },
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  static showErrorWithAnimation(BuildContext context, String? message) {
    final overlay = Overlay.of(context);

    if (overlay == null) {
      return; // Exit if there is no Overlay associated with the current context
    }

    // Create a StatefulBuilder to handle the animation with TickerProvider
    final OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => _AnimatedSnackBar(message: message),
    );

    // Insert the overlay
    overlay.insert(overlayEntry);

    // Automatically remove the overlay after the animation finishes
    Future.delayed(const Duration(seconds: 3), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove(); // Safely remove after animation
      }
    });
  }
}

class _AnimatedSnackBar extends StatefulWidget {
  final String? message;

  const _AnimatedSnackBar({Key? key, this.message}) : super(key: key);

  @override
  _AnimatedSnackBarState createState() => _AnimatedSnackBarState();
}

class _AnimatedSnackBarState extends State<_AnimatedSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize AnimationController and Animation
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1), // Start from above the screen
      end: Offset.zero, // End at its original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10, // Adjust padding from the top
      left: 10,
      right: 10,
      child: Material(
        color: Colors.transparent,
        child: SlideTransition(
          position: _offsetAnimation, // Apply the animation to the position
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF1B75BC),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.message ?? 'Error',
                    style: TextStyles(context).googlePoppinsFontsForButtonText(
                      fontWeight: FontWeight.w200,
                      fontSize: 13,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (mounted) {
                      _controller.reverse(from: 20).then((_) {

                      });
                    }
                  },
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


