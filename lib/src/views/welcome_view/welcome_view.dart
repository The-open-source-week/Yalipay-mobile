

import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/views/components/custom_button_component.dart';
import 'package:yalipay/src/views/components/intro_text_compoent.dart';
import 'package:yalipay/src/views/login_view/login_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

           const Spacer(),

          const IntroTextComponent(),

          const SizedBox(height: 142,),

          CustomButtonCompoent(
            title: "Já Tenho Conta",
            onTap: () => GoTo.page(context, page: const LoginView()),
          ),

          const SizedBox(height: 29,),

          const CustomButtonCompoent(
            title: "Me Cadastrar",
            showBorderOutline: true,
          ),

          const SizedBox(height: 142,)

          
        ],
      ),
    );
  }
}