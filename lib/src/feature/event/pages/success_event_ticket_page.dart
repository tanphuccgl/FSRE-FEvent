import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessEventTicketPage extends StatelessWidget {
  const SuccessEventTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: XColors.primary,
        centerTitle: false,
        title: const Text(
          "Chi tiết sự kiện",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Column(
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: XColors.fill),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.network(
                    "https://agendabrussels.imgix.net/004a2b71108438b08b4c2d39af2e4173770c6408.jpg",
                    height: 168.h,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "Mua vé thành công",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Chúc mừng bạn, bây giờ bạn có thể\nthấy được chi tiết của vé",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        height: 1.5,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            maximumSize: const Size(150, 55)),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Quay lại",
                        )),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
