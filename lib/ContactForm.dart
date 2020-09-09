import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/sizeHelper.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:email_validator/email_validator.dart';

String name;
String email;
String message;

TextEditingController controller = TextEditingController();
TextEditingController controller2 = TextEditingController();
TextEditingController controller3 = TextEditingController();
final checkTheForm = GlobalKey<FormState>();

FirebaseFirestore firestore = FirebaseFirestore.instance;
submitForm() {
  firestore.collection('contact').add({
    'Name': name,
    'Email': email,
    'Message': message,
  });
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 370,
          height: displayHeight(context) * .7,
          child: Form(
            key: checkTheForm,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getValueForScreenType(
                      context: context, mobile: 20, desktop: 0, tablet: 0)),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This field cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        contentPadding: EdgeInsets.all(8)),
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: controller2,
                    validator: validateEmail,
                    onSaved: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        contentPadding: EdgeInsets.all(8)),
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: controller3,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This field cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      message = value;
                    },
                    maxLines: getValueForScreenType(
                        context: context, mobile: 5, desktop: 17),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Message',
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        contentPadding: EdgeInsets.all(8)),
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Builder(
                    builder: (context) => OutlineButton(
                      onPressed: () {
                        if (checkTheForm.currentState.validate()) {
                          checkTheForm.currentState.save();
                          submitForm();
                          controller.clear();
                          controller2.clear();
                          controller3.clear();
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Message Sent')));
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ),
                      color: Colors.lightBlueAccent,
                      splashColor: Colors.white,
                      focusColor: Colors.lightBlueAccent,
                      hoverColor: Colors.white10,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String validateEmail(email) {
  bool validEmail = EmailValidator.validate(email);
  if (validEmail == false) {
    return 'Please Enter Valid Email';
  }
  return null;
}
