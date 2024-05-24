class OnBoardDataModel {
  String? imageUrl;
  String? title;
  String? description;

  OnBoardDataModel({this.imageUrl, this.title, this.description});
}

List onBoardList = [
  OnBoardDataModel(
      imageUrl: "assets/onBoard/onboard1.jpg",
      title: "Welcome To Your Travel App",
      description: "Our App is very Userfriendly.Hope u like it."),
  OnBoardDataModel(
      imageUrl: "assets/onBoard/onboard2.jpg",
      title: "Book Your Ticket",
      description: "Our App is very Userfriendly.Hope u like it."),
  OnBoardDataModel(
      imageUrl: "assets/onBoard/onboard3.jpg",
      title: "Enjoy Your Vacation",
      description: "Our App is very Userfriendly.Hope u like it."),
];
