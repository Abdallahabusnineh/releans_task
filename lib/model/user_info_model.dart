class UserInfoModel
{
  String?email;
  String? uid;
  String? name;

   UserInfoModel.fromJson(Map<String, dynamic> json) {
     email=json['email'];
     uid=json['uid'];
     name=json['name'];
   }
}