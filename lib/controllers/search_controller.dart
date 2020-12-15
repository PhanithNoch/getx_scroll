import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:getmoneyxapp/data/model/public_people.dart';
import 'package:getmoneyxapp/data/repositories/people_repository.dart';
import 'package:flutter/material.dart';
enum Status { loading, success, error }
enum loadRequestStatus { loading, onGoing, loaded, error, notFound }
enum searchRequestStatus { loading, onGoing, loaded, error, notFound }

class SearchController extends GetxController {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollViewController = ScrollController();
  bool isScrollingDown = false;
  bool isLoading = false;
  bool showAppbar;
//  final status = Status.loading.obs;
  final searchRequestStatus = loadRequestStatus.loading.obs;
  bool isSearching = false;
  MyRepository repository = MyRepository();
  PublicPeople _people;
  List<Data> get people => _people.data;
  set people(value) => this._people.data = value;
  List lstPeople = [].obs;
  int lastPage = 1, currentPage = 0;
  int pageNumber = 1;
  int limit = 10;
  var activeIndex;
  bool hasNext = true;


  onListScroll()
  {
    print('on scroll');
    scrollViewController.addListener(() {
      if (scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          showAppbar = false;
          update();
        }
      }

      if (scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          showAppbar = true;
          update();
        }
      }
    });

  }

  @override
  void onClose() {
    scrollViewController.dispose();
    scrollViewController.removeListener(() {});
    super.onClose();

  }

  @override
  void onInit() async {

    showAppbar = true;
    onListScroll();
    searchRequestStatus(loadRequestStatus.loading);

    await loadPeople();
    update();
  }

  Future<void> searchPeople() async {
    searchRequestStatus(loadRequestStatus.loading);
    if (searchController.text.isNotEmpty) {
      List<Data> tempList = new List();
      print('search typing : ${searchController.text}');
      lstPeople = [];
      isLoading = true;
      _people = await repository.getAll(
          pageNumber: pageNumber, limit: limit, searchKeyboard: searchController.text);

      if (_people != null) {
        currentPage = _people.meta.currentPage;
        lastPage = _people.meta.lastPage;
        for (int i = 0; i < _people.data.length; i++) {
          tempList.add(_people.data[i]);
        }
        lstPeople.addAll(tempList);
      }
      lastPage = 1;
      pageNumber = 1;
      currentPage = 0;
      searchRequestStatus(loadRequestStatus.loaded);

//        if (currentPage == lastPage) {
//          hasNext = false;
//        }

      isLoading = false;
      update();
    }
  }

  Future<void> loadPeople({bool isBack = false, bool isReload = false}) async {
    List<Data> tempList = new List();

    if (isReload == true) {
      lstPeople = [];
      lastPage = 1;
      pageNumber = 1;
      currentPage = 0;
      print("currentPage : $currentPage");
      print('lastPage : $lastPage');
      if (currentPage == lastPage) {
        hasNext = true;
      }
      if(lstPeople.isEmpty)
        {
          hasNext = true;
        }
      print('is reload ...');

      print('hasNext : $hasNext');
    }
    if (isBack == true) {
      searchRequestStatus(loadRequestStatus.loading);
    }
    if (isBack == false && pageNumber >= 1) {
      if (currentPage <= lastPage && hasNext == true && isBack != true) {
        isLoading = true;
        _people = await repository.getAll(
            pageNumber: pageNumber, limit: limit, searchKeyboard: "");

        if (_people != null) {
          currentPage = _people.meta.currentPage;
          lastPage = _people.meta.lastPage;
          for (int i = 0; i < _people.data.length; i++) {
            tempList.add(_people.data[i]);
          }
          lstPeople.addAll(tempList);
        }

        searchRequestStatus(loadRequestStatus.loaded);
        print('lastPage : $lastPage');
        print("currentPage $currentPage");
        print("page Number:  $pageNumber");
        pageNumber += 1;
        isLoading = false;
        print("searchLoading : $isLoading");

        if (currentPage == lastPage) {
          hasNext = false;
        }
      }
      isReload = false;
    }

    isBack = false;
    isLoading = false;
    update();
  }



  onClearTextField()
  {
    if(searchController.text.isNotEmpty)
      {
        searchController.text = '';
      }
  }
}
