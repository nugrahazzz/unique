import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:unique/core/constant/assets/image_path.dart';
import 'package:unique/core/constant/styles/colors.dart';

class VerticalSliderThumb extends SliderComponentShape {
  final double thumbRadius;
  final double sliderValue;
  final double rotationAngle;
  final bool flipX;
  ui.Image? _image; // Change to nullable to check if image is loaded

  VerticalSliderThumb({
    required this.thumbRadius,
    required this.sliderValue,
    required this.flipX,
    this.rotationAngle = 0.0, // Default to no rotation
  }) {
    // Preload the image when the class is instantiated
    _loadImage();
  }

  // Helper method to load the image and store it in _image
  void _loadImage() {
    AssetImage(ImagePath.triangle).resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool synchronousCall) {
        _image = info.image;
        // Request a repaint when the image has finished loading
      }),
    );
  }

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final canvas = context.canvas;

    // Draw fallback shape if image is not loaded yet
    if (_image == null) {
      // Draw a fallback circle
      final paint = Paint()..color = AppColors.color2.withOpacity(0.5);
      canvas.drawCircle(center, thumbRadius, paint);
      return; // Skip drawing the image and text until the image is loaded
    }

    // Save the canvas state for the image
    canvas.save();

    // Translate and rotate for the image
    canvas.translate(center.dx, center.dy);
    canvas.rotate(math.pi / 2 + rotationAngle); // Adding 90 degrees for vertical
    canvas.translate(-center.dx, -center.dy);

    final double rectSize = thumbRadius * 2.6; // Set a size for the rectangle
    final Rect rect = Rect.fromCenter(
      center: center,
      width: rectSize,
      height: rectSize,
    );

    final paint = Paint()
      ..colorFilter = ColorFilter.mode(AppColors.color2, BlendMode.srcIn); // Apply cyan color filter

    // Draw the preloaded image as thumb
    canvas.drawImageRect(_image!, Offset.zero & Size(_image!.width.toDouble(), _image!.height.toDouble()), rect, paint);

    // Restore the canvas state after drawing the image
    canvas.restore();

    // Save the canvas state again to apply rotation for the text
    canvas.save();

    // Translate for the text
    canvas.translate(center.dx, center.dy);

    // Rotate the text depending on whether the slider is vertical or horizontal
    if (flipX == true) {
      canvas.rotate(math.pi + rotationAngle); // Rotate by 180 degrees for horizontal
    } else {
      canvas.rotate(math.pi - rotationAngle); // Rotate by 180 degrees for horizontal
    }
    canvas.translate(-center.dx, -center.dy);

    // Draw value text in the middle of the image
    TextSpan valueSpan = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius * 0.75, // Adjusted size for the value
        fontWeight: FontWeight.bold,
        color: Colors.white.withOpacity(0.5), // Value color
      ),
      text: sliderValue.round().toString(),
    );

    TextPainter valuePainter = TextPainter(
      text: valueSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    valuePainter.layout();
    Offset textOffset = Offset(
      center.dx - (valuePainter.width / 2),
      center.dy - (valuePainter.height / 2),
    );

    // Paint value text on canvas
    valuePainter.paint(canvas, textOffset);

    // Restore the canvas state after painting the text
    canvas.restore();
  }
}
