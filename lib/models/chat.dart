class Chat {
  final String? name;
  final String? lastMesage;
  final String? isActive;
  final String? time;
  final String? coutnMesages;
  final String? image;

  Chat({
    this.name,
    this.lastMesage,
    this.isActive,
    this.time,
    this.coutnMesages,
    this.image,
  });
}

List chatsData = [
  Chat(
      name: "janeth | España",
      lastMesage: "hola janeth",
      time: "9:00 am",
      coutnMesages: "3",
      image: "assets/images/profile.png"),
  Chat(
    name: "shi Yuajari",
    lastMesage: "hola shi",
    time: "8:24 am",
    coutnMesages: "3",
    image: "assets/images/profile.png",
  ),
];
