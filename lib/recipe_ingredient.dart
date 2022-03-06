class Recipe {
  String? name;
  String? glass;
  String? category;
  List<Ingredients>? ingredients;
  String? garnish;
  String? preparation;

  Recipe(
      {this.name,
        this.glass,
        this.category,
        this.ingredients,
        this.garnish,
        this.preparation});

  Recipe.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    glass = json['glass'];
    category = json['category'] ?? "No category";
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredients.fromJson(v));
      });
    }
    garnish = json['garnish'];
    preparation = json['preparation'];
  }
  @override
  String toString() {
    // TODO: implement toString
    var buffer = StringBuffer();
    buffer.write('Glass: ' + glass.toString());
    if(category!="No category"){
      buffer.write('\n' + category.toString() );
    }
    buffer.write('\n\nIngredients:' + ingredients.toString());
    if(garnish!=null){
      buffer.write('\n\nGarnish: \n' + garnish.toString());
    }
    buffer.write('\n\nPreparation: \n' + preparation.toString());
    return buffer.toString().replaceAll("[", "").replaceAll(", ", "").replaceAll("]", "");
  }
}

class Ingredients {
  String? unit;
  var amount;
  String? ingredient;
  String? label;
  String? special;

  Ingredients({this.unit, this.amount, this.ingredient, this.label, this.special});

  Ingredients.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    amount = json['amount'];
    ingredient = json['ingredient'];
    label = json['label'] ?? "";
    special = json['special']?? "";
  }
  @override
  String toString() {
    // TODO: implement toString
    var sb = StringBuffer();
    if(special!=""){
      sb.write('\n' + special.toString());
    }
    else {
      sb.write('\n' +
          amount.toString() + unit.toString() + " " + ingredient.toString());
      if (label != "") {
        sb.write(' label:' + label.toString());
      }
    }
    return sb.toString();
  }
}