import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:tpq1/pages/login_page.dart';

// PENGAJAR
import 'package:tpq1/pages/pengajar/main_page.dart' as PengajarMain;
import 'package:tpq1/pages/pengajar/profil_biodata_page.dart' as PengajarBiodata;
import 'package:tpq1/pages/pengajar/profil_kontak_page.dart' as PengajarKontak;
import 'package:tpq1/pages/pengajar/profil_akun_page.dart' as PengajarAkun;
import 'package:tpq1/pages/pengajar/santri_detail_page.dart' as PengajarSantri;

// SANTRI
import 'package:tpq1/pages/santri/main_page.dart' as SantriMain;
import 'package:tpq1/providers/auth_provider.dart';
import 'package:tpq1/providers/santri_provider.dart';

import 'pages/splash_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => SantriProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/login': (context) => LoginPage(),
          '/pengajar/main': (context) => PengajarMain.MainPage(),
          '/pengajar/biodata': (context) => PengajarBiodata.ProfilBiodataPage(),
          '/pengajar/kontak': (context) => PengajarKontak.ProfilKontakPage(),
          '/pengajar/akun': (context) => PengajarAkun.ProfilAkunPage(),
          '/santri/main': (context) => SantriMain.MainPage(),
        },
      ),
    );
  }
}

