import 'package:flutter/material.dart';

class ImageBelts{
  final String image;
  final Color color;
  final String description;
  ImageBelts(
    this.image,
    this.color,
    this.description,
  );
}

class Belts{
  final String name;
  final String category; 
  final String price;
  final int puntuation;
  final List<ImageBelts> listImage;
  Belts(
    this.name,
    this.category,
    this.price,
    this.puntuation,
    this.listImage,
  );
}