import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

/*
Para usar a função é necessário circundar o widget, ao qual se quer
converter, por RepaintBoundary e setar o parametro key com a mesma GlobalKey
que deve ser passada na função capturePng.
*/

Future<File> capturePng(GlobalKey globalKey) async {
  try {
    final RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;

    final ui.Image image = await boundary.toImage(pixelRatio: 3);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    //Cria o diretório interno - não temos acesso
    // final String dir = (await getApplicationDocumentsDirectory()).path;

    //PARA SALVAR NA IMAGEM NA GALERIA
    // final directoryExternal = await getExternalStorageDirectory();
    // final myImagePath = '${directoryExternal!.path}/Images';

    //funcionando - cria o arquivo no diretório padrão
    //final File file = await File('$dir/image.jpg').create();
    final File file =
        await File('/storage/emulated/0/Pictures/image.jpg').create();

    file.writeAsBytesSync(pngBytes);

    return file;
  } catch (e) {
    rethrow;
  }
}
