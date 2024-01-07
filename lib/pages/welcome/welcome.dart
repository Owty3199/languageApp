import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:language_app/pages/welcome/bloc/welcome_events.dart';
import 'package:language_app/pages/welcome/bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state){
            return  Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            alignment:Alignment.topCenter,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index){
                  state.page = index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                },
                children: [
                  _page(
                    1,
                    context,
                    "next",
                    "First see Learning",
                    "Forget about a for of paper all knowledg in on Learning",
                    "assets/images/reading.png",
                  ),
                   _page(
                    2,
                    context,
                    "next",
                    "Connect With Everyone",
                    "always Keep In Touch with your tutor & friends. Let's get connected",
                    "assets/images/boy.png",
                  ),
                   _page(
                    3,
                    context,
                    "Get Started for Free",
                    "Always Fascinated Learning",
                    "Anywhere, anytime. The time is at your discretion so study whenever you want",
                    "assets/images/man.png",
                  ),
                ],
              ),

              Positioned(
                bottom: 100.h,
                child: DotsIndicator(
                  position: state.page,
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    color: Colors.blue,
                    activeColor: Colors.purple ,
                    size: const Size.square(8.0),
                    activeSize: const Size(18.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                  ),
                ),
              )

            ],
          ),
        );
            
          },
        )
        
      ),
    );
  

}

Widget _page(int index, BuildContext context, String buttonName, String title, String subtiltle, String imagePath) {
  return SingleChildScrollView(
    child: Column(
                      children: [
                        SizedBox(
                          width: 345.w,
                          height: 345.w,
                          child:  Image.asset(imagePath),
                        ),
                        Container(
                          child: Text(
                            title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Container(
                          width: 375.w,
                          padding: EdgeInsets.only(left: 30.w, right: 30.w),
                          child: Text(
                            subtiltle,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal
                                ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            if(index<3){
                              pageController.animateToPage(
                                index,
                                 duration : const Duration(milliseconds: 1000),
                                  curve: Curves.easeInCubic,
                                  );
  
                            }else{
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'home page',)));
                                 Navigator.of(context).pushNamedAndRemoveUntil("signIn", (route) => false);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 100.h, left: 25.w, right: 25.w),
                            width: 325.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.purple, Colors.blue],
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(15.w)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(10, 10),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                buttonName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
  );
}


}