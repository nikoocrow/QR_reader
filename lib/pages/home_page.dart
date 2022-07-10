import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: (){},
             icon: Icon(Icons.delete_forever_rounded)
            )
        ],
      ),
      body: _HomePageBody(),
     bottomNavigationBar: CustomNavigationBar(),
     floatingActionButton: ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
  }
}


class _HomePageBody extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {


   //Optener el selected Opt
   final uiProvider = Provider.of<UiProvider>(context); 

   // Cuando cambia el Tab muestra la página respectiva
   final currentIndex = uiProvider.selectedMenuOpt;

   //TODO Temporal leer la base de datos
   final tempScan = new ScanModel(valor: 'https://www.homeserviceguide.pro');
   //Insertar
   //DBProvider.db.nuevoScan(tempScan);
   //Consultar
   //DBProvider.db.getScanById(10).then((scan) => print(scan!.valor));
   //DBProvider.db.getTodosLosScans().then(print);
   // Borar datos
   //DBProvider.db.deleteAllScans().then(print);
  

   
   switch(currentIndex){
   
   case 0:
    return MapasPage();
   case 1:
    return DireccionesPage();
   
   default:
    return MapasPage();

    }
  }
}