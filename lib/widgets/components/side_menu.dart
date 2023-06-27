import 'package:bunkapp/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color(0xff17203a),
        child: SafeArea(
          child: Column(
            children: [
              HeaderOfBar(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 32,
                  bottom: 16
                ),
                child: Text(
                  'Browse'.toUpperCase(),
                  style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenus.map(
                (menu) => menuTile(
                menu: menu,
                riveonInit: (artboard) {
                   },
                press: (){
                 
                },
                isActive: false,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class menuTile extends StatelessWidget {
  const menuTile({
    super.key, 
    required this.menu, 
    required this.press, 
    required this.riveonInit, 
    required this.isActive,
  });

final RiveAssets menu;
final VoidCallback press;
final ValueChanged<Artboard> riveonInit;
final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        ListTile(
          onTap: press,
          leading: SizedBox(
            height: 34,
            width: 34,
            child: RiveAnimation.asset(
              menu.src,
              artboard: menu.artboard,
              onInit: riveonInit,
            )
          ),
          title: Text(
            menu.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class HeaderOfBar extends StatelessWidget {
  const HeaderOfBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        "Bunkapp",
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        "shotokan",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class RiveAssets{
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;
  RiveAssets(this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input
  });
  set setInput(SMIBool status){
    input=status;
  }
}

List<RiveAssets> sideMenus=[
  RiveAssets(
    'assets/riveAssets/icons_animated.riv', 
    artboard: "HOME", 
    stateMachineName: "HOME_interactivity", 
    title: "home"
  ),
  RiveAssets(
    'assets/riveAssets/icons_animated.riv', 
    artboard: "SEARCH", 
    stateMachineName: "SEARCH_interactivity", 
    title: "Search"
  ),
  RiveAssets(
    'assets/riveAssets/icons_animated.riv', 
    artboard: "HOME", 
    stateMachineName: "HOME_interactivity", 
    title: "home"
  ),
];

