import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:today_my_school_final/models/model_reset_pw.dart';
import 'package:today_my_school_final/style.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future resetPassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text.trim());
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
              const SnackBar(content: Text('비밀번호 재설정 링크가 담긴 메일을 보냈습니다!')));
      } on FirebaseAuthException catch (e) {
        print(e);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(e.message as SnackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final resetPWField = Provider.of<ResetPWFieldModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        foregroundColor: ColorPalette.blue,
        title: const Text('비밀번호 재설정'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 56.h),
              RichText(
                text: TextSpan(
                  text: '* ',
                  style:
                      TextStyleSet.semibold15.copyWith(color: ColorPalette.red),
                  children: <TextSpan>[
                    TextSpan(
                        text: '비밀번호 재설정 링크가 담긴 메일이 전송됩니다',
                        style: TextStyleSet.medium15),
                  ],
                ),
              ),
              SizedBox(
                width: 248.w,
                height: 48.h,
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (email) {
                    resetPWField.setEmail(email);
                  },
                  style: TextStyleSet.regular15,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'ID(학교 웹메일)',
                    hintStyle: TextStyleSet.regular13
                        .copyWith(color: ColorPalette.grey),
                    errorStyle: TextStyleSet.regular13
                        .copyWith(color: ColorPalette.red),
                    isDense: true,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: ColorPalette.grey,
                        width: 1,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: ColorPalette.blue,
                        width: 2,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: ColorPalette.red,
                        width: 1,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: ColorPalette.red,
                        width: 2,
                      ),
                    ),
                  ),
                  cursorColor: ColorPalette.black,
                  autofocus: true,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 128.w,
                height: 40.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    resetPassword();
                  },
                  child: Text(
                    '확인',
                    style:
                        TextStyleSet.bold16.copyWith(color: ColorPalette.white),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      ),
    );
  }
}
