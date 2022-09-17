import 'package:book_store/common/save_checker.dart';
import 'package:book_store/models/default_book_Model.dart';
import 'package:book_store/services/backed_services/get_top_rated_seller_new_arrival.dart';
import 'package:get/get.dart';

class GetTopSellerRatedNewArrival {
  static Rx<int> refresh = 0.obs;
  static changeLists() async {
    await GetNewArrivalBooks.getBooks();
    List<dynamic> data = GetNewArrivalBooks.booksBody;
    BookModel.newArrivalBookList = [];
    for (int i = 0; i < data.length; i++) {
      BookModel.newArrivalBookList.add(BookModel(
        imageUrl: data[i]['bookImageUrl'].toString(),
        rating: double.parse(data[i]['rate']),
        title: data[i]['name'],
        author: data[i]['author']['name'],
        price: double.parse(data[i]['price']),
        description: (data[i]['description']).toString(),
        language: data[i]['language'],
        pages: data[i]['pages'],
        id: (data[i]['id']),
        saved: saveChecker(data[i]['id']),
      ));
    }

    refresh.value = 1;
    await GetTopRatedBooks.getBooks();
    List<dynamic> data1 = GetTopRatedBooks.booksBody;
    BookModel.topRatedBookList = [];

    for (int i = 0; i < data1.length; i++) {
      BookModel.topRatedBookList.add(BookModel(
        imageUrl: data1[i]['bookImageUrl'].toString(),
        rating: double.parse(data1[i]['rate']),
        title: data1[i]['name'],
        author: data1[i]['author']['name'],
        price: double.parse(data1[i]['price']),
        description: (data1[i]['description']).toString(),
        language: data1[i]['language'],
        pages: data1[i]['pages'],
        id: (data1[i]['id']),
        saved: saveChecker(data1[i]['id']),
      ));
    }

    refresh.value = 0;
    await GetTopSellerBooks.getBooks();
    List<dynamic> data2 = GetTopSellerBooks.booksBody;
    BookModel.topSellerBookList = [];
    for (int i = 0; i < data2.length; i++) {
      BookModel.topSellerBookList.add(BookModel(
        imageUrl: data2[i]['bookImageUrl'].toString(),
        rating: double.parse(data2[i]['rate']),
        title: data2[i]['name'],
        author: data2[i]['author']['name'],
        price: double.parse(data2[i]['price']),
        description: (data2[i]['description']).toString(),
        language: data2[i]['language'],
        pages: data2[i]['pages'],
        id: (data2[i]['id']),
        saved: saveChecker(data2[i]['id']),
      ));
    }

    refresh.value = 2;
  }
}



    // BookModel.newArrivalBookList = [
    //   BookModel(
    //     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp2hmVoM_vMrFcJOTuQrhq0GQgrDCMlhLv3ei54PHq&s',
    //     rating: 4,
    //     title: '   ddddddd   dddسييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييي ييييييييddddddddddddddddddddddddddd',
    //     author: 'NEW',
    //     description: 'idkjndlkdjfnv;kjn',
    //     price: 5,
    //     id: 0,
    //     language: '',
    //     pages: 2,
    //   ),
    //   BookModel(
    //     imageUrl: 'https://images.unsplash.com/photo-1566275529824-cca6d008f3da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80',
    //     rating: 5,
    //     title: ' ddddd dddddddddddddd dddddddddddd',
    //     author: 'NEW',
    //     description: '2',
    //     price: 5,
    //     language: 'English',
    //     id: 0,
    //     pages: 2,
    //   ),
    //   BookModel(
    //     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-JUjJifI_U5X-Fp_G1fEdrYozUuK4j0FgkBbIfKE&s',
    //     rating: 5,
    //     title: 'how is FAIR',
    //     author: 'NEW',
    //     description: '2',
    //     price: 5,
    //     language: 'English',
    //     id: 0,
    //     pages: 2,
    //   ),
    // ];
 // BookModel.topRatedBookList = [
    //   BookModel(
    //     imageUrl: 'https://images.unsplash.com/photo-1600885832003-1b612b431f7f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHJlc3R8ZW58MHx8MHx8&w=1000&q=80',
    //     rating: 4,
    //     title: 'TOP',
    //     author: 'TOP',
    //     description: 'idkjndlkdjfnv;kjn',
    //     price: 5,
    //     id: 0,
    //     language: '',
    //     pages: 2,
    //   ),
    //   BookModel(
    //     imageUrl: 'https://images.unsplash.com/photo-1600885832003-1b612b431f7f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHJlc3R8ZW58MHx8MHx8&w=1000&q=80',
    //     rating: 5,
    //     title: 'TOP',
    //     author: 'TOP',
    //     description: '2',
    //     price: 5,
    //     language: 'English',
    //     id: 0,
    //     pages: 2,
    //   ),
    // ];
// BookModel.topSellerBookList = [
    //   BookModel(
    //     imageUrl: 'https://i.pinimg.com/564x/60/53/71/60537197052b1e259dda1c379a91b545.jpg',
    //     rating: 4,
    //     title: 'TOP',
    //     author: 'TOP',
    //     description: 'idkjndlkdjfnv;kjn',
    //     price: 5,
    //     id: 0,
    //     language: '',
    //     pages: 2,
    //   ),
    //   BookModel(
    //     imageUrl: 'https://i.pinimg.com/564x/60/53/71/60537197052b1e259dda1c379a91b545.jpg',
    //     rating: 5,
    //     title: 'TOP',
    //     author: 'TOP',
    //     description: '2',
    //     price: 5,
    //     language: 'English',
    //     id: 0,
    //     pages: 2,
    //   ),
    // ];