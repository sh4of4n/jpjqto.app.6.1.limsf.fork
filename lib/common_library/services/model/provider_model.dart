import 'package:flutter/material.dart';

class LanguageModel extends ChangeNotifier {
  String language;

  void selectedLanguage(String lang) {
    language = '($lang)';

    notifyListeners();
  }
}

class CallStatusModel extends ChangeNotifier {
  bool status = false;

  void callStatus(bool status) {
    this.status = status;

    notifyListeners();
  }
}

class HomeLoadingModel extends ChangeNotifier {
  bool isLoading = false;

  void loadingStatus(bool isLoading) {
    this.isLoading = isLoading;

    notifyListeners();
  }
}

class JrSessionModel extends ChangeNotifier {
  int a1,
      a2,
      a3,
      a4,
      a5,
      a6,
      a7,
      a8,
      a9,
      a10,
      a11,
      a12,
      a13,
      a14,
      a15,
      a16,
      a17,
      a18,
      a19,
      a20,
      a21,
      a22,
      a23,
      a24;

  int b1,
      b2,
      b3,
      b4,
      b5,
      b6,
      b7,
      b8,
      b9,
      b10,
      b11,
      b12,
      b13,
      b14,
      b15,
      b16,
      b17,
      b18,
      b19,
      b20;

  int c1, c2, c3, c4, c5, c6, c7, c8, c9, c10;

  int d1,
      d2,
      d3,
      d4,
      d5,
      d6,
      d7,
      d8,
      d9,
      d10,
      d11,
      d12,
      d13,
      d14,
      d15,
      d16,
      d17,
      d18;

  int e1,
      e2,
      e3,
      e4,
      e5,
      e6,
      e7,
      e8,
      e9,
      e10,
      e11,
      e12,
      e13,
      e14,
      e15,
      e16,
      e17,
      e18,
      e19,
      e20;

  int f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14;

  int g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12;

  int h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12;

  int i1, i2, i3, i4, i5, i6, i7, i8, i9, i10;

  int j1, j2, j3, j4, j5;

  void setResultA({
    a1,
    a2,
    a3,
    a4,
    a5,
    a6,
    a7,
    a8,
    a9,
    a10,
    a11,
    a12,
    a13,
    a14,
    a15,
    a16,
    a17,
    a18,
    a19,
    a20,
    a21,
    a22,
    a23,
    a24,
  }) {
    this.a1 = a1;
    this.a2 = a2;
    this.a3 = a3;
    this.a4 = a4;
    this.a5 = a5;
    this.a6 = a6;
    this.a7 = a7;
    this.a8 = a8;
    this.a9 = a9;
    this.a10 = a10;
    this.a11 = a11;
    this.a12 = a12;
    this.a13 = a13;
    this.a14 = a14;
    this.a15 = a15;
    this.a16 = a16;
    this.a17 = a17;
    this.a18 = a18;
    this.a19 = a19;
    this.a20 = a20;
    this.a21 = a21;
    this.a22 = a22;
    this.a23 = a23;
    this.a24 = a24;

    notifyListeners();
  }

  void setResultB({
    b1,
    b2,
    b3,
    b4,
    b5,
    b6,
    b7,
    b8,
    b9,
    b10,
    b11,
    b12,
    b13,
    b14,
    b15,
    b16,
    b17,
    b18,
    b19,
    b20,
  }) {
    this.b1 = b1;
    this.b2 = b2;
    this.b3 = b3;
    this.b4 = b4;
    this.b5 = b5;
    this.b6 = b6;
    this.b7 = b7;
    this.b8 = b8;
    this.b9 = b9;
    this.b10 = b10;
    this.b11 = b11;
    this.b12 = b12;
    this.b13 = b13;
    this.b14 = b14;
    this.b15 = b15;
    this.b16 = b16;
    this.b17 = b17;
    this.b18 = b18;
    this.b19 = b19;
    this.b20 = b20;

    notifyListeners();
  }

  void setResultC({
    c1,
    c2,
    c3,
    c4,
    c5,
    c6,
    c7,
    c8,
    c9,
    c10,
  }) {
    this.c1 = c1;
    this.c2 = c2;
    this.c3 = c3;
    this.c4 = c4;
    this.c5 = c5;
    this.c6 = c6;
    this.c7 = c7;
    this.c8 = c8;
    this.c9 = c9;
    this.c10 = c10;

    notifyListeners();
  }

  void setResultD({
    d1,
    d2,
    d3,
    d4,
    d5,
    d6,
    d7,
    d8,
    d9,
    d10,
    d11,
    d12,
    d13,
    d14,
    d15,
    d16,
    d17,
    d18,
  }) {
    this.d1 = d1;
    this.d2 = d2;
    this.d3 = d3;
    this.d4 = d4;
    this.d5 = d5;
    this.d6 = d6;
    this.d7 = d7;
    this.d8 = d8;
    this.d9 = d9;
    this.d10 = d10;
    this.d11 = d11;
    this.d12 = d12;
    this.d13 = d13;
    this.d14 = d14;
    this.d15 = d15;
    this.d16 = d16;
    this.d17 = d17;
    this.d18 = d18;

    notifyListeners();
  }

  void setResultE({
    e1,
    e2,
    e3,
    e4,
    e5,
    e6,
    e7,
    e8,
    e9,
    e10,
    e11,
    e12,
    e13,
    e14,
    e15,
    e16,
    e17,
    e18,
    e19,
    e20,
  }) {
    this.e1 = e1;
    this.e2 = e2;
    this.e3 = e3;
    this.e4 = e4;
    this.e5 = e5;
    this.e6 = e6;
    this.e7 = e7;
    this.e8 = e8;
    this.e9 = e9;
    this.e10 = e10;
    this.e11 = e11;
    this.e12 = e12;
    this.e13 = e13;
    this.e14 = e14;
    this.e15 = e15;
    this.e16 = e16;
    this.e17 = e17;
    this.e18 = e18;
    this.e19 = e19;
    this.e20 = e20;

    notifyListeners();
  }

  void setResultF({
    f1,
    f2,
    f3,
    f4,
    f5,
    f6,
    f7,
    f8,
    f9,
    f10,
    f11,
    f12,
    f13,
    f14,
  }) {
    this.f1 = f1;
    this.f2 = f2;
    this.f3 = f3;
    this.f4 = f4;
    this.f5 = f5;
    this.f6 = f6;
    this.f7 = f7;
    this.f8 = f8;
    this.f9 = f9;
    this.f10 = f10;
    this.f11 = f11;
    this.f12 = f12;
    this.f13 = f13;
    this.f14 = f14;

    notifyListeners();
  }

  void setResultG({
    g1,
    g2,
    g3,
    g4,
    g5,
    g6,
    g7,
    g8,
    g9,
    g10,
    g11,
    g12,
  }) {
    this.g1 = g1;
    this.g2 = g2;
    this.g3 = g3;
    this.g4 = g4;
    this.g5 = g5;
    this.g6 = g6;
    this.g7 = g7;
    this.g8 = g8;
    this.g9 = g9;
    this.g10 = g10;
    this.g11 = g11;
    this.g12 = g12;

    notifyListeners();
  }

  void setResultH({
    h1,
    h2,
    h3,
    h4,
    h5,
    h6,
    h7,
    h8,
    h9,
    h10,
    h11,
    h12,
  }) {
    this.h1 = h1;
    this.h2 = h2;
    this.h3 = h3;
    this.h4 = h4;
    this.h5 = h5;
    this.h6 = h6;
    this.h7 = h7;
    this.h8 = h8;
    this.h9 = h9;
    this.h10 = h10;
    this.h11 = h11;
    this.h12 = h12;

    notifyListeners();
  }

  void setResultI({
    i1,
    i2,
    i3,
    i4,
    i5,
    i6,
    i7,
    i8,
    i9,
    i10,
  }) {
    this.i1 = i1;
    this.i2 = i2;
    this.i3 = i3;
    this.i4 = i4;
    this.i5 = i5;
    this.i6 = i6;
    this.i7 = i7;
    this.i8 = i8;
    this.i9 = i9;
    this.i10 = i10;

    notifyListeners();
  }

  void setResultJ({
    j1,
    j2,
    j3,
    j4,
    j5,
  }) {
    this.j1 = j1;
    this.j2 = j2;
    this.j3 = j3;
    this.j4 = j4;
    this.j5 = j5;

    notifyListeners();
  }

  String getRpkResults() {
    return '''{
      "Result": [{
        "rpk01": "$a1",
        "rpk02": "$a2",
        "rpk03": "$a3",
        "rpk04": "$a4",
        "rpk05": "$a5",
        "rpk06": "$a6",
        "rpk07": "$a7",
        "rpk08": "$a8",
        "rpk09": "$a9",
        "rpk10": "$a10",
        "rpk11": "$a11",
        "rpk12": "$a12",
        "rpk13": "$a13",
        "rpk14": "$a14",
        "rpk15": "$a15",
        "rpk16": "$a16",
        "rpk17": "$a17",
        "rpk18": "$a18",
        "rpk19": "$a19",
        "rpk20": "$a20",
        "rpk21": "$a21",
        "rpk22": "$a22",
        "rpk23": "$a23",
        "rpk24": "$a24"
      }]
    }''';
  }

  String getJrResults() {
    return '''{
      "Result": [{
        "a01": "$b1",
        "a02": "$b2",
        "a03": "$b3",
        "a04": "$b4",
        "a05": "$b5",
        "a06": "$b6",
        "a07": "$b7",
        "a08": "$b8",
        "a09": "$b9",
        "a10": "$b10",
        "a11": "$b11",
        "a12": "$b12",
        "a13": "$b13",
        "a14": "$b14",
        "a15": "$b15",
        "a16": "$b16",
        "a17": "$b17",
        "a18": "$b18",
        "a19": "$b19",
        "a20": "$b20",
        "b01": "$c1",
        "b02": "$c2",
        "b03": "$c3",
        "b04": "$c4",
        "b05": "$c5",
        "b06": "$c6",
        "b07": "$c7",
        "b08": "$c8",
        "b09": "$c9",
        "b10": "$c10",
        "c01": "$d1",
        "c02": "$d2",
        "c03": "$d3",
        "c04": "$d4",
        "c05": "$d5",
        "c06": "$d6",
        "c07": "$d7",
        "c08": "$d8",
        "c09": "$d9",
        "c10": "$d10",
        "c11": "$d11",
        "c12": "$d12",
        "c13": "$d13",
        "c14": "$d14",
        "c15": "$d15",
        "c16": "$d16",
        "c17": "$d17",
        "c18": "$d18",
        "d01": "$e1",
        "d02": "$e2",
        "d03": "$e3",
        "d04": "$e4",
        "d05": "$e5",
        "d06": "$e6",
        "d07": "$e7",
        "d08": "$e8",
        "d09": "$e9",
        "d10": "$e10",
        "d11": "$e11",
        "d12": "$e12",
        "d13": "$e13",
        "d14": "$e14",
        "d15": "$e15",
        "d16": "$e16",
        "d17": "$e17",
        "d18": "$e18",
        "d19": "$e19",
        "d20": "$e20",
        "e01": "$f1",
        "e02": "$f2",
        "e03": "$f3",
        "e04": "$f4",
        "e05": "$f5",
        "e06": "$f6",
        "e07": "$f7",
        "e08": "$f8",
        "e09": "$f9",
        "e10": "$f10",
        "e11": "$f11",
        "e12": "$f12",
        "e13": "$f13",
        "e14": "$f14",
        "f01": "$g1",
        "f02": "$g2",
        "f03": "$g3",
        "f04": "$g4",
        "f05": "$g5",
        "f06": "$g6",
        "f07": "$g7",
        "f08": "$g8",
        "f09": "$g9",
        "f10": "$g10",
        "f11": "$g11",
        "f12": "$g12",
        "g01": "$h1",
        "g02": "$h2",
        "g03": "$h3",
        "g04": "$h4",
        "g05": "$h5",
        "g06": "$h6",
        "g07": "$h7",
        "g08": "$h8",
        "g09": "$h9",
        "g10": "$h10",
        "g11": "$h11",
        "g12": "$h12",
        "h01": "$i1",
        "h02": "$i2",
        "h03": "$i3",
        "h04": "$i4",
        "h05": "$i5",
        "h06": "$i6",
        "h07": "$i7",
        "h08": "$i8",
        "h09": "$i9",
        "h10": "$i10",
        "i01": "$j1",
        "i02": "$j2",
        "i03": "$j3",
        "i04": "$j4",
        "i05": "$j5"
      }]
    }''';
  }
}

class RpkSessionModel extends ChangeNotifier {
  int rpk1,
      rpk2,
      rpk3,
      rpk4,
      rpk5,
      rpk6,
      rpk7,
      rpk8,
      rpk9,
      rpk10,
      rpk11,
      rpk12,
      rpk13,
      rpk14,
      rpk15,
      rpk16,
      rpk17,
      rpk18,
      rpk19,
      rpk20,
      rpk21,
      rpk22,
      rpk23,
      rpk24;

  void setRpkResult({
    rpk1,
    rpk2,
    rpk3,
    rpk4,
    rpk5,
    rpk6,
    rpk7,
    rpk8,
    rpk9,
    rpk10,
    rpk11,
    rpk12,
    rpk13,
    rpk14,
    rpk15,
    rpk16,
    rpk17,
    rpk18,
    rpk19,
    rpk20,
    rpk21,
    rpk22,
    rpk23,
    rpk24,
  }) {
    this.rpk1 = rpk1;
    this.rpk2 = rpk2;
    this.rpk3 = rpk3;
    this.rpk4 = rpk4;
    this.rpk5 = rpk5;
    this.rpk6 = rpk6;
    this.rpk7 = rpk7;
    this.rpk8 = rpk8;
    this.rpk9 = rpk9;
    this.rpk10 = rpk10;
    this.rpk11 = rpk11;
    this.rpk12 = rpk12;
    this.rpk13 = rpk13;
    this.rpk14 = rpk14;
    this.rpk15 = rpk15;
    this.rpk16 = rpk16;
    this.rpk17 = rpk17;
    this.rpk18 = rpk18;
    this.rpk19 = rpk19;
    this.rpk20 = rpk20;
    this.rpk21 = rpk21;
    this.rpk22 = rpk22;
    this.rpk23 = rpk23;
    this.rpk24 = rpk24;

    notifyListeners();
  }

  String getRpkResult() {
    return '''
    {
      "Result": [{
        "rpk01": "$rpk1",
        "rpk02": "$rpk2",
        "rpk03": "$rpk3",
        "rpk04": "$rpk4",
        "rpk05": "$rpk5",
        "rpk06": "$rpk6",
        "rpk07": "$rpk7",
        "rpk08": "$rpk8",
        "rpk09": "$rpk9",
        "rpk10": "$rpk10",
        "rpk11": "$rpk11",
        "rpk12": "$rpk12",
        "rpk13": "$rpk13",
        "rpk14": "$rpk14",
        "rpk15": "$rpk15",
        "rpk16": "$rpk16",
        "rpk17": "$rpk17",
        "rpk18": "$rpk18",
        "rpk19": "$rpk19",
        "rpk20": "$rpk20",
        "rpk21": "$rpk21",
        "rpk22": "$rpk22",
        "rpk23": "$rpk23",
        "rpk24": "$rpk24"
      }]
    }
    ''';
  }
}
