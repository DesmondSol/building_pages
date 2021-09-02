import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

// consider converting to stateful widget if stg is not working
class NewTransaction extends StatefulWidget {
//  const NewTransaction({ Key? key }) : super(key: key);
  final Function addtx;

  NewTransaction(this.addtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _nameController = TextEditingController();
  final _phoneNoContoller = TextEditingController();
  final _emailController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    if (_nameController.text.isEmpty || _phoneNoContoller.text.isEmpty) {
      print('please enter values');
      Fluttertoast.showToast(
          msg: "please enter values",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    final enteredTitle = _nameController.text;
    final enteredAmnt = double.parse(_phoneNoContoller.text);
    // addtx(titleController.text,  // another way of putting it
    // double.parse(amountContoller.text)
    if (enteredAmnt <= 0) {
      print('please enter realistic values');
      Fluttertoast.showToast(
          msg: "please enter realistic values",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    widget.addtx(enteredTitle, enteredAmnt, _selectedDate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _nameController,
              //     onChanged: (val) => ttlInput = val,
              onSubmitted: (_) => _submitData(),
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _emailController,
              //onSubmitted: (_) => _submitData(),

              //  keyboardType: TextInputType.numberWithOptions(decimal: false),
              //      onChanged: (val) => amntInput = val,  is an alternative to thr controller above
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _phoneNoContoller,
              //onSubmitted: (_) => _submitData(),

              keyboardType: TextInputType.numberWithOptions(decimal: false),
              //      onChanged: (val) => amntInput = val,  is an alternative to thr controller above
              decoration: InputDecoration(labelText: "PhoneNo"),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    onPrimary: Theme.of(context).textTheme.button!.color),
                onPressed: _submitData,
                child: Text(
                  'Add participant',
                  //   style: TextStyle(
                  //       color: Theme.of(context).textTheme.button!.color),
                ))
          ],
        ),
      ),
    );
  }
}