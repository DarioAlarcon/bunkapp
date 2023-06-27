import 'package:bunkapp/models/belts.dart';
import 'package:bunkapp/models/data.dart';
import 'package:bunkapp/pags/belt_details.dart';
import 'package:bunkapp/widgets/animated_navigation_bar.dart';
import 'package:bunkapp/widgets/appbar_special.dart';
import 'package:bunkapp/widgets/buttonBar_special.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}): super(key:key);
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State<HomeScreen>{
  final _pageControler = PageController(viewportFraction: 0.75);

  double _currentPage = 0.0;
  double indexPage = 0.0;

  void _listener(){
    setState(() {
      _currentPage = _pageControler.page!;
      if (_currentPage >= 0 && _currentPage < 0.7) {
        indexPage = 0.0;
      }else if(_currentPage > 0.7 && _currentPage < 1.7){
        indexPage = 1.0;
      }else if(_currentPage > 1.7 && _currentPage < 2.7){
        indexPage = 2.0;
      }
    });
  }

  Color getColor(){
    late final Color color;
    if (_currentPage >= 0 && _currentPage < 0.7) {
        color = listShoes[0].listImage[0].color;
      }else if(_currentPage > 0.7 && _currentPage < 1.7){
        color = listShoes[1].listImage[0].color;
      }else if(_currentPage > 1.7 && _currentPage < 2.7){
        color = listShoes[2].listImage[0].color;
      }
      return color;
  }


  @override
  void initState() {
    _pageControler.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30,left: 10),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Text(
                              'Home',
                              style:  TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color:  getColor() ,
                              ),
                            ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                controller: _pageControler,
                itemCount: listShoes.length,
                itemBuilder: (context, index){
                  final belts = listShoes[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, _){
                        return BeltsDetailsScreen(belts: belts);
                      },
                      ),
                      );
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(right: index == indexPage ? 40 : 70, left: index == indexPage ? 40 : 50),
                      child: Transform.translate(
                        offset: Offset(index == indexPage ? 0 : 5, 0),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 350),
                              margin: EdgeInsets.only(
                                top: index == indexPage ? 10 : 50,
                                bottom: 30,
                                ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.white,
                              ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: 
                                    [

                                      const SizedBox(height: 8,),
                                      Text(
                                        belts.category,
                                        style: const TextStyle(
                                          fontSize: 28,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700
                                        ),
                                      ),
                                      const SizedBox(height: 4, ),
                                      Text(
                                        belts.price,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red,
                                        ),
                                      ),
                                      
                                    ],
                                    ),
                                ),
                                 Positioned(
                                  bottom: -10,
                                  right: -10,
                                  child: 
                                  Container(
                                    width: 100, height: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: belts.listImage[0].color,
                                    ),
                                    child: Icon(Icons.arrow_upward_sharp, size: 40,),
                                  )
                                  ),
                                Positioned(
                                  top: constraints.maxHeight*0.15,
                                  left: constraints.maxWidth*0.04,
                                  right: -constraints.maxWidth*0,
                                  bottom: -constraints.maxHeight*0.1,
                                  child: Hero(
                                    tag: belts.name,
                                    child: Image(
                                      image: AssetImage(
                                        belts.listImage[0].image,
                                      ),
                                    ),
                                  )
                                ),
                               
                              ],
                            ),
                                        );
                          }
                        ),
                      ),
                    ),
                  );
              }
            )
          ),
          /*Container(
            height: 100,
            padding: const EdgeInsets.all(20),
            child: SpecialButtonBar(color: getColor()),
          )*/
        ],
      ),
    );
  }
}