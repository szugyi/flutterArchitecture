import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/flavor.dart';

import 'device_info_dialog.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  final FlavorConfig config;

  FlavorBanner({@required this.child, @required this.config});

  @override
  Widget build(BuildContext context) {
    if (config.isProduction()) return child;

    return Stack(
      children: <Widget>[child, _buildBanner(context)],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: 50,
          height: 50,
          child: CustomPaint(
            painter: BannerPainter(
                message: config.name,
                textDirection: Directionality.of(context),
                layoutDirection: Directionality.of(context),
                location: BannerLocation.topStart,
                color: config.color),
          ),
        ),
        onDoubleTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return DeviceInfoDialog(config: config);
              });
        });
  }
}
