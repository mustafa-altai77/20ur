import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twenty_r/colors.dart';
import 'package:twenty_r/screen/home_menu.dart';
import 'package:twenty_r/screen/home_screen_section.dart';
import 'package:twenty_r/widgets/app_text_button.dart';
import 'package:twenty_r/widgets/app_text_form_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  TabController? _controller;
  bool isObscureText = true;
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: moreLighter,
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: moreLighter,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, -9),
                      )
                    ]),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 7,
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: brown,
                      image: DecorationImage(
                        image: AssetImage('images/20r.png'),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DefaultTabController(
                    length: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: brown,
                            indicatorColor: Colors.amber,
                            indicatorPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: [
                              Tab(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: brown,
                                      fontSize: 18),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Sign-up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: brown,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                TabBarView(
                  controller: _controller,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          AppTextFormField(
                            hintText: "Email",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a valid email';
                              }
                            },
                            controller: null,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppTextFormField(
                            hintText: "Password",
                            isObscureText: isObscureText,
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                child: Icon(isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a valid email';
                              }
                            },
                            controller: null,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Forget Passcode?",
                            style: TextStyle(fontSize: 18, color: brown),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    bottom: 30,
                    right: 20,
                    left: 20,
                    child: AppTextButton(
                        horizontalPadding: 20,
                        buttonHeight: 60,
                        buttonText: "Login",
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeMenu()));
                        }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
