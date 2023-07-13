abstract class socialStates {}

class socialInitial extends socialStates{}

class socialGetUserLoading extends socialStates{}

class socialGetUserSuccess extends socialStates{}

class socialGetUserErorr extends socialStates{
  final erorr;

  socialGetUserErorr(this.erorr);
}
class changeBottomNva extends socialStates{}

class socialNewPost extends socialStates{}

class socialPickedImageSuccess extends socialStates{}

class socialPickedImageErorr extends socialStates{}

class socialPickedCoverSuccess extends socialStates{}

class socialPickedCoverErorr extends socialStates{}

class socialUpLoadProfileImageSuccess extends socialStates{}

class socialUpLoadProfileImageErorr extends socialStates{}

class socialUpLoadCoverImageSuccess extends socialStates{}

class socialUpLoadCoverImageErorr extends socialStates{}

class socialUpdateUserLoading extends socialStates{}

class socialUpdateUserErorr extends socialStates{}
