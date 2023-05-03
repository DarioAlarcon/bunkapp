import 'package:bunkapp/models/belts.dart';
import 'package:bunkapp/models/data.dart';
import 'package:bunkapp/pags/belt_details.dart';
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
            const SpecialAppBar(),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: List.generate(
                    listCategory.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        listCategory[index],
                        style:  TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: index == indexPage ? getColor() : Colors.white,
                        ),
                      ),)
                    )
                  ),
              ),
            ),
            Expanded(
              child: PageView.builder(
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
                      padding:  EdgeInsets.only(right: index == indexPage ? 30 : 60),
                      child: Transform.translate(
                        offset: Offset(index == indexPage ? 0 : 20, 0),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: EdgeInsets.only(
                                top: index == indexPage ? 30 : 50,
                                bottom: 30,
                                ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: 
                                    [
                                      Text(
                                        belts.category,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      const SizedBox(height: 8,),
                                      Text(
                                        belts.name,
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
                                          color: Colors.black,
                                        ),
                                      ),
                                      
                                    ],
                                    ),
                                ),
                                Positioned(
                                  top: constraints.maxHeight*0.2,
                                  left: constraints.maxWidth*0.05,
                                  right: -constraints.maxWidth*0.16,
                                  bottom: constraints.maxHeight*0.2,
                                  child: Hero(
                                    tag: belts.name,
                                    child: Image(
                                      image: AssetImage(
                                        belts.listImage[0].image,
                                      ),
                                    ),
                                  )
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Material(
                                    color: belts.listImage[0].color,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16)
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: InkWell(
                                      onTap: () {},
                                      child: const SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Icon(
                                          Icons.arrow_upward,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  )
                                  )
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
          Container(
            height: 120,
            padding: const EdgeInsets.all(20),
            child: SpecialButtonBar(color: getColor()),
          )
        ],
      ),
    );
  }
}