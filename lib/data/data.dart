import 'package:flutter/material.dart';

class SliderModel {
  String imagePath;
  String title;
  String description;

  SliderModel({this.imagePath, this.title, this.description});

  void setImageAssetPath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDescription() {
    return description;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();

  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setImageAssetPath("assets/images/scp1.jpeg");
  sliderModel.setTitle("Welcome to NHL Rewards");
  sliderModel
      .setDescription(" Folks, Get Your Daily Dose of NHL Rewards here !!! ");

  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setImageAssetPath("assets/images/scpp2.jpg");
  sliderModel.setTitle(" Watch your favourite game Live");
  sliderModel.setDescription(
      " Connect with our Partner Fan Demand and claim  your rewards , Get a chance to watch your favourite game live!!!");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setImageAssetPath("assets/images/scp3.jpg");
  sliderModel.setTitle("Get your Rewards ");
  sliderModel.setDescription(
      "Users have awesome chance to  choose the events, goods, or services they want to pursue. FanDemand stocks the Fan Market accordingly. ");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //4
  sliderModel.setImageAssetPath("assets/images/4.png");
  sliderModel.setTitle("Join the revolution of e-Sports");
  sliderModel.setDescription("Team NHL Partnered with Fan Demand ");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
