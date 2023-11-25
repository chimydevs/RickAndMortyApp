// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:rickandmortyapp/models/character_model.dart';

class characterScreen extends StatelessWidget {
  final Character character;
  const characterScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(character.name!),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.70,
              width: double.infinity,
              child: Hero(tag: character.id!, child: Image.network(
                character.image!,
                fit: BoxFit.cover,
              )),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: size.height * 0.14,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cardData("Status:", character.status!),
                  cardData("Specie:", character.species!),
                  cardData("Origin:", character.origin!.name!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardData(String text1, String text2){
    return Expanded(child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(text1),
          Text(text2, style: const TextStyle(overflow: TextOverflow.ellipsis),),
        ],
      ),));
  }
}