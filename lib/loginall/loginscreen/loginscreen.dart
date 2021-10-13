import 'package:facebook/loginall/cubitlogin/cubitloginhome.dart';
import 'package:facebook/loginall/cubitlogin/cubitloginstate.dart';
import 'package:facebook/modules/home/homeface.dart';
import 'package:facebook/registerall/registerscreen/registerscreen.dart';
import 'package:facebook/styles/icons_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var emailControl = TextEditingController();
  var passwordControl = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginCubitState>(
        listener: (context, state) {
          if (state is ChangeScreenLoginSuccessState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeFace()),
                (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?size=338&ext=jpg',
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Welcome ',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Write your email';
                          }
                          return null;
                        },
                        controller: emailControl,
                        decoration: InputDecoration(
                          enabled: true,
                          prefixIcon: const Icon(Icons.email),
                          // hintText: 'Write your email',
                          //  contentPadding: EdgeInsets.zero,
                          labelText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Write your password';
                          }
                          return null;
                        },
                        controller: passwordControl,
                        obscureText: LoginCubit.get(context).isPassword,
                        decoration: InputDecoration(
                          enabled: true,
                          prefixIcon: const Icon(IconBroken.Password),
                          suffixIcon: IconButton(
                            onPressed: () {
                              LoginCubit.get(context).changeVisibility();
                            },
                            icon: Icon(LoginCubit.get(context).suffix),
                          ),
                          // hintText: 'Write your email',
                          //contentPadding: EdgeInsets.zero,
                          labelText: 'password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                            LoginCubit.get(context).loginMethod(
                                email: emailControl.text,
                                password: passwordControl.text);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Create account ?',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          TextButton(
                            child: const Text(
                              'Register',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
