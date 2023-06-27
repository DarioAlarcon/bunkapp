import 'package:bunkapp/widgets/button_special.dart';
import 'package:bunkapp/widgets/tranSpecial.dart';
import 'package:flutter/material.dart';
import 'package:bunkapp/models/belts.dart';

class BeltsDetailsScreen extends StatefulWidget{
  const BeltsDetailsScreen({Key? key, required this.belts}) : super(key: key);
  final Belts belts;
  
  @override
  State<StatefulWidget> createState() {
    return _BeltsDetailsScreen();
  }
}

class _BeltsDetailsScreen extends State<BeltsDetailsScreen>{

int valueIndexColor = 0;

 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -size.height * 0.15,
            right: -size.height * 0.2,
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds:  250),
              tween: Tween(begin: 0, end: 1),
              builder: (context, value, __) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: value * (size.height * 0.5),
                  width: value * (size.height * 0.5),
                  decoration: BoxDecoration(
                    color: widget.belts.listImage[valueIndexColor].color,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(126)
                  ),
                  );
              }
            ),
              ),
              Positioned(
                top: kToolbarHeight,
                left: 16,
                right: 16,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Specialbutton(
                    ontap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.black,
                    ),
                    ),
                    ],
                  ),
                ),
                Positioned(
                  top: size.height * 0.20,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: FittedBox(
                      child: Text(
                        widget.belts.category,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[100]
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.22,
                  right: size.height * 0.07,
                  left: size.height * 0.07,
                  child: Hero(
                    tag: widget.belts.name,
                    child: Image(
                      image: AssetImage(
                        widget.belts.listImage[valueIndexColor].image,
                      ),
                      ),
                  ),
                  ),
                Positioned(
                  top: size.height * 0.6,
                  left: 16,
                  right: 16,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Transition(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                const SizedBox(height: 28),
                                Text(
                                  widget.belts.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Transition(
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              widget.belts.listImage[valueIndexColor].description,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300
                                
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      )
                    ],
                  )
                  ), 
                  Positioned(
                    top: size.height * 0.84,
                    left: 16,
                    right: 16,
                    child: Row(
                      children: [
                        Transition(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                ' ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16
                                ),
                              ),
                            const SizedBox(height: 8,),
                            Row(
                              
                              children: List.generate(
                                widget.belts.listImage.length, 
                                (index) => GestureDetector(
                                  onTap: (){
                                    valueIndexColor = index;
                                    setState(() { });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    height: 30,
                                    width:  30,
                                    decoration: BoxDecoration(
                                      color: widget.belts.listImage[index].color,
                                      shape: BoxShape.circle,
                                      border:  index == valueIndexColor ?
                                              Border.all(color: Colors.white, width: 2):
                                              null,
                                    ),
                                  ),
                                ),
                                ),
                            ), 
                            ],
                          ),
                        )
                      
                      ],
                    )
                    ) 
              ],
    ),
          );
        }

}