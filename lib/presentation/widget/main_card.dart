import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:iranian/core/consts/app_image.dart';
import 'package:iranian/domain/entities/day_agent_response_entity.dart';

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
          margin:  const EdgeInsets.only(bottom: 16),
          padding:
              const EdgeInsets.only(top: 40, bottom: 8, left: 16, right: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: const Color(0xffC3C3C3).withOpacity(.24),
                    blurRadius: 8),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            textItem(title: 'شناسه پرونده ', text: widget.data.id.toString()),
            textItem(
                title: 'نام مشتری',
                text: widget.data.applicantUserFullName.toString()),
            textItem(
                title: 'تلفن همراه',
                text: widget.data.applicantUserPhoneNumber.toString()),
            textItem(
                title: 'محل بازدید',
                text: widget.data.visitLocation.toString()),
            const SizedBox(
              height: 16,
            ),
            statusContaienr(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                doneWidget(),
                const SizedBox(
                  width: 45,
                ),
                const OutlineButton(),
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
          child:  const  Text('خودم',
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
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffF6F6F8)),
      child: Column(children: [
        statusContainerItem(
            text: 'وضعیت پرونده ',
            title: widget.data.status.toString(),
            iconPath: AppImage.documentIcon),
        statusContainerItem(
            text: 'زمان بازدید',
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
                color: Color(0xff707070),
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          Text(
            text,
            style: const TextStyle(
                color: Color(0xff505050),
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
                  color: Color(0xff505050),
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
                    color: Color(0xff707070),
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
                    color: const Color(0xffB7B7B7),
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
          "انجام شد",
          style: TextStyle(
              color: Color(0xff1CAE81),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
