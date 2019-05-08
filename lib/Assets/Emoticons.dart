class Emoticon {
  String emoji;
  List<String> tags;
  int count = 0;
  int id = null;
  bool favorite = false;

  Emoticon(this.emoji, this.tags);
}

final emoticonsList = [
  new Emoticon("¯\_(ツ)_/¯", ["Other"]),
  new Emoticon("( ͡° ͜ʖ ͡°)", ["Happy"]),
  new Emoticon("ಠ_ಠ", ["Sad"]),
  new Emoticon("(╯°□°）╯︵ ┻━┻", ["Sad", "Other"]),
  new Emoticon("┬──┬◡ﾉ(° -°ﾉ)", ["Other"]),
  new Emoticon("ᕕ( ᐛ )ᕗ", ["Happy"]),
  new Emoticon("༼ つ ◕_◕ ༽つ", ["Sad"]),
  new Emoticon("(☞ﾟヮﾟ)☞", ["Happy"]),
  new Emoticon("ʕ•ᴥ•ʔ", ["Other"]),
  new Emoticon("•ᴗ•", ["Happy"]),
  new Emoticon("ԅ(≖‿≖ԅ) ", ["Happy"]),
  new Emoticon("(╯°□°)╯︵ ʞooqǝɔɐℲ", ["Other"]),
  new Emoticon("ಠᴗಠ", ["Happy"]),
  new Emoticon("(•̀ᴗ•́)و ̑̑ ", ["Happy"]),
  new Emoticon("ಥ_ಥ", ["Sad"]),
];
