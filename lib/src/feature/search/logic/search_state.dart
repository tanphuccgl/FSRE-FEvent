// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "search_bloc.dart";

enum TopicEnum {
  all,
  academic,
  sport,
  culture,
  community;

  String get nameOf {
    switch (this) {
      case all:
        return '';
      case academic:
        return 'ACADEMIC';
      case sport:
        return 'SPORT';
      case culture:
        return 'CULTURE';
      case community:
        return 'COMMUNITY';
    }
  }

  String get labelOf {
    switch (this) {
      case all:
        return 'Tất cả';
      case academic:
        return 'Học Thuật';
      case sport:
        return 'Thể Thao';
      case culture:
        return 'Văn hóa';
      case community:
        return 'Cộng đồng';
    }
  }
}

enum EventStatus {
  all,
  created,
  public,
  upcoming,
  ongoing,
  finished,
  cancelled;

  String get nameOf {
    switch (this) {
      case all:
        return '';
      case created:
        return 'CREATED';
      case public:
        return 'PUBLIC';
      case upcoming:
        return 'UPCOMING';
      case ongoing:
        return 'ONGOING';
      case finished:
        return 'FINISHED';
      case cancelled:
        return 'CANCELLED';
    }
  }

  String get labelOf {
    switch (this) {
      case all:
        return 'Tất cả';
      case created:
        return 'Vừa khởi tạo';
      case public:
        return 'Công khai';
      case upcoming:
        return 'Sắp diễn ra';
      case ongoing:
        return 'Đang diễn ra';
      case finished:
        return 'Đã kết thúc';
      case cancelled:
        return 'Đã hủy';
    }
  }
}

enum CategoryEnum {
  all,
  donate,
  free,
  ticket,
  job,
  cost;

  String get nameOf {
    switch (this) {
      case all:
        return '';
      case donate:
        return 'DONATION';
      case free:
        return 'FREE';
      case ticket:
        return 'TICKET';
      case job:
        return 'JOB';
      case cost:
        return 'COST';
    }
  }

  String get labelOf {
    switch (this) {
      case all:
        return 'Tất cả';
      case donate:
        return 'Sự kiện quyên góp';
      case free:
        return 'Sự kiện miễn phí';
      case ticket:
        return 'Sự kiện bán vé';
      case job:
        return 'Sự kiện tuyển dụng';
      case cost:
        return 'Sự kiện tính phí';
    }
  }
}

class SearchState extends Equatable {
  final TopicEnum topicEnum;
  final EventStatus eventEnum;
  final String title;
  final DateTime timeStart;
  final DateTime endStart;
  final CategoryEnum categoryEnum;
  final List<EventModel> list;
  const SearchState({
    this.topicEnum = TopicEnum.all,
    this.eventEnum = EventStatus.all,
    this.categoryEnum = CategoryEnum.all,
    this.title = "",
    required this.timeStart,
    required this.endStart,
    this.list = const [],
  });

  factory SearchState.ds() {
    return SearchState(
      timeStart: DateTime.now().subtract(const Duration(days: 1)),
      endStart: DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [
        topicEnum,
        eventEnum,
        title,
        timeStart,
        endStart,
        categoryEnum,
        list,
      ];

  SearchState copyWith({
    TopicEnum? topicEnum,
    EventStatus? eventEnum,
    String? title,
    DateTime? timeStart,
    DateTime? endStart,
    CategoryEnum? categoryEnum,
    List<EventModel>? list,
  }) {
    return SearchState(
      topicEnum: topicEnum ?? this.topicEnum,
      eventEnum: eventEnum ?? this.eventEnum,
      title: title ?? this.title,
      timeStart: timeStart ?? this.timeStart,
      endStart: endStart ?? this.endStart,
      categoryEnum: categoryEnum ?? this.categoryEnum,
      list: list ?? this.list,
    );
  }
}
