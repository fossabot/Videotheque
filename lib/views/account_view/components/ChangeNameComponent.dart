import 'package:Videotheque/Globals.dart';
import 'package:flutter/material.dart';

class ChangeNameComponent extends StatelessWidget {

  final Function _onConfirm;
  final Function _onClose;
  final TextEditingController _textController;
  final BuildContext _context;

  ChangeNameComponent(this._onConfirm, this._onClose, this._textController, this._context);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text("Changer mon nom d'utilisateur"),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: TextField(
            controller: _textController,
            cursorColor: GlobalsColor.darkGreen,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: GlobalsColor.darkGreen),
              labelText: "Nouveau nom",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                borderSide: BorderSide(
                  color: GlobalsColor.darkGreen,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                borderSide: BorderSide(
                  color: GlobalsColor.darkGreen,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
        ),
        ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                textColor: GlobalsColor.darkGreen,
                splashColor: GlobalsColor.darkGreen.withAlpha(100),
                onPressed: () => _onClose(_context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Annuler"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: RaisedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Confirmer"),
                  ),
                  color: GlobalsColor.darkGreen,
                  highlightElevation: 3,
                  onPressed: () => _onConfirm(_context)
                )
              )
            ],
          )
      ],
      
    );    
  }
}