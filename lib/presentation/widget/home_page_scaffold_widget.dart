import 'package:flutter/material.dart';
import 'package:iranian/domain/entities/day_agent_response_entity.dart';
import 'package:iranian/presentation/widget/tabbar.dart';

import 'custom_textfield.dart';
import 'main_card.dart';

class HomePageScaffoldWidget extends StatefulWidget {
  final List<Result> data;
  final Function()? atBotton;
  const HomePageScaffoldWidget({
    Key? key,
    required this.data, this.atBotton,
  }) : super(key: key);

  @override
  _HomePageScaffoldWidgetState createState() => _HomePageScaffoldWidgetState();
}

class _HomePageScaffoldWidgetState extends State<HomePageScaffoldWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    setupScrollListener(
      scrollController: scrollController,
      atBottom: () {
        widget.atBotton?.call();
        print('At bottom');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 24,
        ),
        Tabbar(),
        const SizedBox(
          height: 16,
        ),
        CustomTextfield(),
        const SizedBox(
          height: 16,
        ),
        Expanded(
            child: ListView.builder(
          shrinkWrap: true,
          controller: scrollController,
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return MainCard(
              data: widget.data[index],
            );
          },
        ))
      ]),
    );
  }

  void setupScrollListener(
      {required ScrollController scrollController,
      Function? atBottom}) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if(scrollController.position.pixels != 0) {
          atBottom?.call();
        }
      }
    });
  }
}
