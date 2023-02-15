import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/size_device_util.dart';

enum CustomTextfieldType { normal, phone, email, password, valor }

class CustomTextfieldComponent extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType? textInputType;
  final bool isPwd;
  final CustomTextfieldType? type;
  final TextEditingController? controller;
  const CustomTextfieldComponent(
      {super.key,
      required this.label,
      required this.hint,
      this.textInputType,
      this.type = CustomTextfieldType.normal,
      this.isPwd = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sizeDevice.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xff131313),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              cursorColor: YPUtils.colorYellow.withOpacity(0.2),
              inputFormatters: [],
              controller: controller,
              keyboardType: textInputType,
              obscureText: isPwd,
              style: const TextStyle(
                  fontFamily: YPUtils.fontPoppins,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey.withOpacity(.6)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 1, color: YPUtils.colorYellow)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff2D2D2D))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
