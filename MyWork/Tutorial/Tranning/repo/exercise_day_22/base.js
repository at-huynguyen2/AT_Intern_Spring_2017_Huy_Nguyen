function loadPage() {
    console.log('pet');
    var pets = new Set(["Cat", "Dog", "Hamster"]);
    pets["species"] = "mammals";
    for (var pet in pets) {
        console.log(pet); // "species"
    }
    for (var _i = 0, pets_1 = pets; _i < pets_1.length; _i++) {
        var pet = pets_1[_i];
        console.log(pet); // "Cat", "Dog", "Hamster"
    }
}
