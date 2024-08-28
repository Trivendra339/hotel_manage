import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/routes/routes_name.dart';

class CustomNavBar extends StatelessWidget {

  AnimationController animationController;




  CustomNavBar({required this.animationController,

  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(seconds: 1),
        curve: Curves.easeOut,
        child: Container(
          height: 60,
          margin: EdgeInsets.only(bottom: 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              boxShadow: [BoxShadow(
                  color: Colors.black.withAlpha(20),
                  blurRadius: 20,
                  spreadRadius: 10),]
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              IconButton(onPressed: (){Navigator.pushNamed(context, MyRouteName.TenantHomeScreen);}, icon: Icon(Icons.home_outlined))
            ],
          ),
        )
    );
  }
}

// return Container(
//   height: 90,
//   child: AnimatedBuilder(
//     animation: animationController,
//     builder: (context,child)=>Container(
//         height: 60,
//         margin: EdgeInsets.only(right: 24,left: 24,bottom: 24),
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [BoxShadow(
//                 color: Colors.black.withAlpha(20),
//                 blurRadius: 20,
//                 spreadRadius: 10),]
//         ),
//         child: Row(crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(onPressed: backButton, icon: Icon(Icons.arrow_back)),
//             IconButton(onPressed: home_outlinedButtn, icon: Icon(Icons.home_outlined))
//           ],
//         ),
//       ),
//
//   ),
// );


// Widget CustomNavBar(){
//   return AnimatedContainer(duration: Duration(seconds: 1),
//       curve: Curves.easeOut,
//       child: Container(
//         height: 60,
//         margin: EdgeInsets.only(right: 24,left: 24,bottom: 24),
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [BoxShadow(
//                 color: Colors.black.withAlpha(20),
//                 blurRadius: 20,
//                 spreadRadius: 10),]
//         ),
//         child: Row(crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
//             IconButton(onPressed: (){}, icon: Icon(Icons.home_outlined))
//           ],
//         ),
//       )
//   );
// }