import 'dart:convert';

import 'package:flutter_tags/flutter_tags.dart';
import 'package:medicalpat/Login/welcome_screen.dart';
import 'package:medicalpat/Pages/bottomnav.dart';
import 'package:medicalpat/constants.dart';
import 'package:medicalpat/screens/auth/components/sign_up_form.dart';
import 'package:medicalpat/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../Network/networkapi.dart';

class Predict extends StatefulWidget {
  @override
  State<Predict> createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  // It's time to validat the text field
  final _formKey = GlobalKey<FormState>();
  String errorText = ""; //to check for unique user name
  bool validate = false; //as boolen type
  bool circular = false; //to show circular bar instead of circular
  final storage = new FlutterSecureStorage();
  late List _items = [];

  NetworkHandler networkHandler = NetworkHandler();

  late String _userName, _email, _password, _phoneNumber;

  final TextEditingController _typeAheadController = TextEditingController();
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  @override
  Widget build(BuildContext context) {
    // But still same problem, let's fixed it
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/iconss/Sign_Up_bg.svg",
            // height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            // Now it takes 100% of our height
          ),
          Center(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Predict Symptom",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text("Already have an account?"),
                        TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              )),
                          child: Text(
                            "Sign In!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: defaultPadding * 2),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       if (_formKey.currentState!.validate()) {
                    //         _formKey.currentState!.save();
                    //         print(_userName);
                    //       }
                    //     },
                    //     child: Text("Sign Up"),
                    //   ),
                    // ),
                    TextFieldName(text: "Field"),
                    TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                            decoration:
                                InputDecoration(hintText: "theflutterway"),
                            controller: this._typeAheadController,
                            onSubmitted: (string) {
                              setState(() {
                                // required
                                _items.add(Item(title: string));
                                _typeAheadController.clear();
                              });
                            }),
                        suggestionsCallback: (pattern) async {
                          return await StateService.getSuggestions(pattern);
                        },
                        transitionBuilder:
                            (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion.toString()),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          this._typeAheadController.text =
                              suggestion.toString();
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 300,
                      child: ListView(children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Tags(
                            key: _tagStateKey,
                            itemCount: _items.length, // required
                            itemBuilder: (index) {
                              final Item currentitem = _items[index];
                              return ItemTags(
                                key: Key(index.toString()),
                                index: index,
                                title: currentitem.title,
                                customData: currentitem.customData,
                                textStyle: TextStyle(
                                  fontSize: 14,
                                ),
                                combine: ItemTagsCombine.withTextBefore,
                                removeButton: ItemTagsRemoveButton(
                                  onRemoved: () {
                                    // Remove the item from the data source.
                                    setState(() {
                                      _items.removeAt(index);
                                      // networkHandler.get(
                                      //     "duser/delattribute/${email}/${currentitem.title}");
                                    });
                                    //required
                                    return true;
                                  },
                                ), // OR null,
                                onPressed: (item) => print(item),
                                onLongPressed: (item) => print(item),
                              );
                            },
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: circular
                          ? CircularProgressIndicator()
                          : Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff00A86B),
                              ),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                    ),

                    const SizedBox(height: defaultPadding * 2),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
