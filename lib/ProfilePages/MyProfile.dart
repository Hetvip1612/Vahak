// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'package:http_parser/http_parser.dart';
import 'package:vahak_clone/Api/AlertDialog.dart';
import 'package:vahak_clone/Api/Api.dart';
import 'package:vahak_clone/ProfilePages/EditProfile.dart';
import 'package:vahak_clone/ProfilePages/Model/UserProfileData.dart';
import 'package:vahak_clone/ProfilePages/Profilewidgets/NumberPickerDailog.dart';
import 'package:vahak_clone/ProfilePages/Profilewidgets/bottompicker_sheet.dart';
import 'package:vahak_clone/ProfilePages/Profilewidgets/user_add_address.dart';
import 'package:vahak_clone/ProfilePages/Profilewidgets/user_info_widget.dart';
import 'package:vahak_clone/ProfilePages/Profilewidgets/user_show_compayaddress_list.dart';

typedef parentFunctionCallback = void Function(String value);
var editcover_image;
var editprofile_image;
var company_name="Company Name";
var user_roll="Roll";
var location="location";
var company_bio="company_bio";
File? _image;
    File? _image_profile;
    List<Officeaddress> transaction1 = [];

    List<Officeaddress> transaction = [];

  List <Routes> route=[];
class MyProfile extends StatefulWidget {
 
  // const MyProfile({
  //   Key? key,
  //   required this.list,
  // }) : super(key: key);
 
 // List<Address?> list;

  //MyProfile(this.list);
  @override
  State<StatefulWidget> createState() {
    return MyProfileScreen();
  }
}

class MyProfileScreen extends State<MyProfile> {
  bool address_empaty=false; 
    bool address_data=false; 
    bool routes_data=false; 
        bool postload_data=false; 
  var postload;
    // List<Address?> list;

    // MyProfileScreen(this.list);


     @override
       initState(){
            super.initState();
             
           
       }
  
  int _currentValue = 1;


 final ImagePicker _picker = ImagePicker();
  

  bool uploadStatus = false;
 _imageFromGallery1() async {
    final PickedFile? pickedImage =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedImage == null) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "No Image was selected.");
      return;
    }
    final File fileImage = File(pickedImage.path);
    if (imageConstraint(fileImage))
      setState(() {
        _image_profile = fileImage;
        upload_userprofile_coverpic(_image_profile,_image,_image_profile!.path);
      });
  }


 _imageFromGallery_Cover() async {
    final PickedFile? pickedImage =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedImage == null) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "No Image was selected.");
      return;
    }
    final File fileImage = File(pickedImage.path);
    if (imageConstraint(fileImage)) {
      setState(() {
        _image = fileImage;
                upload_userprofile_coverpic1(_image_profile,_image,_image!.path);

      });
    }
  }

  bool imageConstraint(File image) {
    if (!['bmp', 'jpg', 'jpeg']
        .contains(image.path.split('.').last.toString())) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "Image format should be jpg/jpeg/bmp.");
      return false;
    }
    if (image.lengthSync() > 100000) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "Image Size should be less than 100KB.");
      return false;
    }
    return true;
  }
List<UserProfileData> address = [];

Future getProfileUserData(BuildContext context) async {
  Map<String, String> headers = {
    // "Authorization":"Bearer $token",
    // "Content-type": "multipart/form-data"
    'Content-Type': 'application/json',
    'authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzODM0Njc1LCJpYXQiOjE2NzIyOTg2NzUsImp0aSI6IjFmMGQxMGM5ZDM4ZjQ3Y2E4OTNhNGFjZGRlOWUyMGYwIiwidXNlcl9pZCI6MTF9.hOEQI708-Hd2nt4eurXM4NieKlKLvDgaJ_wx0npbiGs'
  };
  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.viewsprofile);

  var response = await http.get(url, headers: headers);
  print(response);
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    editprofile_image = jsonData[0]['profile_image'];

    List data = jsonData[0]['officeaddress'];
 
    editcover_image = jsonData[0]['cover_image'];
    company_name = jsonData[0]['name'];

    user_roll = jsonData[0]['services'][0];
    location = jsonData[0]['city'];
     List data1=jsonData[0]['routes'];
    postload=jsonData[0]['postload'];
    print(postload);
    route=[];
    for (var items in data1) {
      
      route.add(Routes.fromJson(items));
    }
    if(postload.toString().isNotEmpty){
      postload_data=true;
    }
    if(route.isNotEmpty){
      routes_data=true;
    }
    print(route);
    
    
    
    
    
    
    
    
    
    
    
    
    print(company_name);
    print(location);
    print(data);
        print(route);

 transaction=[];
    for (var item in data) {
      
      transaction.add(Officeaddress.fromJson(item));
    }
    print(transaction);
    
  }
  setState(() {
    
  });
// Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => MyProfile(
//               list,
//             )));
  // return transaction;
}



  @override
  Widget build(BuildContext context) {
    transaction.clear;
    route.clear;
          getProfileUserData(context);
    Size size = MediaQuery.of(context).size;
    if(transaction.isNotEmpty){
       address_data=true;
      address_empaty=false;
    }else{
      address_empaty=true;
    }
    return Scaffold(
                resizeToAvoidBottomInset : false,

      body: SafeArea(
        
        child: Column(children: [
          
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                _getImageField,
                buildUserImage(size),
                buildUserInfo(company_name,user_roll,location),
                NumberPickerDailog(),


                
            Visibility(
              visible: postload_data,
              child: Card(
                         
                            
                                child: SizedBox(
                               width: 100,
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                          
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
            
                                Icon(Icons.gif_box),
                                Text(postload.toString() ),
                              ],
                            ),
                           Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: Text("Loads posted",style: TextStyle(fontSize: 12),),
                           )
                                    ],
                                   )),
                              ),
            ),
               //Company_BIO(),
              //  companybio(context),
                Visibility(
                  visible:address_empaty ,
                  
                  child: add_useraddress(context)),
                  Visibility(
                    visible: address_data,
                    child:   show_compayaddress_list(context,transaction,transaction.length),),

                    // Visibility(
                    //   visible: routes_data,
                    //   child: user_routes(route)
                    // )
               Visibility(
                 visible: routes_data,
                 child: Align(
                  alignment: Alignment.centerLeft,
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                 
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 10),
                        child: Text("Routes Operating"+" ("+route.length.toString()+")",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                       Padding(
                         padding: EdgeInsets.only(top: 10,left: 10),
                          child: Container(
                           height: 50,
                          // width: double.infinity,
                            child: Expanded(
                               child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount:route.length,
                        // ignore: prefer_const_constructors
                        itemBuilder: (BuildContext context, int index) => Card(
                       
                          
                              child: SizedBox(
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                        
                                    Text(route[index].name ),
                        
                                  ],
                                 )),
                            ),
                               ),
                             ),
                          ),
                        ),
                     ],
                   ),
                 ),
               )

                
        
              ],
            ),
          )),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // First child is TextInput
              Align(
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 150, height: 40),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all(
                      //     Color.fromARGB(255, 26, 82, 236)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                    ),
                    onPressed: () async {
                      //getUserData();
                       Navigator.of(context)
           .push(MaterialPageRoute(builder: (context) => EditProfileScreen()));
                    },
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("Edit Profile".toUpperCase())),
                  ),
                ),
              )

           
            ]),
          )
        ]),
      ),
    );
  }
 buildUserImage(size) {
  return Stack(
    children: [
      Container(
        width: size.width,
        height: 200,
        color: Colors.transparent,
        padding: EdgeInsets.only(bottom: 150 / 2.2),
        child: InkWell(
          onTap: () {
            print("object");
     bottomPickerSheet(
                              context,  _imageFromGallery_Cover);

            
          },
          child: Container(
            width: size.width,
            height: 150,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(10, 10),
                  bottomRight: Radius.elliptical(10, 10)),
              image: DecorationImage(
                  image:_image != null
                              ? FileImage(_image!)
                                : editcover_image != null
                                      ? NetworkImage(
                                          'http://192.168.1.22:8008' +
                                              editcover_image)
                                      
                                      : AssetImage('images/user.png')as ImageProvider,
                // image: NetworkImage(
                //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg8CzAfl_AEsQ9SqfH_byy8Ozh00wdGBd3tjLMOrlEmWhdLhCq&s"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ), 
      ),

      // * 1 backbutton (Row widget)
      // Row(
      //   children: [
      //     IconButton(
      //       color: Colors.white,
      //       onPressed: () {},
      //       icon: Icon(Icons.arrow_back),
      //     )
      //   ],
      // ),

      // * user profile image
      Positioned(
        top: 180 / 2,
        left: size.width / 12,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 3),
              shape: BoxShape.circle),
          child: InkWell(
          onTap: () {
            print("object");
     bottomPickerSheet1(
                              context,  _imageFromGallery1);

            
          },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: _image_profile != null
                              ? FileImage(_image_profile!)
                              : editprofile_image != null
                                      ? NetworkImage(
                                          'http://192.168.1.22:8008' +
                                              editprofile_image)
                              : AssetImage('images/user.png')as ImageProvider,
              // backgroundImage: NetworkImage(
              //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSATP5C4Iti8iYFIwldjqZA3Tz_6efOBTvQCHc8xIL-WQkkLQ&s"),
            ),
          ),
        ),
      ),
       Positioned(
         top: 300 / 2,
        left: size.width / 1.3,
        child:Icon(Icons.remove_red_eye_rounded,color: ApiConstants.purple,)),
      Positioned(
         top: 300 / 2,
        left: size.width / 1.2,
        child: Padding(padding: EdgeInsets.only(left: 5,top: 2),
          child: Text("views",style: TextStyle(fontSize: 16.0),)))
    ],
  );
}

  get _getImageField {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: IconButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }), icon: Icon(Icons.arrow_back)),
              ),
              Text("My Profile",
                  style: TextStyle(fontSize: 15.0), textAlign: TextAlign.center)
            ],
          ),
        )
      ],
    );
  }

}

void bottomPickerSheet1(BuildContext context, 
    Function _imageFromGallery) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
         child: Wrap(
          children: [
            // ListTile(
            //   leading: Icon(Icons.photo_camera),
            //   title: Text('Camera'),
            //   onTap: () {
            //     _imageFromCamera();
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                _imageFromGallery();
                Navigator.pop(context);
              },
            )
          ],
        ));
      });
}


 
Future<int> upload_userprofile_coverpic(file, filenames,  image_profile) async {
  ///MultiPart request

  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.viewsprofile);
  var request = http.MultipartRequest(
    'PUT',
    url,
  );
  print(file);
  Map<String, String> headers = {
    // "Authorization":"Bearer $token",
    // "Content-type": "multipart/form-data"
    'Content-Type': 'application/json',
    'authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzODM0Njc1LCJpYXQiOjE2NzIyOTg2NzUsImp0aSI6IjFmMGQxMGM5ZDM4ZjQ3Y2E4OTNhNGFjZGRlOWUyMGYwIiwidXNlcl9pZCI6MTF9.hOEQI708-Hd2nt4eurXM4NieKlKLvDgaJ_wx0npbiGs'
  };
  request.files.add(
    http.MultipartFile(
      'profile_image',
      file.readAsBytes().asStream(),
      file.lengthSync(),
      filename: image_profile.toString(),
      contentType: MediaType('image', 'jpeg'),
    ),
  );
 
  request.headers.addAll(headers);
 
  print("request: " + request.toString());
  var res = await request.send();

  var responseString = await res.stream.bytesToString();
  final decodedMap = json.decode(responseString);

  print("This is response:" + decodedMap.toString());
  return res.statusCode;
}
Future<int> upload_userprofile_coverpic1(file, filenames,  image_profile) async {
  ///MultiPart request

  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.viewsprofile);
  var request = http.MultipartRequest(
    'PUT',
    url,
  );
  print(file);
  Map<String, String> headers = {
    // "Authorization":"Bearer $token",
    // "Content-type": "multipart/form-data"
    'Content-Type': 'application/json',
    'authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzODM0Njc1LCJpYXQiOjE2NzIyOTg2NzUsImp0aSI6IjFmMGQxMGM5ZDM4ZjQ3Y2E4OTNhNGFjZGRlOWUyMGYwIiwidXNlcl9pZCI6MTF9.hOEQI708-Hd2nt4eurXM4NieKlKLvDgaJ_wx0npbiGs'
  };
  // request.files.add(
  //   http.MultipartFile(
  //     'profile_image',
  //     file.readAsBytes().asStream(),
  //     file.lengthSync(),
  //     filename: image_profile.toString(),
  //     contentType: MediaType('image', 'jpeg'),
  //   ),
  // );
   request.files.add(
    http.MultipartFile(
      'cover_image',
      filenames.readAsBytes().asStream(),
      filenames.lengthSync(),
      filename: image_profile.toString(),
      contentType: MediaType('image', 'jpeg'),
    ),
  );
  request.headers.addAll(headers);
 
  print("request: " + request.toString());
  var res = await request.send();

  var responseString = await res.stream.bytesToString();
  final decodedMap = json.decode(responseString);

  print("This is response:" + decodedMap.toString());
  return res.statusCode;
}
