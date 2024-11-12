import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:async';

class CustomPaintWithImage extends StatefulWidget {
  final String imageUrl;

  const CustomPaintWithImage({super.key, required this.imageUrl});

  @override
  _CustomPaintWithImageState createState() => _CustomPaintWithImageState();
}

class _CustomPaintWithImageState extends State<CustomPaintWithImage> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    _loadImage(widget.imageUrl);
  }

  Future<void> _loadImage(String url) async {
    final imageProvider = NetworkImage(url);
    final completer = Completer<ui.Image>();
    imageProvider.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(info.image);
      }),
    );

    final loadedImage = await completer.future;
    setState(() {
      image = loadedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(300, 300 * 0.6936416184971098), // Adjust width as needed
      painter: RPSCustomPainter(image: image),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  final ui.Image? image;

  RPSCustomPainter({this.image});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the custom shape path
    Path path = Path();
    path.moveTo(0, size.height * 0.08333333);
    path.cubicTo(0, size.height * 0.03730958, size.width * 0.02587948, 0,
        size.width * 0.05780347, 0);
    path.lineTo(size.width * 0.6416185, 0);
    path.lineTo(size.width, size.height * 0.7666667);
    path.lineTo(size.width * 0.7803468, size.height);
    path.lineTo(size.width * 0.05780347, size.height);
    path.cubicTo(size.width * 0.02587948, size.height, 0,
        size.height * 0.9626917, 0, size.height * 0.9166667);
    path.lineTo(0, size.height * 0.08333333);
    path.close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = const Color(0xffD9D9D9);

    // Clip the canvas to the shape and draw the image if available
    canvas.save();
    canvas.clipPath(path);

    if (image != null) {
      paintImage(
        canvas: canvas,
        rect: Rect.fromLTWH(0, 0, size.width, size.height),
        image: image!,
        fit: BoxFit.cover,
      );
    } else {
      // Draw the shape color if the image is not loaded yet
      canvas.drawPath(path, paint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
