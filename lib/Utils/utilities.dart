import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:h_office/Helper/theme_helper.dart';

import 'dart:math' as math;
import 'math_utils.dart';

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    Key? key,
    this.initialOpen,
    required this.distance,
    required this.children,
  }) : super(key: key);

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          color: appTheme.primaryTheme,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: getSize(35, context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            heroTag: "a1",
            onPressed: _toggle,
            child: Icon(
              Icons.add,
              size: getSize(40, context),
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    Key? key,
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  }) : super(key: key);

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          top: 100.0 + offset.dx,
          bottom: -330.00 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: theme.accentColor,
      elevation: 4.0,
      child: IconTheme.merge(
        data: theme.accentIconTheme,
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}

// SpeedDial buildSpeedDial() {
//   return SpeedDial(
//     animatedIcon: AnimatedIcons.menu_close,
//     animatedIconTheme: IconThemeData(size: 28.0),
//     backgroundColor: Colors.green[900],
//     visible: true,
//     curve: Curves.bounceInOut,
//     children: [
//       SpeedDialChild(
//         child: Icon(Icons.chrome_reader_mode, color: Colors.white),
//         backgroundColor: Colors.green,
//         onTap: () => print('Pressed Read Later'),
//         label: 'Read',
//         labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
//         labelBackgroundColor: Colors.black,
//       ),
//       SpeedDialChild(
//         child: Icon(Icons.create, color: Colors.white),
//         backgroundColor: Colors.green,
//         onTap: () => print('Pressed Write'),
//         label: 'Write',
//         labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
//         labelBackgroundColor: Colors.black,
//       ),
//       SpeedDialChild(
//         child: Icon(Icons.laptop_chromebook, color: Colors.white),
//         backgroundColor: Colors.green,
//         onTap: () => print('Pressed Code'),
//         label: 'Code',
//         labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
//         labelBackgroundColor: Colors.black,
//       ),
//     ],
//   );
// }

Container getFunnelContainer(
    {required BuildContext context,
    required double height,
    required double width,
    required String image,
    required String text}) {
  return Container(
    height: getSize(height, context),
    width: getSize(width, context),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
      ),
    ),
    alignment: Alignment.center,
    child: Text(text),
  );
}

getTextItems({required String title, required String text}) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: title,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        TextSpan(
          text: text,
          style: TextStyle(),
        ),
      ],
    ),
  );
}
