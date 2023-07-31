import 'package:fevent/src/feature/my_user/cubit/profile_bloc.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MyUserOption {
  notification,
  feedback,
  event,
  donate,
  logout;

  String get labelOf {
    switch (this) {
      case MyUserOption.notification:
        return 'Thông báo';
      case MyUserOption.feedback:
        return 'Nhận xét';
      case MyUserOption.event:
        return 'Lịch sử tham gia sự kiện';
      case MyUserOption.donate:
        return 'Lịch sử quyên góp';
      case MyUserOption.logout:
        return 'Đăng xuất';
    }
  }

  void onTap(BuildContext context) {
    switch (this) {
      case MyUserOption.logout:
        context.read<ProfileBloc>().logout();
        break;
      case MyUserOption.event:
        XCoordinator.showMyEvent();

        break;

      default:
        break;
    }
  }

  IconData get iconOf {
    switch (this) {
      case MyUserOption.notification:
        return Icons.notifications;
      case MyUserOption.feedback:
        return Icons.feedback;
      case MyUserOption.event:
        return Icons.event;
      case MyUserOption.donate:
        return Icons.monetization_on;
      case MyUserOption.logout:
        return Icons.logout;
    }
  }
}
