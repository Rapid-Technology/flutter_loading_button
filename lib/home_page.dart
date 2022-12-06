import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_btn/loading_btn.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading Button"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Loading Button with CircularProgress widget
            LoadingBtn(
              height: 50,
              borderRadius: 8,
              animate: true,
              color: Colors.brown,
              width: MediaQuery.of(context).size.width * 0.45,
              loader: Container(
                padding: const EdgeInsets.all(10),
                width: 40,
                height: 40,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              onTap: ((startLoading, stopLoading, btnState) async {
                if (btnState == ButtonState.idle) {
                  startLoading();
                  // call your network api
                  await Future.delayed(const Duration(seconds: 5));
                  stopLoading();
                }
              }),
              child: const Text("Login"),
            ),
            const SizedBox(height: 50),
            // Loading Button with custom Text
            LoadingBtn(
              height: 50,
              borderRadius: 8,
              width: MediaQuery.of(context).size.width * 0.45,
              animate: false,
              roundLoadingShape: false,
              color: Colors.blueAccent,
              loader: const Text("Loading..."),
              onTap: ((startLoading, stopLoading, btnState) async {
                if (btnState == ButtonState.idle){
                  startLoading();
                  // call your network api
                  await Future.delayed(const Duration(seconds: 5));
                  stopLoading();
                }
              }),
              child: const Text("Login"),
            ),
            const SizedBox(height: 50),
            // Loading Button with custom loading
            LoadingBtn(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.45,
              borderRadius: 8,
              animate: true,
              color: Colors.deepOrange,
              loader: Container(
                padding: const EdgeInsets.all(10),
                child: const Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: ((startLoading, stopLoading, btnState) async {
                if (btnState == ButtonState.idle){
                  startLoading();
                  // call your network api
                  await Future.delayed(const Duration(seconds: 5));
                  stopLoading();
                }
              }),
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
