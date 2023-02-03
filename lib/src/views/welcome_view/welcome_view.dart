

import 'package:flutter/material.dart';
import 'package:yalipay/src/views/components/custom_button_component.dart';
import 'package:yalipay/src/views/components/intro_text_compoent.dart';

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
        children: const [

           Spacer(),

          IntroTextComponent(),

          SizedBox(height: 142,),

          CustomButtonCompoent(title: "Já Tenho Conta",),

          SizedBox(height: 29,),

          CustomButtonCompoent(
            title: "Me Cadastrar",
            showBorderOutline: true,
          ),

          SizedBox(height: 142,)

          
        ],
      ),
    );
  }
}