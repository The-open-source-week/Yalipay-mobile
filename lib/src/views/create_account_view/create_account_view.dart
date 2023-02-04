

import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/views/components/custom_button_component.dart';
import 'package:yalipay/src/views/components/custom_textfield_component.dart';
import 'package:yalipay/src/views/components/intro_text_compoent.dart';
import 'package:yalipay/src/views/components/text_with_link_component.dart';
import 'package:yalipay/src/views/login_view/login_view.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20
        ),
        children: [

          const SizedBox(height: 40,),

          const IntroTextComponent(vault: true,),
          const SizedBox(height: 51,),

          const CustomTextfieldComponent(
            label: "Username", 
            hint: "Insira seu username",
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 30,),

          const CustomTextfieldComponent(
            label: "Número Telefone", 
            hint: "Insira seu telefone",
            textInputType: TextInputType.phone,
          ),
          const SizedBox(height: 30,),


          const CustomTextfieldComponent(
            label: "E-mail", 
            hint: "Insira seu e-mail",
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 30,),

          const CustomTextfieldComponent(
            label: "Senha", 
            hint: "Insira sua senha",
            isPwd: true,
            textInputType: TextInputType.text,
          ),
          
          const SizedBox(height: 64,),   

          const CustomButtonCompoent(title: "Cadastrar"),
          const SizedBox(height: 17,),

          TextWithLinkComponent(
            text: "Já tenho conta. ", 
            textLink: "Entrar", 
            alignment: MainAxisAlignment.center,
            onTapLink: () => GoTo.pageWithoutReturn(context, page: const LoginView()),
          ),
          const SizedBox(height: 54,),
          
        ],
      ),
    );
  }
}