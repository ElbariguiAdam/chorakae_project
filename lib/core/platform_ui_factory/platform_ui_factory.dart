import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformWidgetFactory {
  Widget createButton(String label, VoidCallback onPressed);
  Widget createAlert(String message, BuildContext context);
  Widget createBottomBar(BuildContext context);
  Widget createContextMEnu(BuildContext context);
}

// Android-specific UI Factory
class AndroidWidgetFactory implements PlatformWidgetFactory {
  @override
  Widget createButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: Text(label),
    );
  }

  @override
  Widget createAlert(String message, BuildContext context) {
    return Dialog(
      alignment: Alignment.topCenter,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Text(r"$100.0"),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("ahmed"),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text("0"),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Text("Mercides")),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text("distance from u"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Image(
                      image: NetworkImage(
                          "https://th.bing.com/th/id/OIP.eRmd_gWtfl96gKKW9q2iDAHaHa?rs=1&pid=ImgDetMain"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("confirm"),
                    ),
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("confirm"))),
                ],
              )
            ],
          ),
        ),
      ),
    );
    //  AlertDialog(
    //   title: const Text("Android Alert"),
    //   content: Text(message),
    //   actions: [
    //     TextButton(
    //       onPressed: () => Navigator.pop(context),
    //       child: const Text("OK"),
    //     ),
    //   ],

    // );
  }

  @override
  Widget createBottomBar(BuildContext context) {
    int num = 0;
    Widget getSelectedScreen(int num) {
      switch (num) {
        case 0:
          return Container(
            color: Colors.amber,
          );
        case 1:
          return Container(
            color: Colors.red,
          );
        case 2:
          return Container(
            color: Colors.blue,
          );
        default:
          return Container();
      }
    }

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profil",
          ),
        ]),
        body: getSelectedScreen(num));
  }

  @override
  Widget createContextMEnu(BuildContext context) {
    return CupertinoContextMenu(
      actions: <Widget>[
        CupertinoContextMenuAction(
          trailingIcon: CupertinoIcons.heart,
          child: const Text('Action 1'),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoContextMenuAction(
          trailingIcon: CupertinoIcons.share,
          child: const Text('Action 2'),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoContextMenuAction(
          trailingIcon: CupertinoIcons.delete,
          child: const Text('Action 3'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
      child: Container(
        color: Colors.amber,
      ),
    );
  }
}

// iOS-specific UI Factory
class IOSWidgetFactory implements PlatformWidgetFactory {
  @override
  Widget createButton(String label, VoidCallback onPressed) {
    return CupertinoButton(
      color: CupertinoColors.activeBlue,
      onPressed: onPressed,
      child: Text(label),
    );
  }

  @override
  Widget createAlert(String message, BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("iOS Alert"),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    );
  }

  @override
  Widget createBottomBar(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return Container(
              color: Colors.amber,
            );
          case 1:
            return Container(
              color: Colors.red,
            );
          case 2:
            return Container(
              color: Colors.blue,
            );
          default:
            return Container();
        }
      },
    );
  }

  @override
  Widget createContextMEnu(BuildContext context) {
    return Container();
  }
}

PlatformWidgetFactory getPlatformFactory(BuildContext context) {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    return IOSWidgetFactory();
  } else {
    return AndroidWidgetFactory();
  }
}
