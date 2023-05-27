import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/home/fooddetail.dart';
import 'package:test/home/fooddetailkottu.dart';
import 'package:test/cart/widgets/appcolumn.dart';
import 'package:test/cart/widgets/bigtext.dart';
import 'package:test/cart/widgets/icontext.dart';
import 'package:test/cart/widgets/smalltext.dart';

import 'package:test/utility/dimentions.dart';

class FoodPageBody extends StatefulWidget {

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController =PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 3,
              itemBuilder: (context,position){
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 3,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: Colors.blue,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Today"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Special",),
              ),
            ],
          ),
        ),

        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index,){
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height10/5),
                child: Row(
                  children: [
                    Container(width:Dimensions.listviewImgSize, height: Dimensions.listviewImgSize,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white, image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage("assets/chicken-rice.jpg")
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimensions.listviewTextContSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>TodayFoodDetail() ));
                                },
                                child: BigText(text: 'Chicken Fried Rice',),
                              ),

                              SmallText(text: "Special Ingredients"),
                              SizedBox(width: Dimensions.width10,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(icon: Icons.person,
                                      text: "1 Person",
                                      iconColor: Colors.yellow),
                                  SizedBox(width: 2,),
                                  SmallText(text: "Rs.450.00",),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index,){
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height15),
                child: Row(
                  children: [
                    Container(width:Dimensions.listviewImgSize, height: Dimensions.listviewImgSize,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white, image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage("assets/nd.jpg")
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimensions.listviewTextContSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: (){

                                },
                                child: BigText(text: 'Noodles',),
                              ),
                              SmallText(text: "with chicken and chili paste"),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(icon: Icons.person,
                                      text: "1 Person",
                                      iconColor: Colors.yellow),
                                  SizedBox(width: 2,),
                                  SmallText(text: "Rs.350.00",),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index,){
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height15),
                child: Row(
                  children: [
                    Container(width:Dimensions.listviewImgSize, height: Dimensions.listviewImgSize,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white, image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage("assets/kottu-1.jpg")
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimensions.listviewTextContSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>TodayFoodDetailkottu() ));
                                },
                                child: BigText(text: 'Kottu',),
                              ),
                              SmallText(text: "Special Ingredients"),
                              SizedBox(width: Dimensions.width10,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(icon: Icons.person,
                                      text: "1 Person",
                                      iconColor: Colors.yellow),
                                  SizedBox(width: 2,),
                                  SmallText(text: "Rs.500.00",),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index ==_currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index ==_currPageValue.floor()-1) {
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor), 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin:  EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven?Color(0xFF69c5df):Color(0XFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/kottu-1.jpg"
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width10/2, right: Dimensions.width30*2,bottom: Dimensions.height10*5,),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color:Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)
                    ),
                    BoxShadow(color: Colors.white,
                        offset: Offset(-5, 0)
                    ),
                    BoxShadow(color: Colors.white,
                        offset: Offset(5, 0)
                    ),
                  ]
              ),
              child: AppColumn(text: "Reviews"),
            ),
          ),
        ],
      ),
    );
  }
}
