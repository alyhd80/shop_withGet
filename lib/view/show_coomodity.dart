import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
import 'package:url_launcher/url_launcher.dart';

class showCoomodity extends StatelessWidget {
  showCoomodity({Key? key}) : super(key: key);
  Product product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(product.websiteLink);

    Size size = MediaQuery.of(context).size;
    print(product.price);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.5,
                child: Image.network(
                  product.imageLink,
                  fit: BoxFit.cover,
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: size.height * 0.25,
                width: size.width * 0.87,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  color: Colors.black.withOpacity(0.5),
                )),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width * 0.8,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    if (product.rating != null)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              product.rating.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(product.description),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text: 'link',
                            style: new TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                                decoration: TextDecoration.underline),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                _launchUrl(_url);
                              },
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    color: Color.fromRGBO(248, 244, 244, 1)),
              )),
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
