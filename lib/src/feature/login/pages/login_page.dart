import 'package:fevent/src/config/constants/images.dart';
import 'package:fevent/src/feature/login/logic/login_bloc.dart';
import 'package:fevent/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: SizedBox.expand(
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Image.asset(
                    XImage.bgLogin,
                    fit: BoxFit.cover,
                  )),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: 75.h),
                          child: Image.asset(
                            XImage.logo,
                            width: 300.w,
                            height: 300.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      GapHelper.h16,
                      const Text("Đăng nhập",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          )),
                      GapHelper.h90,
                      GestureDetector(
                        onTap: () => context.read<LoginBloc>().onTapLogin(),
                        child: Container(
                          width: 273,
                          height: 56,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(0, 1),
                                  blurRadius: 5,
                                  spreadRadius: 0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                XImage.logoG,
                                width: 26.w,
                                height: 26.w,
                                fit: BoxFit.contain,
                              ),
                              GapHelper.w12,
                              const Text("Login with Google",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
