import 'package:flutter/material.dart';

enum MyUserOption {
  notification,
  feedback,
  event,
  donate,
  logout;

  String get labelOf {
    switch (this) {
      case MyUserOption.notification:
        return 'Notifications';
      case MyUserOption.feedback:
        return 'Feedback';
      case MyUserOption.event:
        return 'My Event';
      case MyUserOption.donate:
        return 'My Donate';
      case MyUserOption.logout:
        return 'Logout';
    }
  }

  void onTap() {
    switch (this) {
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
