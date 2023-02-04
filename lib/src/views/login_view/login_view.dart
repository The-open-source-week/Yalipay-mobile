

import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/views/components/custom_button_component.dart';
import 'package:yalipay/src/views/components/custom_textfield_component.dart';
import 'package:yalipay/src/views/components/intro_text_compoent.dart';
import 'package:yalipay/src/views/components/text_with_link_component.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [

            Spacer(),

            IntroTextComponent(vault: true,),

            SizedBox(height: 51,),

            CustomTextfieldComponent(
              label: "Número Telefone", 
              hint: "Insira seu telefone",
              textInputType: TextInputType.phone,
            ),

            SizedBox(height: 30,),

            CustomTextfieldComponent(
              label: "Senha", 
              hint: "Insira sua senha",
              isPwd: true,
              textInputType: TextInputType.text,
            ),

            SizedBox(height: 17,),

            TextWithLinkComponent(
              text: "Esqueci minha senha. ", 
              textLink: "Recuperar", 
              alignment: MainAxisAlignment.end
            ),
 
            SizedBox(height: 85,),   

            CustomButtonCompoent(title: "Entrar"),

            SizedBox(height: 17,),

            TextWithLinkComponent(
              text: "Não tenho conta. ", 
              textLink: "Criar", 
              alignment: MainAxisAlignment.center
            ),

            SizedBox(height: 54,),
            
          ],
        ),
      ),
    );
  }
}