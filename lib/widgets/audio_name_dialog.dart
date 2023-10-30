import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'my_text.dart';

class AudioNameDialog extends StatefulWidget {
  final String? audioPath;
  const AudioNameDialog({this.audioPath, super.key});

  @override
  State<AudioNameDialog> createState() => _AudioNameDialogState();
}

class _AudioNameDialogState extends State<AudioNameDialog> {
  TextEditingController nameController = TextEditingController();
  bool isLoadingAd = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kMainColor,
      title: Center(
          child: MyText(
        text: 'Sound Name',
        weight: FontWeight.bold,
      )),
      actionsPadding: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: nameController,
          validator: (value) {
            if (value!.isEmpty) {
              return '* Add name';
            }
          },
          decoration: const InputDecoration(
            hintText: 'Sound name',
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      //fixedSize: MaterialStateProperty.all(const Size(80.0, 40.0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: MyText(text: 'Cancel'),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ),
            ),
            !isLoadingAd
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0))),
                          // fixedSize: MaterialStateProperty.all(
                          //   const Size(80.0, 40.0),
                          // ),
                        ),
                        child: MyText(text: 'Ok'),
                        onPressed: () {},
                      ),
                    ),
                  )
                : const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
          ],
        ),
      ],
    );
  }
}
