import 'package:flutter/material.dart';
import 'package:iranian/core/consts/app_color.dart';
import 'package:iranian/core/consts/app_image.dart';
import 'package:iranian/domain/entities/day_agent_response_entity.dart';

import '../../core/consts/app_strings.dart';
import 'outline_button.dart';

class MainCard extends StatefulWidget {
  final Result data;
  const MainCard({Key? key, required this.data}) : super(key: key);

  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding:
              const EdgeInsets.only(top: 40, bottom: 8, left: 16, right: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColor.shadowColor.withOpacity(.24),
                    blurRadius: 8),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            textItem(title: AppStrings.docId, text: widget.data.id.toString()),
            textItem(
                title: AppStrings.customerName,
                text: widget.data.applicantUserFullName.toString()),
            textItem(
                title: AppStrings.phoneNumber,
                text: widget.data.applicantUserPhoneNumber.toString()),
            textItem(
                title: AppStrings.visitPlace,
                text: widget.data.visitLocation.toString()),
            const SizedBox(
              height: 16,
            ),
            statusContaienr(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                doneWidget(),
                const Spacer(),
                const OutlineButton(),
                const Spacer(),
              ],
            ),
          ]),
        ),
        Positioned(
          left: -11,
          top: -2,
          child: Image.asset(
            AppImage.bookmarkIcon,
            width: 50,
            height: 45,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 4, top: 10),
          child: const Text(AppStrings.me,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
        )
      ],
    );
  }

  Container statusContaienr() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColor.statusColor),
      child: Column(children: [
        statusContainerItem(
            text: AppStrings.docStatus,
            title: widget.data.status.toString(),
            iconPath: AppImage.documentIcon),
        statusContainerItem(
            text: AppStrings.visitTime,
            title: '${widget.data.visitTime}-${widget.data.visitDate}',
            iconPath: AppImage.clockIcon),
      ]),
    );
  }

  Padding statusContainerItem(
      {required String iconPath, required String title, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 14,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
                color: AppColor.greyLightColor,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          Text(
            text,
            style: const TextStyle(
                color: AppColor.greyDarkColor,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            width: 8,
          ),
          Image.asset(
            iconPath,
            width: 18,
            height: 18,
          ),
        ],
      ),
    );
  }

  Container textItem({required String text, required String title}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      //  color: Colors.red.withOpacity(.1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                  color: AppColor.greyDarkColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            width: 34,
          ),
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: AppColor.greyLightColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: AppColor.greyColor,
                    borderRadius: BorderRadius.circular(8)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget doneWidget() {
    return Column(
      children: [
        Image.asset(
          AppImage.doneIcon,
          width: 41,
          height: 41,
        ),
        const Text(
          AppStrings.done,
          style: TextStyle(
              color: AppColor.greenColor,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
