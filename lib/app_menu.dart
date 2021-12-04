import 'package:flutter/material.dart';
import 'package:responsive_layouts_w_riverpod/first_page.dart';
import 'package:responsive_layouts_w_riverpod/second_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// a map of ("page name", WidgetBuilder) pairs

final selectedPageProvider = StateProvider<String>((ref){
  return _availablePages.keys.first;
});

final _availablePages = <String, WidgetBuilder>{
  'First Page': (_) => FirstPage(),
  'Second Page': (_) => SecondPage(),
};

class AppMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final selectedPageName = watch(selectedPageProvider).state;
    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
      body: ListView(
        // Note: use ListView.builder if there are many items
        children: <Widget>[
          // iterate through the keys to get the page names
          for (var pageName in _availablePages.keys)
            PageListTile(
              selectedPageName: selectedPageName,
              pageName: pageName, onPressed: () {  },

            ),
        ],
      ),
    );
  }
}

class PageListTile extends StatelessWidget {
  const PageListTile({
     Key? key,
    required this.selectedPageName,
    required this.pageName,
    required this.onPressed,
  }) : super(key: key);
  final String selectedPageName;
  final String pageName;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // show a check icon if the page is currently selected
      // note: we use Opacity to ensure that all tiles have a leading widget
      // and all the titles are left-aligned
      leading: Opacity(
        opacity: selectedPageName == pageName ? 1.0 : 0.0,
        child: Icon(Icons.check),
      ),
      title: Text(pageName),
      onTap: onPressed,
    );
  }
}

