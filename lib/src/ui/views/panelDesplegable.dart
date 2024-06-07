
/*

PRUEBAS


import 'package:flutter/material.dart';

class CustomSlidingPanel extends StatefulWidget {
  final Widget panel;
  final Widget body;
  final double minHeight;
  final double maxHeight;

  const CustomSlidingPanel({
    Key? key,
    required this.panel,
    required this.body,
    this.minHeight = 30,
    this.maxHeight = 300,
  }) : super(key: key);

  @override
  _CustomSlidingPanelState createState() => _CustomSlidingPanelState();
}

class _CustomSlidingPanelState extends State<CustomSlidingPanel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _heightAnimation = Tween<double>(
      begin: widget.minHeight,
      end: widget.maxHeight,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.body,
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: _heightAnimation.value,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(245, 222, 179, 130),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                ),
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_controller.isDismissed) {
                          _controller.forward();
                        } else {
                          _controller.reverse();
                        }
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: Icon(
                          _controller.isDismissed
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 30,
                        ),
                      ),
                    ),
                    widget.panel,
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
*/

/*
import 'package:aplicacion_basica_curso/src/data/remote/imagenes_data.dart';
import 'package:flutter/material.dart';
class CustomSlidingPanel extends StatefulWidget {
  final Widget panel;
  final Widget body;
  final double minHeight;
  final double maxHeight;

  const CustomSlidingPanel({
    Key? key,
    required this.panel,
    required this.body,
    this.minHeight = 30,
    this.maxHeight = 300,
  }) : super(key: key);

  @override
  _CustomSlidingPanelState createState() => _CustomSlidingPanelState();
}

class _CustomSlidingPanelState extends State<CustomSlidingPanel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _heightAnimation = Tween<double>(
      begin: widget.minHeight,
      end: widget.maxHeight,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.body,
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: _heightAnimation.value,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(245, 222, 179, 130),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                ),
                child: SingleChildScrollView(
                  child: widget.panel,
                ),
              ),
            );
          },
        ),
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Container(
            child: Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_controller.isDismissed) {
                        _controller.forward();
                      } else {
                        _controller.reverse();
                      }
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Icon(
                        _controller.isDismissed
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        size: 30,
                      ),
                    ),
                  ),
                ),

                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(4, (index) {
                    final imageDataIndex = index ~/ 4;
                    return Card(
                      elevation: 3,
                      child: Image.asset(
                        images[imageDataIndex].otrasImagenes[index % 4],
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}

*/