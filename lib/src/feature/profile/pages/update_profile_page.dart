import 'package:fevent/src/config/constants/images.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:fevent/src/utils/helper/gap.dart';
import 'package:fevent/src/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              XImage.bgLogin,
              fit: BoxFit.cover,
            )),
            SafeArea(
              child: Column(
                children: [
                  GapHelper.h12,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Center(
                            child: Text("Update Profile",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: XColors.primary)),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: SizedBox(),
                        )
                      ],
                    ),
                  ),
                  GapHelper.h32,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: XInput(
                      value: "",
                      hintText: "Full name",
                      prefixIcon: Icon(
                        Icons.person,
                        color: XColors.primary,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: XInput(
                      value: "",
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.person,
                        color: XColors.primary,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: XInput(
                      value: "",
                      hintText: "Your phone",
                      prefixIcon: Icon(
                        Icons.person,
                        color: XColors.primary,
                      ),
                    ),
                  ),
                  GapHelper.h32,
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(271.w, 58.h),
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            // ignore: prefer_const_constructors
                            side: BorderSide(
                              color: XColors.primary,
                            )),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text("UPDATE",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: XColors.primary))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
