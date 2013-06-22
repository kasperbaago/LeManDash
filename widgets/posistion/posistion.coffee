class Dashing.Posistion extends Dashing.Widget

  ready: ->
    # This is fired when the widget is done being rendered

  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.
    data = JSON.parse(data.data);
    cars = data[1];
    shownItems = 3;
    list = [ ];

    for car of cars
      carData = cars[car];

      team = tabEngages[carData[9]];
      teamCarData = tabVehicules[team.voiture];
      carMarque = tabMarques[teamCarData.marque];

      driver = tabPilotes[carData[0]];
      category = tabCategories[team.categorie];


      drivers = [ ];
      i = 0;
      for pilots of team.pilotes
        if carData[0] == team.pilotes[pilots]
          continue;
        drivers[i] = tabPilotes[team.pilotes[pilots]];
        i++;

      console.log(team);
      console.log(teamCarData);


      list[car] = {
        posistion: car,
        car: carMarque + " - " + teamCarData.nom,
        driver: driver,
        drivers: drivers,
        besttime: carData[5],
        average: carData[8],
        carNumber: team.num,
        carclass: category.nom,
        laps: carData[2],
        lastLab: carData[6],
      }

      if car >= shownItems
        break;

    console.log(list);
    @set('cars', list);
