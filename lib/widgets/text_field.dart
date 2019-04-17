import 'package:flutter/cupertino.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key key,
    this.image,
    this.obscureText,
    this.inputAction,
    this.maxHeight,
    this.scopeNode,
    this.currentNode,
    this.nextNode,
    @required this.placeholder,
    @required this.onSubmitted,
  }) : super(key: key);

  final Image image;

  final double maxHeight;

  final String placeholder;

  final bool obscureText;

  final FocusScopeNode scopeNode;

  final FocusNode currentNode;

  final FocusNode nextNode;

  final TextInputAction inputAction;

  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: maxHeight == null ? 45.0 : maxHeight,
      ),
      child: CupertinoTextField(
        autocorrect: false,
        obscureText: obscureText == null ? false : obscureText,
        clearButtonMode: OverlayVisibilityMode.editing,
        focusNode: currentNode,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFDDDDDD),
              width: 0.0,
            ),
          ),
        ),
        prefix: image,
        placeholder: placeholder,
        textInputAction:
            inputAction == null ? TextInputAction.next : inputAction,
        onEditingComplete: () {
          if (currentNode.hasFocus) {
            currentNode.unfocus();
          }

          if (nextNode != null) {
            scopeNode.requestFocus(nextNode);
          }
        },
        onSubmitted: (value) {
          onSubmitted(value);
        },
      ),
    );
  }
}
