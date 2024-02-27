import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/Core/local_storage.dart';
import 'package:news_app/Home/Features/home_view.dart';
import 'package:news_app/Utils/App_Buttons.dart';
import 'package:news_app/Utils/App_Colors.dart';
import 'package:news_app/Utils/App_Functions.dart';
import 'package:news_app/Utils/App_Text_Styles.dart';

String? _Image;
String name = '';

class UpLoadView extends StatefulWidget {
  const UpLoadView({super.key});

  @override
  State<UpLoadView> createState() => _UpLoadViewState();
}

class _UpLoadViewState extends State<UpLoadView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blackColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                  onPressed: () {
                    // //name and image are ok
                    if (_Image != null && name.isNotEmpty) {
                      AppLocal.cacheData(AppLocal.IMAGE_KEY, _Image);
                      AppLocal.cacheData(AppLocal.NAME_KEY, name);
                      AppLocal.cacheData(AppLocal.ISUPLOAD_KEY, true);

                      AppFunctions.getMoveToNextPageReplacement(
                          context: context,
                          theScreenYouWantToProceed: const HomeView());

                      // no image
                    } else if (_Image == null && name.isNotEmpty) {
                      AppFunctions.showMySnackBar(
                          context, 'You need to upload your Image !!');
                      // no name
                    } else if (_Image != null && name.isEmpty) {
                      AppFunctions.showMySnackBar(
                          context, 'You need to register your Name !!');

                      //no image and no name
                    } else {
                      AppFunctions.showMySnackBar(context,
                          'You need to upload your Image,\n and register your Name !! ');
                    }
                  },
                  child: Text('Done', style: getSmallStyle(fontSize: 20))),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //const Gap(45),
                CircleAvatar(
                  radius: 90,
                  backgroundImage: (_Image != null)
                      ? FileImage(File(_Image!)) as ImageProvider
                      : const AssetImage('Assets/accountingImage.png'),
                ),
                const Gap(40),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: CustomButton(
                    text: 'UpLoad from Camera',
                    onPressed: () async {
                      upLoadFromCamera();
                    },
                  ),
                ),
                const Gap(15),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: CustomButton(
                      text: 'UpLoad from Gallery',
                      onPressed: () {
                        upLoadFromGallery();
                      }),
                ),
                const Gap(10),
                Divider(
                  color: AppColors.lemonadeColor,
                  endIndent: 25,
                  indent: 25,
                  thickness: 1.5,
                ),
                const Gap(10),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.digitsOnly
                    // ],
                    // to connet wht is written inside the TextFormfield with the variable i will use as a condition
                    keyboardType: TextInputType.name,
                    style: getBodyStyle(color: AppColors.whiteColor),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.lemonadeColor,
                          size: 30,
                        ),
                        hintText: 'Enter Your Name ...',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.redColor,
                            ))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  upLoadFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.IMAGE_KEY, pickedImage.path);
      setState(() {
        _Image = pickedImage.path;
      });
    }
  }

  upLoadFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.IMAGE_KEY, pickedImage.path);
      setState(() {
        _Image = pickedImage.path;
      });
    }
  }
}
