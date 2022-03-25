class Car {
  final int speed;
  final int doors;

  const Car({
    this.speed = 120,
    this.doors = 2,
  });

  Car copy({
    int ?speed,
    int ?doors,
  }) =>
      Car(
        speed: speed ?? this.speed,
        doors: doors ?? this.doors,
      );
}