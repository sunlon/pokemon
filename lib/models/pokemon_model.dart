import 'package:equatable/equatable.dart';

class PokemonModel extends Equatable {
  String? name;
  String? id;
  String? imageurl;
  String? xdescription;
  String? ydescription;
  String? height;
  String? category;
  String? weight;
  List<String>? typeofpokemon;
  List<String>? weaknesses;
  List<String>? evolutions;
  List<String>? abilities;
  int? hp;
  int? attack;
  int? defense;
  int? specialAttack;
  int? specialDefense;
  int? speed;
  int? total;
  String? malePercentage;
  String? femalePercentage;
  int? genderless;
  String? cycles;
  String? eggGroups;
  String? evolvedfrom;
  String? reason;
  String? baseExp;
  String? error;
  bool? favorite;
  PokemonModel(
      {this.name,
      this.id,
      this.imageurl,
      this.xdescription,
      this.ydescription,
      this.height,
      this.category,
      this.weight,
      this.typeofpokemon,
      this.weaknesses,
      this.evolutions,
      this.abilities,
      this.hp,
      this.attack,
      this.defense,
      this.specialAttack,
      this.specialDefense,
      this.speed,
      this.total,
      this.malePercentage,
      this.femalePercentage,
      this.genderless,
      this.cycles,
      this.eggGroups,
      this.evolvedfrom,
      this.reason,
      this.baseExp,
      this.favorite});

  PokemonModel.withError(String errorMessage) {
    error = errorMessage;
  }
  PokemonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    imageurl = json['imageurl'];
    xdescription = json['xdescription'];
    ydescription = json['ydescription'];
    height = json['height'];
    category = json['category'];
    weight = json['weight'];
    typeofpokemon = json['typeofpokemon'].cast<String>();
    weaknesses = json['weaknesses'].cast<String>();
    evolutions = json['evolutions'].cast<String>();
    abilities = json['abilities'].cast<String>();
    hp = json['hp'];
    attack = json['attack'];
    defense = json['defense'];
    specialAttack = json['special_attack'];
    specialDefense = json['special_defense'];
    speed = json['speed'];
    total = json['total'];
    malePercentage = json['male_percentage'];
    femalePercentage = json['female_percentage'];
    genderless = json['genderless'];
    cycles = json['cycles'];
    eggGroups = json['egg_groups'];
    evolvedfrom = json['evolvedfrom'];
    reason = json['reason'];
    baseExp = json['base_exp'];
    favorite = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['id'] = id;
    data['imageurl'] = imageurl;
    data['xdescription'] = xdescription;
    data['ydescription'] = ydescription;
    data['height'] = height;
    data['category'] = category;
    data['weight'] = weight;
    data['typeofpokemon'] = typeofpokemon;
    data['weaknesses'] = weaknesses;
    data['evolutions'] = evolutions;
    data['abilities'] = abilities;
    data['hp'] = hp;
    data['attack'] = attack;
    data['defense'] = defense;
    data['special_attack'] = specialAttack;
    data['special_defense'] = specialDefense;
    data['speed'] = speed;
    data['total'] = total;
    data['male_percentage'] = malePercentage;
    data['female_percentage'] = femalePercentage;
    data['genderless'] = genderless;
    data['cycles'] = cycles;
    data['egg_groups'] = eggGroups;
    data['evolvedfrom'] = evolvedfrom;
    data['reason'] = reason;
    data['base_exp'] = baseExp;
    return data;
  }

  PokemonModel copyWith({
    String? name,
    String? id,
    String? imageurl,
    String? xdescription,
    String? ydescription,
    String? height,
    String? category,
    String? weight,
    List<String>? typeofpokemon,
    List<String>? weaknesses,
    List<String>? evolutions,
    List<String>? abilities,
    int? hp,
    int? attack,
    int? defense,
    int? specialAttack,
    int? specialDefense,
    int? speed,
    int? total,
    String? malePercentage,
    String? femalePercentage,
    int? genderless,
    String? cycles,
    String? eggGroups,
    String? evolvedfrom,
    String? reason,
    String? baseExp,
    String? error,
    bool? favorite,
  }) =>
      PokemonModel(
          name: name ?? this.name,
          id: id ?? this.id,
          imageurl: imageurl ?? this.imageurl,
          xdescription: xdescription ?? this.xdescription,
          ydescription: ydescription ?? this.ydescription,
          height: height ?? this.height,
          category: category ?? this.category,
          weight: weight ?? this.weight,
          typeofpokemon: typeofpokemon ?? this.typeofpokemon,
          weaknesses: weaknesses ?? this.weaknesses,
          evolutions: evolutions ?? this.evolutions,
          abilities: abilities ?? this.abilities,
          hp: hp ?? this.hp,
          attack: attack ?? this.attack,
          defense: defense ?? this.defense,
          specialAttack: specialAttack ?? this.specialAttack,
          specialDefense: specialDefense ?? this.specialDefense,
          speed: speed ?? this.speed,
          total: total ?? this.total,
          malePercentage: malePercentage ?? this.malePercentage,
          femalePercentage: femalePercentage ?? this.femalePercentage,
          genderless: genderless ?? this.genderless,
          cycles: cycles ?? this.cycles,
          eggGroups: eggGroups ?? this.eggGroups,
          evolvedfrom: evolvedfrom ?? this.evolvedfrom,
          reason: reason ?? this.reason,
          baseExp: baseExp ?? this.baseExp,
          favorite: favorite ?? this.favorite);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        imageurl,
        xdescription,
        ydescription,
        height,
        category,
        weight,
        typeofpokemon,
        weaknesses,
        evolutions,
        abilities,
        hp,
        attack,
        defense,
        specialAttack,
        specialDefense,
        speed,
        total,
        malePercentage,
        femalePercentage,
        genderless,
        cycles,
        eggGroups,
        evolvedfrom,
        reason,
        baseExp,
        favorite,
      ];
}
