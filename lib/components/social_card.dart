import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialCard extends StatefulWidget {
  final Widget? title;
  final Widget? subtitle;
  final String? textIcon; // nerd fonts
  final TextStyle? textIconStyle;
  final Color? textIconColor;
  // final Color? hoverColor;
  final String? url;
  final Color bgcolor;

  const SocialCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.textIcon,
    this.textIconStyle,
    this.textIconColor,
    // this.hoverColor,
    this.url,
    required this.bgcolor,
  });

  @override
  State<SocialCard> createState() => _SocialCardState();
}

class _SocialCardState extends State<SocialCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launchUrlString(widget.url ?? '');
      },
      borderRadius: BorderRadius.circular(10),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onHover: (value) {
        setState(
          () {
            _isHovered = value;
          },
        );
      },
      child: AnimatedScale(
        scale: (_isHovered) ? 1.03 : 1,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 500),
        child: Card(
          // shape: _isHovered
          //     ? RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10),
          //         side: BorderSide(
          //             color: widget.hoverColor ?? Colors.transparent, width: 5))
          //     : RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10),
          //         side: const BorderSide(color: Colors.transparent, width: 5)),
          shadowColor: Colors.transparent,
          surfaceTintColor:
              ColorScheme.fromSeed(seedColor: widget.bgcolor).outline,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.bgcolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    widget.textIcon ?? '',
                    style: TextStyle(
                      fontFamily: 'Symbols-NF',
                      fontSize: 25,
                      color: widget.textIconColor,
                    ).merge(widget.textIconStyle),
                  ),
                ),
              ),
              ListTile(
                title: widget.title,
                subtitle: widget.subtitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
