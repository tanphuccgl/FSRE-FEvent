import 'package:fevent/src/feature/float_bottom_navigation/cubit/bottom_navigation_bloc.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:fevent/src/utils/helper/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatBottomNavigation extends StatelessWidget {
  const FloatBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 0),
                blurRadius: 10,
              ),
            ],
          ),
          constraints: BoxConstraints(maxHeight: 100.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(PageIndex.values.length, (i) {
              final element = PageIndex.values[i];

              return Flexible(
                child: GestureDetector(
                  onTap: () =>
                      context.read<BottomNavigationBloc>().onItemTapped(i),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(
                      color: state.pageIndex == element
                          ? XColors.primary.withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius: BorderHelper.r8,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        element.iconOf(isActived: state.pageIndex == element),
                        Text(element.lableOf(),
                            style: TextStyle(
                                fontSize: 12.018217086791992,
                                fontWeight: FontWeight.w500,
                                color: state.pageIndex == element
                                    ? XColors.primary
                                    : Colors.black)),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
      buildWhen: (p, c) => p.pageIndex != c.pageIndex,
    );
  }
}
