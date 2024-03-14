abstract class Person {
  String _id;
  String _nama;
  String _email;

  Person(this._id, this._nama, this._email);

  String get id => _id;
  String get nama => _nama;
  String get email => _email;

  set nama(String newName) {
    _nama = newName;
  }

  set email(String newEmail) {
    _email = newEmail;
  }
}
