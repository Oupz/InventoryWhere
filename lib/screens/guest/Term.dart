import 'package:flutter/material.dart';

class TermScreen extends StatefulWidget {
  final Function(int)? onChangedStep;

  TermScreen({
    Key? key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  State<TermScreen> createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  late ScrollController _scrollController;
  bool _termReaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();

    // Ecoute du _scrollcontroller
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          _termReaded = true;
        });
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Termes et Conditions',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              widget.onChangedStep!(0);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    // Justifier
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // Aligner à gauche
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          "ARTICLE 1 : INTRODUCTION\n\nCe logiciel a été réalisé personnellement par Laëtitia CIVEL (oupz.com) laetitia.civel@hotmail.fr\n\n\nARTICLE 2 : OBJET D'APPLICATION CGU\n\nLes présentes Conditions générales d'utilisation (CGU) régissent les rapports entre InventoryWhere et les utilisateurs et s'appliquent sans restriction ni résèrve pour toute utilisation ou téléchargement de l'application mobile.\nL'utilisateur est tenu d'accepter les présentes CGU pour toute utilisation de l'Application Mobile en cliquant sur le bouton J'accepte.\n\nInventoryWhere pourra modifier les présentes CGU à tout moment, sans préavis. Les utilisateurs seront informés des modifications des présentes par le biais de la publication des CGU actualisées sur l'application. Il est donc conseillé à l'utilisateur de lire très attentivement les présentes CGU et de consulter régulièrement les CGU mises à jour.\n Dans le cas où l'utilisateur n'accepterait pas les présentes CGU ou refuserait de s'y conformer, il ne doit pas utiliser l'Application Mobile. Dans ce cas, il est recommandé de la désinstaller. En procédant à son inscription, l'utilisateur confirme avoir pris connaissance des présentes CGU et accepte de s'y soumettre sans résèrve.\n\n\nARTICLE 3 : PRESENTATION DU SERVICE\n\nL'application InventoryWhere est un service d'inventaire des objets des utilisateurs. Les données sont hebergées en cloud et protégées par un certificat."),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: !_termReaded ? null : () => widget.onChangedStep!(2),
                child: Text(
                  'Accepter et Continuer'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
