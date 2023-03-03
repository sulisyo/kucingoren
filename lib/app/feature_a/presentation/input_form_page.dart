import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:oren/app/feature_a/domain/card_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFormPage extends StatefulWidget {
  const InputFormPage({super.key});

  @override
  InputFormPageState createState() {
    return InputFormPageState();
  }
}

class InputFormPageState extends State<InputFormPage> {
  final _text = TextEditingController();
  bool _validate = false;

  final _formKey = GlobalKey<FormState>();

  // declare a variable to keep track of the input text
  String _name = '';

  void _submit() {
    _formKey.currentState?.validate();
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // theme: ThemeData(primarySwatch: Colors.green),
      appBar: AppBar(
        title: Text('TextField Validation'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error Showed if Field is Empty on Submit button Pressed'),
              AlohaGhostInputField(
                controller: _text,
                placeholder: 'Enter the Value',
                error:
                    'fsadfsadf', //_validate ? 'Value Can\'t Be Empty' : null,
                // decoration: InputDecoration(
                //     labelText: 'Enter the Value',
                //     errorText: _validate ? 'Value Can\'t Be Empty' : null,
                // ),
              ),
              SizedBox(
                height: 10,
              ),
              AlohaPrimaryButton.positive(
                Text('Submit'),
                onTap: () {
                  setState(() {
                    _text.text.isEmpty ? _validate = true : _validate = false;
                  });
                },
              ),
              getForm(),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  Widget getForm() {
    // build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AlohaNudeInputField(
            type: AlohaInputFieldType.regular,
            placeholder: '',
            label: 'Enter your name',
            // use the validator to return an error string (or null) based on the input text
            // validator: (text) {
            //   if (text == null || text.isEmpty) {
            //     return 'Can\'t be empty';}
            //   if (text.length < 4) {
            //     return 'Too short';
            //   }
            //   return null;
            // },
            // update the state variable when the text changes
            onChanged: (text) => setState(() => _name = text),
          ),
          AlohaNudeInputField(
            placeholder: '',
            type: AlohaInputFieldType.regular,
            label: 'Enter your address',

            // use the validator to return an error string (or null) based on the input text
            // validator: (text) {
            //   if (text == null || text.isEmpty) {
            //     return 'Can\'t be empty';}
            //   if (text.length < 4) {
            //     return 'Too short';
            //   }
            //   return null;
            // },
            // update the state variable when the text changes
            onChanged: (text) => setState(() => _name = text),
          ),
          AlohaNudeInputField(
            type: AlohaInputFieldType.regular,
            label: 'Enter card number',
            placeholder: 'xxxx-xxxx-xxxx-xxxx',
            // use the validator to return an error string (or null) based on the input text
            // validator: (text) {
            //   if (text == null || text.isEmpty) {
            //     return 'Can\'t be empty';}
            //   if (text.length < 4) {
            //     return 'Too short';
            //   }
            //   return null;
            // },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
              // LengthLimitingTextInputFormatter(4),
              CardFormatter(sample: 'xxxx-xxxx-xxxx-xxxx', separator: '-')
            ],
            // update the state variable when the text changes
            onChanged: (text) => setState(() => _name = text),
          ),
          AlohaPrimaryButton.positive(
            Text(
              'Submit Name Address Card Num',
            ),
            // only enable the button if the text is not empty
            onTap: () => _name.isNotEmpty ? _submit() : null,
          ),
        ],
      ),
    );
  }
}
