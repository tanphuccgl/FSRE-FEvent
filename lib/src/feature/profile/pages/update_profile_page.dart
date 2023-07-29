import 'package:fevent/src/config/constants/images.dart';
import 'package:fevent/src/feature/profile/logic/update_profile_bloc.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:fevent/src/utils/helper/gap.dart';
import 'package:fevent/src/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileBloc(),
      child: BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
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
                  SafeArea(
                    child: Column(
                      children: [
                        GapHelper.h12,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              const Expanded(
                                flex: 8,
                                child: Center(
                                  child: Text("Cập nhật hồ sơ",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                          color: XColors.primary)),
                                ),
                              ),
                              const Flexible(
                                flex: 1,
                                child: SizedBox(),
                              )
                            ],
                          ),
                        ),
                        GapHelper.h32,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: XInput(
                            value: state.name,
                            onChanged: (value) => context
                                .read<UpdateProfileBloc>()
                                .onChangedName(value),
                            hintText: "Họ và tên",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: XColors.primary,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: XInput(
                            value: state.profile?.account?.email ?? "",
                            hintText: "Email",
                            readOnly: true,
                            fillColor: Colors.grey.withOpacity(0.15),
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: XColors.primary,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: XInput(
                            value: state.phone,
                            hintText: "Số điện thoại của bạn",
                            onChanged: (value) => context
                                .read<UpdateProfileBloc>()
                                .onChangedPhone(value),
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: XColors.primary,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: XInput(
                            value: state.major,
                            onChanged: (value) => context
                                .read<UpdateProfileBloc>()
                                .onChangedMajor(value),
                            hintText: "Ngành học",
                            prefixIcon: const Icon(
                              Icons.menu_book_rounded,
                              color: XColors.primary,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: XInput(
                            value: state.course,
                            onChanged: (value) => context
                                .read<UpdateProfileBloc>()
                                .onChangedCourse(value),
                            hintText: "Khóa học",
                            prefixIcon: const Icon(
                              Icons.work,
                              color: XColors.primary,
                            ),
                          ),
                        ),
                        GapHelper.h32,
                        ElevatedButton(
                            onPressed: () => context
                                .read<UpdateProfileBloc>()
                                .update(context),
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
                            child: const Text("Cập nhật",
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
        },
      ),
    );
  }
}
