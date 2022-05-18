class ProfileListViewModel {
  final String image1;
  final String text1;
  ProfileListViewModel({required this.image1, required this.text1});
}

List<ProfileListViewModel> profilelist = [
  ProfileListViewModel(image1: 'images/service1.jpg', text1: 'Deep\nCleaning'),
  ProfileListViewModel(
      image1: 'images/Servicebnr.jpg', text1: 'Resdential\nDisinfection'),
  ProfileListViewModel(
      image1: 'images/service4.jpg', text1: 'Commercial\nDisinfection'),
  ProfileListViewModel(image1: 'images/slider.jpg', text1: 'Interior\nCleaning')
];
