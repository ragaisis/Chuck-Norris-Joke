import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  final VoidCallback onClearPressed;
  final ValueChanged<String> onQuerySubmitted;
  final ValueChanged<bool> onFocusChanged;
  final String hintText;

  SearchFieldWidget({
    Key? key,
    required this.hintText,
    required this.onClearPressed,
    required this.onFocusChanged,
    required this.onQuerySubmitted,
  }) : super(key: key);

  final TextEditingController textArea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Focus(
        onFocusChange: (hasFocus) {
          print("has focus status: ${hasFocus}");
          onFocusChanged(hasFocus);
        },
        child: TextField(
          controller: textArea,
          onSubmitted: (String query) {
            print("search query: $query");
            onQuerySubmitted.call(query);
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: () {
                  textArea.clear();
                  onClearPressed.call();
                },
                icon: Icon(Icons.cancel),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              hintText: hintText,
              fillColor: Color.fromRGBO(250, 250, 250, 0.93),
              focusedBorder: getOutlineInputBorder(),
              filled: true,
              enabledBorder: getOutlineInputBorder(),
              border: getOutlineInputBorder()),
        ));
  }

  OutlineInputBorder getOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent, width: 0.0),
        borderRadius: const BorderRadius.all(const Radius.circular(10.0)));
  }
}
