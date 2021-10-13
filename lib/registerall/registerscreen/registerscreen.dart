import 'package:facebook/loginall/loginscreen/loginscreen.dart';
import 'package:facebook/modules/home/homeface.dart';
import 'package:facebook/registerall/registercubit/registercubiitstate.dart';
import 'package:facebook/registerall/registercubit/registercubithome.dart';
import 'package:facebook/styles/icons_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  var emailControl = TextEditingController();
  var passwordControl = TextEditingController();
  var nameControl = TextEditingController();
  var phoneControl = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterCubitState>(
        listener: (context, state) {
          if (state is ChangeScreenRegisterSuccessState) {
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Welcome in App',
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
                            return 'Please Write your name';
                          }
                          return null;
                        },
                        controller: nameControl,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabled: true,
                          prefixIcon: const Icon(IconBroken.Profile),
                          // hintText: 'Write your email',
                          //contentPadding: EdgeInsets.zero,
                          labelText: 'Name',
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
                            return 'Please Write your email';
                          }
                          return null;
                        },
                        controller: emailControl,
                        keyboardType: TextInputType.emailAddress,
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
                        obscureText: RegisterCubit.get(context).isPassword,
                        // keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          enabled: true,
                          prefixIcon: const Icon(IconBroken.Password),
                          suffixIcon: IconButton(
                            onPressed: () {
                              RegisterCubit.get(context).changeVisibility();
                            },
                            icon: Icon(RegisterCubit.get(context).suffix),
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
                      TextFormField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Write your Phone';
                          }
                          return null;
                        },
                        controller: phoneControl,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          enabled: true,
                          prefixIcon: const Icon(IconBroken.Call),
                          // hintText: 'Write your email',
                          //contentPadding: EdgeInsets.zero,
                          labelText: 'Phone',
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
                            RegisterCubit.get(context).registerMethod(
                                email: emailControl.text,
                                password: passwordControl.text,
                                name: nameControl.text,
                                phone: phoneControl.text);
                          },
                          child: const Text(
                            'Register',
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
                            'Have an account ?',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          TextButton(
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
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
