import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AutoSearchPage(),
    );
  }
}

class AutoSearchPage extends StatefulWidget {
  const AutoSearchPage({super.key});

  @override
  State<AutoSearchPage> createState() => _AutoSearchPageState();
}

class _AutoSearchPageState extends State<AutoSearchPage> {
  String state = "Please Select State";

  TextEditingController stateController = TextEditingController();

  List<String> statesList = [
    'ANDAMAN AND NICOBAR',
    'ANDHRA PRADESH',
    'ARUNACHAL PRADESH',
    'ASSAM',
    'BIHAR',
    'CHATTISGARH',
    'CHANDIGARH',
    'DAMAN AND DIU',
    'DELHI',
    'DADRA AND NAGAR HAVELI',
    'GOA',
    'GUJARAT',
    'HIMACHAL PRADESH',
    'HARYANA',
    'JAMMU AND KASHMIR',
    'JHARKHAND',
    'KERALA',
    'KARNATAKA',
    'LAKSHADWEEP',
    'MEGHALAYA',
    'MAHARASHTRA',
    'MANIPUR',
    'MADHYA PRADESH',
    'MIZORAM',
    'NAGALAND',
    'ORISSA',
    'PUNJAB',
    'PONDICHERRY',
    'RAJASTHAN',
    'SIKKIM',
    'TAMIL NADU',
    'TRIPURA',
    'UTTARAKHAND',
    'UTTAR PRADESH',
    'WEST BENGAL',
    'TELANGANA',
    'LADAKH'
  ];

  List<String> getFilteredStateList(String query) {
    List<String> matches = [];
    matches.addAll(statesList);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Auto Search TextField")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //
            _autoSearchField(),
            //
            const SizedBox(height: 100),
            //
            Text(state)
            //
          ],
        ),
      ),
    );
  }

  Widget _autoSearchField() {
    return TypeAheadField(
      onSuggestionSelected: (String suggestion) {
        /// on click of list item
        print("-----clicked state $suggestion-------");

        setState(() {
          stateController.text = suggestion;
          state = suggestion;
        });
      },
      itemBuilder: (context, String suggestion) {
        ///list item builder
        return SizedBox(
            height: 40,
            child: Align(
                alignment: Alignment.centerLeft, child: Text(suggestion)));
      },
      suggestionsCallback: (value) {
        /// returning filtered list
        return getFilteredStateList(value);
      },
      suggestionsBoxDecoration: const SuggestionsBoxDecoration(
          color: Colors.white,
          elevation: 4.0,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
      textFieldConfiguration: TextFieldConfiguration(
          controller: stateController,
          decoration: InputDecoration(
              hintText: "Enter State Name",
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
              ),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    width: 1,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  borderSide:
                      BorderSide(width: 1, color: Colors.grey.shade200)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  borderSide:
                      BorderSide(width: 1, color: Colors.grey.shade200)))),
    );
  }
}
