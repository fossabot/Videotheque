import 'package:flutter/material.dart';

class AlertDialogComponent extends StatelessWidget {
  String title;
  Function onConfirmed;
  Function onAbort;
  Color mainColor;
  String content;
  String buttonAbort = "Annuler";
  String buttonConfirm = "Confirmer";
  Widget inputWidget;

  AlertDialogComponent({this.title, this.onConfirmed, this.inputWidget, this.onAbort, this.mainColor, this.content, this.buttonAbort, this.buttonConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: title != null ? Text(title) : Padding(padding: EdgeInsets.zero),
        contentPadding: title == null ? EdgeInsets.symmetric(vertical: 5, horizontal: 25) : EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        content: content != null ? SingleChildScrollView(
          child: Column(
            children: [
              Text(content), 
              inputWidget ?? Padding(padding:EdgeInsets.zero)
            ]
          ),
        ) : Padding(padding: EdgeInsets.zero),
        contentTextStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16.5), 
        actions: <Widget>[
          FlatButton(
            onPressed: onAbort, 
            child: Text(this.buttonAbort ?? "Annuler", style: TextStyle(color: mainColor)),
            splashColor: mainColor.withAlpha(50),
          ),
          RaisedButton(
            onPressed: onConfirmed,
            child: Text(this.buttonConfirm ?? "Confirmer"),
            elevation: 2,
            highlightElevation: 3,
            color: mainColor,
          )
        ],
      );
  }
}