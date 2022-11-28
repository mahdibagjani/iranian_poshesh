import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:iranian/core/consts/app_image.dart';

import 'outline_button.dart';

class MainCard extends StatefulWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
      padding: const EdgeInsets.only(top: 40, bottom: 8, left: 16, right: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0xffC3C3C3).withOpacity(.24), blurRadius: 8),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        textItem(title: 'شناسه پرونده ', text: '0iajz4o474'),
        textItem(title: 'نام مشتری', text: 'محمدعلی مراد بیگ زاده'),
        textItem(title: 'تلفن همراه', text: '09127825671'),
        textItem(
            title: 'محل بازدید',
            text: 'شهرک غرب، فاز 4، زرافشان، خیابان شجریان، پلاک 13، واحد 8'),
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
    Positioned(child: Image.asset(AppImage.bookmarkIcon,width: 50,height: 45,),left: -11,top: -3,),
    Container(
      margin: EdgeInsets.only(left: 4,top: 5),
      child: Text('خودم',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.white)),
    )
      ],
    );
  }

  Container statusContaienr() {
    return Container(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffF6F6F8)),
      child: Column(children: [
        statusContainerItem(
            text: 'وضعیت پرونده ',
            title: 'تأیید شده توسط نماینده',
            iconPath: AppImage.documentIcon),
        statusContainerItem(
            text: 'زمان بازدید',
            title: '14:11 -1401-06-01',
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
          const SizedBox(width: 8,),
          Image.asset(iconPath,width: 18,height: 18,),
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
