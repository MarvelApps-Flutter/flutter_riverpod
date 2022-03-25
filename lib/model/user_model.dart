class User {
  final String urlAvatar;
  final String name;
  final int age;
  final String gender;

  const User({
    required this.urlAvatar,
    required this.name,
    required this.age,
    required this.gender,
  });
}

class UserData{
  final users = [
  const User(
    urlAvatar:
        'https://wallpapercave.com/wp/wp4326783.jpg',
    name: 'Rebbecca',
    age: 19,
    gender: 'female',
  ),
  const User(
    urlAvatar:
        'https://i.pinimg.com/550x/8d/4f/44/8d4f442214edc01230b38228bad5226f.jpg',
    name: 'Freya',
    age: 20,
    gender: 'female',
  ),
  const User(
    urlAvatar:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOOlvCzpMQub0HxfCNcjIYmDwm2Nc6glVoBg&usqp=CAU',
    name: 'Camile',
    age: 22,
    gender: 'female',
  ),
  const User(
    urlAvatar:
        'https://wallpaperaccess.com/full/1869451.jpg',
    name: 'Elijah',
    age: 24,
    gender: 'male',
  ),
  const User(
    urlAvatar:
        'https://images.wondershare.com/filmora/article-images/11-satoru-gojo.jpg',
    name: 'Kol',
    age: 23,
    gender: 'male',
  ),
  const User(
    urlAvatar:
        'https://i.pinimg.com/564x/ec/b3/3b/ecb33b57f259a45c042fd70a66d25b12.jpg',
    name: 'Klaus',
    age: 25,
    gender: 'male',
  ),
];

}