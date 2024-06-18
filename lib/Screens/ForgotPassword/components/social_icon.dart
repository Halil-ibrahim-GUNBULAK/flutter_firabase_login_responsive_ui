import 'package:flutter/material.dart';
import 'package:flutter_firabase_login_responsive_ui/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SocialIconButton extends StatefulWidget {
  const SocialIconButton({super.key,this.iconSrc,
    this.press});
  final String? iconSrc;
  final Function? press;
  @override
  State<SocialIconButton> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIconButton> {
  Color _containerColor=kPrimaryLightColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press as void Function()?,
      child: MouseRegion(
        onEnter: (_){
          setState(() {
            _containerColor=kPrimaryColor;
          });
        },
        onExit: (_){
          setState(() {
            _containerColor=Colors.white;
          });
        },
        child: AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 10),

          padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        border: Border.all(
        width: 2,
        color: _containerColor,)),
          duration: Duration(milliseconds: 300),
          child: SvgPicture.asset(
            widget.iconSrc!,
            height: 40,
            width: 40,
          ),
        ),
      ),
    );
  }
}


