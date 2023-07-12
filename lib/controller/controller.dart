import 'package:get/get.dart';
import 'package:kamppus_merdeka/model/model.dart';

import 'package:kamppus_merdeka/service/service.dart';


class DataController extends GetxController {
  final ApiService _apiService = ApiService();
  final RxList<Data> _users = <Data>[].obs;
  final RxInt _currentPage = 1.obs;
  final RxBool _isLoading = false.obs;

  // ignore: invalid_use_of_protected_member
  List<Data> get users => _users.value;
  int get currentPage => _currentPage.value;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      _isLoading.value = true;

      final List<Data> fetchedUsers = await _apiService.getUsers(currentPage);
      _users.addAll(fetchedUsers);

      _currentPage.value++;
    } catch (e) {
      print(e.toString());
    } finally {
      _isLoading.value = false;
    }
  }
}
