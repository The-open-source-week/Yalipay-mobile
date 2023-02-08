import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yalipay/src/controllers/register_controller.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/utils/size_device_util.dart';
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
    return ChangeNotifierProvider(
      create: (context) => RegisterController(),
      child: Consumer<RegisterController>(
        builder: (context, provider, child) => Scaffold(
          body: SizedBox(
            height: context.sizeDevice.height,
            width: context.sizeDevice.width,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const IntroTextComponent(
                      vault: true,
                    ),
                    const SizedBox(
                      height: 51,
                    ),
                    CustomTextfieldComponent(
                      controller: provider.userNameController,
                      label: "Username",
                      hint: "Insira seu username",
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextfieldComponent(
                      controller: provider.numeroDeTelefoneController,
                      label: "Número Telefone",
                      hint: "Insira seu telefone",
                      textInputType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextfieldComponent(
                      controller: provider.emailController,
                      label: "E-mail",
                      hint: "Insira seu e-mail",
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextfieldComponent(
                      controller: provider.passwordController,
                      label: "Senha",
                      hint: "Insira sua senha",
                      isPwd: true,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    CustomButtonCompoent(
                      title: "Cadastrar",
                      onTap: () => provider.register(context),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    TextWithLinkComponent(
                      text: "Já tenho conta. ",
                      textLink: "Entrar",
                      alignment: MainAxisAlignment.center,
                      onTapLink: () => GoTo.pageWithoutReturn(context,
                          page: const LoginView()),
                    ),
                    const SizedBox(
                      height: 54,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
