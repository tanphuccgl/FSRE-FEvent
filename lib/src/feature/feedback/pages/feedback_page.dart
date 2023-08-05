import 'package:fevent/src/feature/feedback/logic/feedback_bloc.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:fevent/src/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedbackPage extends StatelessWidget {
  final String eventId;
  const FeedbackPage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedbackBloc(eventId),
      child: BlocBuilder<FeedbackBloc, FeedbackState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: XColors.primary,
              centerTitle: false,
              leading: GestureDetector(
                onTap: () => XCoordinator.replaceDashboard(),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              children: [
                const Text(
                  "Khảo sát mức độ hài lòng của sinh viên sau sự kiện",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: XColors.primary,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Đâu tiên, xin gửi lời cám ơn chân thành đến các bạn đã dành thời gian tham gia sự kiện hôm nay. Để giúp Ban tổ chức chuẩn bị tốt hơn cho những sự kiện tiếp theo, nhờ các bạn hỗ trợ thực hiện Phiếu khảo sát sau đây. Xin chân thành cám ơn!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        "Đánh giá mức độ hài lòng ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    for (int i = 1; i <= 5; i++) buildRatingButton(context, i),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        "Đánh giá chất lượng diễn giả/khách mời ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    for (int i = 1; i <= 5; i++) buildRatingButton2(context, i),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        "Đánh giá nội dung truyền đạt",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    for (int i = 1; i <= 5; i++) buildRatingButton3(context, i),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        "Đánh giá công tác tổ chức",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    for (int i = 1; i <= 5; i++) buildRatingButton4(context, i),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Điều bạn thích nhất về sự kiện ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                XInput(
                    value: state.text1,
                    onChanged: (value) =>
                        context.read<FeedbackBloc>().onChangedText1(value)),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Điều bạn không thích về sự kiện ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                XInput(
                    value: state.text2,
                    onChanged: (value) =>
                        context.read<FeedbackBloc>().onChangedText2(value)),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => context.read<FeedbackBloc>().onButton(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: XColors.primary),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        "GỬI",
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: XColors.primary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildRatingButton(BuildContext context, int rating) {
    return BlocBuilder<FeedbackBloc, FeedbackState>(
      builder: (context, state) {
        final isSelected = rating == state.value1;
        return GestureDetector(
          onTap: () => context.read<FeedbackBloc>().onChangedValue1(rating),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? XColors.primary
                    : XColors.primary.withOpacity(0.3),
              ),
              child: Center(
                child: Text(
                  '$rating',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildRatingButton2(BuildContext context, int rating) {
    return BlocBuilder<FeedbackBloc, FeedbackState>(
      builder: (context, state) {
        final isSelected = rating == state.value2;
        return GestureDetector(
          onTap: () => context.read<FeedbackBloc>().onChangedValue2(rating),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? XColors.primary
                    : XColors.primary.withOpacity(0.3),
              ),
              child: Center(
                child: Text(
                  '$rating',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildRatingButton3(BuildContext context, int rating) {
    return BlocBuilder<FeedbackBloc, FeedbackState>(
      builder: (context, state) {
        final isSelected = rating == state.value3;
        return GestureDetector(
          onTap: () => context.read<FeedbackBloc>().onChangedValue3(rating),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? XColors.primary
                    : XColors.primary.withOpacity(0.3),
              ),
              child: Center(
                child: Text(
                  '$rating',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildRatingButton4(BuildContext context, int rating) {
    return BlocBuilder<FeedbackBloc, FeedbackState>(
      builder: (context, state) {
        final isSelected = rating == state.value4;
        return GestureDetector(
          onTap: () => context.read<FeedbackBloc>().onChangedValue4(rating),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? XColors.primary
                    : XColors.primary.withOpacity(0.3),
              ),
              child: Center(
                child: Text(
                  '$rating',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
