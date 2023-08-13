import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class MenuButton extends HookWidget {
  const MenuButton({
    required this.path,
    required this.title,
    super.key,
  });

  final String path;
  final String title;

  @override
  Widget build(BuildContext context) {
    final hover = useState(false);
    return FittedBox(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => hover.value = true,
        onExit: (_) => hover.value = false,
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).go(path);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: Text(
            title,
            style: TextStyle(
                decoration: hover.value ? TextDecoration.underline : null,
                fontSize: 48,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
