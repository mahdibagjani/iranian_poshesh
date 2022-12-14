import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:iranian/core/consts/app_color.dart';

class BottomNavigationItem extends StatefulWidget {
  final String iconPath;
  final String title;
  final bool isSelected;
  final Function() onClick;
  const BottomNavigationItem(
      {Key? key,
      required this.iconPath,
      required this.onClick,
      required this.title,
      required this.isSelected})
      : super(key: key);

  @override
  _BottomNavigationItemState createState() => _BottomNavigationItemState();
}

class _BottomNavigationItemState extends State<BottomNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          widget.isSelected
              ? SizedBox(
                  width: 52,
                  height: 52,
                  child: ClipPolygon(
                      sides: 6,
                      borderRadius: 10.0, // Defaults to 0.0 degrees
                      rotate: 60.0, // Defaults to 0.0 degrees
                      boxShadows: [
                        PolygonBoxShadow(
                            color: AppColor.primaryColor, elevation: 2.0),
                      ],
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(13),
                        child: Image.asset(
                          widget.iconPath,
                          width: 24,
                          height: 24,
                          color: AppColor.primaryColor,
                        ),
                      )),
                )
              : Image.asset(
                  widget.iconPath,
                  width: 24,
                  height: 24,
                  color: AppColor.greyHintColor,
                ),
          if (widget.isSelected) const Spacer(),
          Text(
            widget.title,
            style: TextStyle(
                color: widget.isSelected
                    ? AppColor.primaryColor
                    : AppColor.greyHintColor,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
