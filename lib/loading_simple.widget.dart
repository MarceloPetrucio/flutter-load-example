import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingSimpleWidget extends StatelessWidget {
  final bool isVisible;
  final String subTitle;
  final Color background;
  final Color backgroundProgress;
  final double padding;
  final double ratio;
  final double circularProgressStroke;

  const LoadingSimpleWidget(
      {Key key, this.isVisible = false, this.subTitle = "", this.background = Colors.white, this.backgroundProgress = Colors.purple, this.padding, this.ratio, this.circularProgressStroke});

  @override
  Widget build(BuildContext context) {
    return _loadContainer();
  }

  Widget _loadContainer() {
    return new IgnorePointer(
      ignoring: !isVisible,
      child: Opacity(
        opacity: isVisible ? 1.0 : 0.0,
        child: new Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
            color: background,
          ),
          child: Material(
            color: Colors.transparent,
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: ratio ?? 36,
                  width: ratio ?? 36,
                  child: Padding(
                    padding: EdgeInsets.all(padding ?? 0),
                    child: new CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(backgroundProgress),
                      strokeWidth: circularProgressStroke ?? 4,
                    ),
                  ),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                ),
                (subTitle != "")
                    ? Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Opacity(
                            opacity: subTitle == "" ? 0.0 : 1.0,
                            child: new Text(
                              subTitle,
                            )),
                      )
                    : Container(),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
