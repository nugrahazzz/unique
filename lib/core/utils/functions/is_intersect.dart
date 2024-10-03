part of 'global_functions.dart';

///Untuk memeriksa apakah elemen sama antara dua list yang diberikan.
bool isIntersect(List listOne, List listTwo) {
  return listOne.toSet().intersection(listTwo.toSet()).isNotEmpty;
}
