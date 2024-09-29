import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
  static appBar() {
    return AppBar(
        backgroundColor: const Color(0xFFB81448),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Image.asset('assets/images/releans_logo.png'));
          },
        ),
        title: Row(
          children: [
            Text(
              'USD 95,447.90',
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
            ),
            SizedBox(width: 2.w),
            Container(
                padding:
                EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: Color(0xFFFFC107),
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Text(
                  'Top Up',
                  style: TextStyle(color: Colors.black, fontSize: 15.sp),
                )),
            Spacer(),
            Icon(
              Icons.headphones,
              color: Colors.white,
            ),
            SizedBox(width: 1.w),
            Text(
              'PIN 18593',
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
            ),
          ],
        ));
  }
}
