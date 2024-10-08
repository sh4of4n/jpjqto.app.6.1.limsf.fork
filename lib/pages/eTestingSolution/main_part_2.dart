import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'list_part_2.dart';

// ignore: must_be_immutable
class Part2Main extends StatefulWidget {
  const Part2Main({super.key});

  @override
  _Part2MainState createState() => _Part2MainState();
}

class _Part2MainState extends State<Part2Main>
    with AutomaticKeepAliveClientMixin {
  final image = ImagesConstant();
  final localStorage = LocalStorage();

  int? marksCM = 0;
  int? marksDM = 0;
  int? marksEM = 0;
  int? marksFM = 0;
  int? marksGM = 0;
  int? marksHM = 0;

  int? marksC = 0;
  int? marksD = 0;
  int? marksE = 0;
  int? marksF = 0;
  int? marksG = 0;
  int marksH = 0;
  int? marksB = 0;

  _getBMark() async {
    int? markB = await localStorage.getPart2MarkSessionB();
    int? markCM = await localStorage.getPart2MarkCM();
    int? markDM = await localStorage.getPart2MarkDM();
    int? markEM = await localStorage.getPart2MarkEM();
    int? markFM = await localStorage.getPart2MarkFM();
    int? markGM = await localStorage.getPart2MarkGM();
    int? markHM = await localStorage.getPart2MarkHM();

    int? deductMarkC = await localStorage.getCountMarkC();
    int? deductMarkD = await localStorage.getCountMarkD();
    int? deductMarkE = await localStorage.getCountMarkE();
    int? deductMarkF = await localStorage.getCountMarkF();
    int? deductMarkG = await localStorage.getCountMarkG();

    setState(() {
      marksB = markB;
      marksC = deductMarkC;
      marksD = deductMarkD;
      marksE = deductMarkE;
      marksF = deductMarkF;
      marksG = deductMarkG;

      marksCM = markCM;
      marksDM = markDM;
      marksEM = markEM;
      marksFM = markFM;
      marksGM = markGM;
      marksHM = markHM;
    });
  }

  refresh() {
    setState(() {
      _getBMark();
    });
  }

  @override
  void initState() {
    super.initState();
    _getBMark();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      /*appBar: AppBar(
        title: Text('RSM',style: TextStyle(color: Colors.black),),
      ),
      drawer: RPKDrawer(),*/

      /*body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount: data.length,
      ),*/
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // _header(),
            //RpkSessionA(),
            Padding(
              padding: const EdgeInsets.only(bottom: 1, top: 2),
              //child: RsmSessionB(notifyParent: refresh,title: 'B',expansionTileB: ExpansionTile(initiallyExpanded: true,)),
              child: SessionB(notifyParent: refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: SessionC(notifyParent: refresh),
              //child: RsmSessionC(notifyParent: refresh,title: 'C',expansionTileC: ExpansionTile(initiallyExpanded: true,)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: SessionD(notifyParent: refresh),
              //child: RsmSessionD(notifyParent: refresh,title: 'D',expansionTileD: ExpansionTile(initiallyExpanded: true,)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: SessionE(notifyParent: refresh),
              //child: RsmSessionE(notifyParent: refresh,title: 'E',expansionTileE: ExpansionTile(initiallyExpanded: true,)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: SessionF(notifyParent: refresh),
              //child: RsmSessionF(notifyParent: refresh,title: 'F',expansionTileF: ExpansionTile(initiallyExpanded: true,)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: RsmSessionG(notifyParent: refresh),
              //child: RsmSessionG(notifyParent: refresh,title: 'G',expansionTileG: ExpansionTile(initiallyExpanded: true,)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: RsmSessionH(notifyParent: refresh),
              //child: RsmSessionH(notifyParent: refresh,title: 'H',expansionTileH: ExpansionTile(initiallyExpanded: false,)),
            ),

            SizedBox(
              height: ScreenUtil().setHeight(100),
            ),

            Table(
              border: TableBorder.all(color: Colors.grey),
              children: [
                TableRow(children: [
                  Center(
                      child: Text(
                          AppLocalizations.of(context)!
                              .translate('session_lbl'),
                          style: const TextStyle(color: Colors.black))),
                  Center(
                      child: Text(
                          AppLocalizations.of(context)!
                              .translate('normal_mistake_mark'),
                          style: const TextStyle(color: Colors.black))),
                  Center(
                      child: Text(
                          AppLocalizations.of(context)!
                              .translate('mandatory_mistake_mark'),
                          style: const TextStyle(color: Colors.black))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('B', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksB',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/20', style: TextStyle(color: Colors.black)),
                      ]))),
                  const Center(
                      child: Text('-', style: TextStyle(color: Colors.black))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('C', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksC',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/6', style: TextStyle(color: Colors.black)),
                      ]))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksCM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/4', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('D', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksD',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/6', style: TextStyle(color: Colors.black)),
                      ]))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksDM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/4', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('E', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksE',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/6', style: TextStyle(color: Colors.black)),
                      ]))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksEM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/5', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('F', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksF',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/8', style: TextStyle(color: Colors.black)),
                      ]))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksFM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/5', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('G', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksG',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/5', style: TextStyle(color: Colors.black)),
                      ]))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksGM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/7', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('H', style: TextStyle(color: Colors.black))),
                  const Center(
                      child: Text('-', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksHM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/5', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(100),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  localStorage.setPart2MarkSessionB(0);
                  localStorage.setPart2MarkSessionC(0);
                  localStorage.setPart2MarkSessionD(0);
                  localStorage.setPart2MarkSessionE(0);
                  localStorage.setPart2MarkSessionF(0);
                  localStorage.setPart2MarkSessionG(0);

                  //mandatory marks
                  localStorage.setPart2MarkSessionBM(0);
                  localStorage.setPart2MarkCM(0);
                  localStorage.setPart2MarkDM(0);
                  localStorage.setPart2MarkEM(0);
                  localStorage.setPart2MarkFM(0);
                  localStorage.setPart2MarkGM(0);

                  //normal marks
                  localStorage.setPart2MarkB(0);
                  localStorage.setPart2MarkC(0);
                  localStorage.setPart2MarkD(0);
                  localStorage.setPart2MarkE(0);
                  localStorage.setPart2MarkF(0);
                  localStorage.setPart2MarkG(0);
                  localStorage.setPart2MarkH(0);

                  refresh();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  backgroundColor: ColorConstant.primaryColor,
                  minimumSize: const Size(88, 36),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.translate('submit_btn'),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(300),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
