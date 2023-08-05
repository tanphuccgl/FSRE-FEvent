part of 'bottom_navigation_bloc.dart';

class BottomNavigationState extends Equatable {
  final PageIndex pageIndex;

  const BottomNavigationState({this.pageIndex = PageIndex.home});

  @override
  List<Object> get props => [
        pageIndex,
      ];

  BottomNavigationState copyWith({
    PageIndex? pageIndex,
  }) {
    return BottomNavigationState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}

enum PageIndex {
  home,
  scan,
  wallet,
  myUser,
}

extension PageIndexExt on PageIndex {
  String lableOf() {
    switch (this) {
      case PageIndex.home:
        return "Trang chủ";
      case PageIndex.scan:
        return "Scan QR";
      case PageIndex.wallet:
        return "Ví của tôi";

      case PageIndex.myUser:
        return "Người dùng";

      default:
        return '';
    }
  }

  Widget iconOf({bool isActived = false}) {
    switch (this) {
      case PageIndex.home:
        return Icon(
          Icons.home,
          size: 30,
          color: isActived ? XColors.primary : null,
        );
      case PageIndex.scan:
        return Icon(
          Icons.qr_code_scanner_sharp,
          size: 30,
          color: isActived ? XColors.primary : null,
        );
      case PageIndex.wallet:
        return Icon(
          Icons.wallet,
          size: 30,
          color: isActived ? XColors.primary : null,
        );

      case PageIndex.myUser:
        return Icon(
          Icons.person,
          size: 30,
          color: isActived ? XColors.primary : null,
        );
      default:
        return const Icon(Icons.emoji_emotions_outlined);
    }
  }

  Widget get page {
    switch (this) {
      case PageIndex.home:
        return const HomeWrapperPage();
      case PageIndex.scan:
        return const ScanWrapperPage();
      case PageIndex.wallet:
        return const WalletWrapperPage();

      case PageIndex.myUser:
        return const MyUserWrapperPage();

      default:
        return const NotFoundPage();
    }
  }
}
