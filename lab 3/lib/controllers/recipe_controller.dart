import 'package:get/get.dart';
import '../models/recipe.dart';
import '../repositories/data_repository.dart';

class RecipeController extends GetxController {
  final DataRepository _repository = DataRepository();
  
  // Observable variables
  final RxList<Recipe> _allRecipes = <Recipe>[].obs;
  final RxList<Recipe> _filteredRecipes = <Recipe>[].obs;
  final RxString _selectedCategory = 'All'.obs;
  final RxString _searchQuery = ''.obs;
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  // Getters
  List<Recipe> get allRecipes => _allRecipes;
  List<Recipe> get filteredRecipes => _filteredRecipes;
  String get selectedCategory => _selectedCategory.value;
  String get searchQuery => _searchQuery.value;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;

  @override
  void onInit() {
    super.onInit();
    loadRecipes();
  }

  /// Loads recipes asynchronously from JSON file
  Future<void> loadRecipes() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';
      
      final recipes = await _repository.loadRecipes();
      _allRecipes.value = recipes;
      _filteredRecipes.value = recipes;
    } catch (e) {
      _errorMessage.value = 'Failed to load recipes: $e';
      print('Error loading recipes: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  /// Filters recipes by category
  void filterByCategory(String category) {
    _selectedCategory.value = category;
    _applyFilters();
  }

  /// Searches recipes by query
  void searchRecipes(String query) {
    _searchQuery.value = query;
    _applyFilters();
  }

  /// Applies both category and search filters
  void _applyFilters() {
    List<Recipe> filtered = _allRecipes;
    
    // Apply category filter
    if (_selectedCategory.value != 'All') {
      filtered = _repository.filterRecipesByCategory(filtered, _selectedCategory.value);
    }
    
    // Apply search filter
    if (_searchQuery.value.isNotEmpty) {
      filtered = _repository.searchRecipes(filtered, _searchQuery.value);
    }
    
    _filteredRecipes.value = filtered;
  }

  /// Clears all filters
  void clearFilters() {
    _selectedCategory.value = 'All';
    _searchQuery.value = '';
    _filteredRecipes.value = _allRecipes;
  }

  /// Refreshes data
  Future<void> refresh() async {
    await loadRecipes();
  }
}