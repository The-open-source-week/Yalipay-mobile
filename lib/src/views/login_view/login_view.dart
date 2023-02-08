import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yalipay/src/controllers/login_controller.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/utils/size_device_util.dart';
import 'package:yalipay/src/views/components/custom_button_component.dart';
import 'package:yalipay/src/views/components/custom_textfield_component.dart';
import 'package:yalipay/src/views/components/intro_text_compoent.dart';
import 'package:yalipay/src/views/components/text_with_link_component.dart';
import 'package:yalipay/src/views/create_account_view/create_account_view.dart';
import 'package:yalipay/src/views/home_view/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginController(),
      child: Consumer<LoginController>(
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
                    //const Spacer(),

                    const IntroTextComponent(
                      vault: true,
                    ),

                    const SizedBox(
                      height: 51,
                    ),

                    CustomTextfieldComponent(
                      controller: provider.emailController,
                      label: "Email",
                      hint: "Insira o seu email",
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
                      height: 17,
                    ),

                    const TextWithLinkComponent(
                        text: "Esqueci minha senha. ",
                        textLink: "Recuperar",
                        alignment: MainAxisAlignment.end),

                    const SizedBox(
                      height: 85,
                    ),

                    CustomButtonCompoent(
                        title: "Entrar",
                        onTap: () {
                          // provider.login();
                          GoTo.page(context, page: const HomeView());
                        }),

                    const SizedBox(
                      height: 17,
                    ),

                    TextWithLinkComponent(
                      text: "Não tenho conta. ",
                      textLink: "Criar",
                      alignment: MainAxisAlignment.center,
                      onTapLink: () =>
                          GoTo.page(context, page: const CreateAccountView()),
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
