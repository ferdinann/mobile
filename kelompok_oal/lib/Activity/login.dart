import 'package:flutter/material.dart';
import 'package:kelompok_oal/Activity/Register.dart';
import 'package:kelompok_oal/Activity/forgetPassword.dart';
import 'package:kelompok_oal/Activity/home.dart';
import 'package:kelompok_oal/provider/loading_provider.dart';
import 'package:kelompok_oal/provider/obscure.dart';
import 'package:provider/provider.dart';
//import '../provider/obscure.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    final Obs = Provider.of<Obscure>(context);
    final loadingProvider = Provider.of<LoadingProvider>(context);

    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<Obscure>(
            create: (context) => Obscure(),
          ),
          ChangeNotifierProvider<LoadingProvider>(
            create: (context) => LoadingProvider(),
          ),
        ],
        child: SafeArea(
          child: Stack(
            children: [
              ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "LiteBrain",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: 120, left: 20, bottom: 30),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: 'Masukkan email',
                                    labelText: 'Email',
                                    prefixIcon: Icon(Icons.person),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 10),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: Obs.iconShow,
                                decoration: InputDecoration(
                                    hintText: 'Masukkan Password',
                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        Provider.of<Obscure>(context,
                                                listen: false)
                                            .toogleVisible();
                                      },
                                      icon: Icon(Obs.iconShow
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined),
                                    ),
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide(width: 10),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterPage()),
                                        );
                                      },
                                      child: const Text('Register')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPasswordPage()),
                                        );
                                      },
                                      child: const Text('Forgot Password'))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: OutlinedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            onPressed: () async {
                              loadingProvider.setLoading(true);
                              await Future.delayed(Duration(seconds: 2));
                              loadingProvider.setLoading(false);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyHome()));
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                      )
                    ],
                  ),
                ],
              ),
              if (loadingProvider.isLoading)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
