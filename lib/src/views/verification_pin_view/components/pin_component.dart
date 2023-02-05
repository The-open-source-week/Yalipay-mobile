

import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/size_device_util.dart';

class PinComponent extends StatefulWidget {
  final void Function(String) onFinished;

  const PinComponent({super.key, required this.onFinished});

  @override
  State<PinComponent> createState() => _PinComponentState();
}

class _PinComponentState extends State<PinComponent> {

  List<FocusNode> focusTexfields = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];

  List<TextEditingController> controllersTextfields = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sizeDevice.width,
      height: 50,
      child: Row(
        children: List.generate(4, (index) =>  Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index == 4 ? 0 : 15
            ),
            child: TextField(
              controller: controllersTextfields[index],
              focusNode: focusTexfields[index],
              maxLength: 1,
              minLines: 1,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontFamily: fontPoppinsMedium,
                fontWeight: FontWeight.w700,
                fontSize: 32
              ),
              onChanged: (value) {

                if (value.trim().isNotEmpty && index != 3) {
                  focusTexfields[index].nextFocus();

                } else if(value.trim().isEmpty && index != 0) {
                  focusTexfields[index].previousFocus();

                } else {

                  widget.onFinished(
                    controllersTextfields[0].text.trim() +
                    controllersTextfields[1].text.trim() +
                    controllersTextfields[2].text.trim() +
                    controllersTextfields[3].text.trim()
                  );
                }
              },
              decoration: const InputDecoration(
                hintText: "0",
                counter: SizedBox(),

                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: colorYellow
                  )
                ),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.white
                  )
                )
              ),
            ),
          )
        )),
      ),
    );
  }
}