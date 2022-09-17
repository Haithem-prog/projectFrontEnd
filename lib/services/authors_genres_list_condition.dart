import 'package:book_store/models/authors_genres_model_listes.dart';
import 'package:book_store/services/backed_services/get_all_authors.dart';
import 'package:book_store/services/backed_services/get_all_geners.dart';
import 'package:book_store/view/search/components/swapper.dart';
import 'package:get/get.dart';

class ChangeShowedList {
  static Rx<int> refresh = 0.obs;
  static changeList() async {
    if (MySwapper.authorCondition.value == true) {

      await GetAllAuthors.getAuthors();
      List<dynamic> data = GetAllAuthors.authorsBody;
      AuthorsGenresModel.authorsAndGenersList = [];
      for (int i = 0; i < data.length; i++) {
        AuthorsGenresModel.authorsAndGenersList.add(AuthorsGenresModel(
          imageUrl: data[i]['authorImageUrl'].toString(),
          name: data[i]['name'],
        ));
      }

      refresh.value = 1;
    } else {

      await GetAllGenres.getGenres();
      List<dynamic> data = GetAllGenres.genresBody;
      AuthorsGenresModel.authorsAndGenersList = [];
      for (int i = 0; i < data.length; i++) {
        AuthorsGenresModel.authorsAndGenersList.add(AuthorsGenresModel(
          imageUrl: data[i]['genresImageUrl'].toString(),
          name: data[i]['name'],
        ));
      }

      refresh.value = 0;
    }
  }
}



      // AuthorsGenresModel.authorsAndGenersList = [
      //   AuthorsGenresModel(
      //     imageUrl: 'https://m.media-amazon.com/images/I/41gr3r3FSWL.jpg',
      //     name: 'Author1 ahmed',
      //   ),
      //   AuthorsGenresModel(
      //     imageUrl: 'https://media.istockphoto.com/vectors/abstract-minimal-geometric-circle-background-for-business-annual-vector-id1210701957?k=20&m=1210701957&s=612x612&w=0&h=FcOUXSrxlHnJztn-U_JSQ0X-VyyUtLKRV4QXSHfprvs=',
      //     name: 'Author2 ali andul hissiedn',
      //   ),
      // ];
      // AuthorsGenresModel.authorsAndGenersList = [
      //   AuthorsGenresModel(
      //     imageUrl: 'https://m.media-amazon.com/images/I/41gr3r3FSWL.jpg',
      //     name: 'Tragic',
      //   ),
      //   AuthorsGenresModel(
      //     imageUrl: 'https://media.istockphoto.com/vectors/abstract-minimal-geometric-circle-background-for-business-annual-vector-id1210701957?k=20&m=1210701957&s=612x612&w=0&h=FcOUXSrxlHnJztn-U_JSQ0X-VyyUtLKRV4QXSHfprvs=',
      //     name: 'Funny',
      //   ),
      //   AuthorsGenresModel(
      //     imageUrl: 'https://m.media-amazon.com/images/I/41gr3r3FSWL.jpg',
      //     name: 'Supernatural',
      //   ),
      //   AuthorsGenresModel(
      //     imageUrl: 'https://m.media-amazon.com/images/I/41gr3r3FSWL.jpg',
      //     name: 'Supernatural',
      //   ),
      //   AuthorsGenresModel(
      //     imageUrl: 'https://m.media-amazon.com/images/I/41gr3r3FSWL.jpg',
      //     name: 'Supernatural',
      //   ),
      // ];