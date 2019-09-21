import 'package:flop_edt_app/components/fade_in.dart';
import 'package:flop_edt_app/models/cours.dart';
import 'package:flop_edt_app/utils.dart';
import 'package:flutter/material.dart';

class CoursWidget extends StatelessWidget {
  final Cours cours;
  final double delay;
  final bool animate;
  const CoursWidget({Key key, this.cours, this.delay, this.animate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return animate ? FadeIn(delay, _ui) : _ui;
  }

  Widget get _ui => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: cours.coursType == 'DS' || cours.coursType == 'Examen' ? Colors.red : hexToColor(cours.color),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2.0, 5.0),
              blurRadius: 10.0,
            )
          ],
        ),
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: 100,
                  padding: EdgeInsets.only(left: 20),
                  child: Center(
                      child: Text(
                    cours.coursType,
                    style: TextStyle(
                        fontSize: 18, color: hexToColor(cours.textColor)),
                  ))),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      cours.module,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: hexToColor(cours.textColor)),
                    ),
                    Text(
                      cours.nomProf,
                      style: TextStyle(color: hexToColor(cours.textColor)),
                    ),
                    Text(
                      cours.salle,
                      style: TextStyle(
                          color: hexToColor(cours.textColor),
                          fontWeight: cours.coursType == 'DS'
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        height: 100,
      );
}
