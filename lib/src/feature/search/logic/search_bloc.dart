import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:fevent/src/utils/helper/radius.dart';
import 'package:fevent/src/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "search_state.dart";

class SearchBloc extends Cubit<SearchState> {
  SearchBloc() : super(SearchState.ds()) {
    getEvent();
  }

  Domain get _domain => GetIt.I<Domain>();
  void changedTitle(String value) {
    emit(state.copyWith(title: value));
  }

  void changedTopic(TopicEnum value) {
    emit(state.copyWith(topicEnum: value));
  }

  void changedEvent(EventStatus value) {
    emit(state.copyWith(eventEnum: value));
  }

  void changedCategory(CategoryEnum value) {
    emit(state.copyWith(categoryEnum: value));
  }

  void showDialogFilter(BuildContext context1) {
    showDialog(
        barrierDismissible: false,
        context: context1,
        builder: (_) {
          return BlocProvider.value(
            value: context1.read<SearchBloc>(),
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return AlertDialog(
                  title: const Text("Bộ lọc"),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  content: ListView(
                    shrinkWrap: true,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Tên sự kiện",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      XInput(
                        value: state.title,
                        hintText: "Họ và tên",
                        onChanged: (value) =>
                            context.read<SearchBloc>().changedTitle(value),
                        filled: true,
                        fillColor: XColors.bgGrey.withOpacity(0.5),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: XColors.bgGrey, width: 1),
                          borderRadius: BorderHelper.r10,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Thời gian:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () => context
                                .read<SearchBloc>()
                                .showDateTimePicker(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.grey)),
                              child: Text(formatDateTime(state.timeStart)),
                            ),
                          ),
                          const Icon(Icons.arrow_forward),
                          GestureDetector(
                            onTap: () => context
                                .read<SearchBloc>()
                                .showDateTimePicker1(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.grey)),
                              child: Text(formatDateTime(state.endStart)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Topic:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DropdownButton<TopicEnum>(
                        value: state.topicEnum,
                        isExpanded: true, // Để dropdown có width dài hơn
                        isDense: false,
                        onChanged: (TopicEnum? newValue) {
                          if (newValue == null) return;
                          context.read<SearchBloc>().changedTopic(newValue);
                        },
                        items: TopicEnum.values.map((TopicEnum value) {
                          return DropdownMenuItem<TopicEnum>(
                            value: value,
                            child: Text(value.labelOf),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Trạng thái:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DropdownButton<EventStatus>(
                        value: state.eventEnum,
                        isExpanded: true, // Để dropdown có width dài hơn
                        isDense: false,
                        onChanged: (EventStatus? newValue) {
                          if (newValue == null) return;
                          context.read<SearchBloc>().changedEvent(newValue);
                        },
                        items: EventStatus.values.map((EventStatus value) {
                          return DropdownMenuItem<EventStatus>(
                            value: value,
                            child: Text(value.labelOf),
                          );
                        }).toList(),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Loại sự kiện:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DropdownButton<CategoryEnum>(
                        value: state.categoryEnum,
                        isExpanded: true, // Để dropdown có width dài hơn
                        isDense: false,
                        onChanged: (CategoryEnum? newValue) {
                          if (newValue == null) return;
                          context.read<SearchBloc>().changedCategory(newValue);
                        },
                        items: CategoryEnum.values.map((CategoryEnum value) {
                          return DropdownMenuItem<CategoryEnum>(
                            value: value,
                            child: Text(value.labelOf),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  actions: [
                    Column(
                      children: [
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderHelper.r10),
                                  maximumSize: const Size(250, 40)),
                              onPressed: () {
                                getEvent();
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Áp dụng",
                              )),
                        ),
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(color: Colors.grey),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderHelper.r10),
                                  maximumSize: const Size(250, 40)),
                              onPressed: () {
                                emit(SearchState.ds());
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Bỏ lọc",
                                style: TextStyle(color: Colors.grey),
                              )),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  void getEvent() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final result = await _domain.eventRepository.getListEventSearch(
      endDate: formatDateTime(state.endStart),
      startDate: formatDateTime(state.endStart),
      status: state.eventEnum.nameOf,
      title: state.title,
      topic: state.topicEnum.nameOf,
      type: state.categoryEnum.nameOf,
    );
    if (result.isSuccess) {
      emit(state.copyWith(list: result.data));
    }
  }

  void showDateTimePicker(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 100),
      lastDate: DateTime(now.year + 10),
      builder: (context, child) {
        return child!;
      },
    );
    if (picked != null) {
      emit(state.copyWith(timeStart: picked));
    }
  }

  void showDateTimePicker1(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 100),
      lastDate: DateTime(now.year + 10),
      builder: (context, child) {
        return child!;
      },
    );
    if (picked != null) {
      emit(state.copyWith(endStart: picked));
    }
  }

  String formatDateTime(DateTime dateTime) {
    try {
      String formattedDate =
          '${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')}/${dateTime.year}';
      return formattedDate;
    } catch (e) {
      return "";
    }
  }
}
