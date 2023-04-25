import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wavy/consts/consts.dart';
import 'package:wavy/controllers/auth_controller.dart';
import 'package:wavy/controllers/profile_controller.dart';
import 'package:wavy/services/firestore_services.dart';
import 'package:wavy/views/auth_screen/login_screen.dart';
import 'package:wavy/views/profile_screen/components/details_card.dart';
import 'package:wavy/views/profile_screen/edit_profile_screen.dart';
import 'package:wavy/widgets_common/bg_widget.dart';

import '../../consts/lists.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    var logout = "Logout";
    return bgWidget(
        child: Scaffold(
            body: StreamBuilder(
                stream: FirestoreServices.getUser(currentUser!.uid),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      ),
                    );
                  } else {
                    var data = snapshot.data!.docs[0];
                    return SafeArea(
                        child: Column(
                      children: [
                        // edit profile button
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.edit,
                              color: whiteColor,
                            ),
                          ).onTap(() {
                            controller.nameController.text = data['name'];
                            Get.to(() => EditProfileScreen(data: data));
                          }),
                        ),

                        //user details section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              data['imageUrl'] == ''
                                  ? Image.asset(imgProfile2,
                                          width: 100, fit: BoxFit.cover)
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make()
                                  : Image.network(data['imageUrl'],
                                          width: 100, fit: BoxFit.cover)
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .color(Colors.purple.shade500)
                                      .shadowMd
                                      .make(),
                              10.widthBox,
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${data['name']}"
                                      .text
                                      .fontFamily(bold)
                                      .black
                                      .make(),
                                  "${data['email']}".text.black.make(),
                                ],
                              )),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.purple[100],
                                      side: const BorderSide(
                                        color: Colors.black,
                                      )),
                                  onPressed: () async {
                                    await Get.put(AuthController())
                                        .signoutMethod(context);
                                    Get.offAll(() => const LoginScreen());
                                  },
                                  child:
                                      logout.text.fontFamily(bold).black.make())
                            ],
                          ),
                        ),
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            detailsCard(
                                count: data['cart_count'],
                                title: "In your cart",
                                width: context.screenWidth / 3.4),
                            detailsCard(
                                count: data['wishlist_count'],
                                title: "In your wishlist",
                                width: context.screenWidth / 3.4),
                            detailsCard(
                                count: data['order_count'],
                                title: "Your orders",
                                width: context.screenWidth / 3.4),
                          ],
                        ),

                        //buttons section
                        ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    color: lightGrey,
                                  );
                                },
                                itemCount: profileButtonsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: Image.asset(
                                      profileButtonsIcon[index],
                                      width: 22,
                                    ),
                                    title: profileButtonsList[index]
                                        .text
                                        .fontFamily(semibold)
                                        .color(darkFontGrey)
                                        .make(),
                                  );
                                })
                            .box
                            .white
                            .rounded
                            .margin(const EdgeInsets.all(12))
                            .padding(const EdgeInsets.symmetric(horizontal: 16))
                            .shadowSm
                            .make()
                            .box
                            .color(Vx.purple50)
                            .make(),
                      ],
                    ));
                  }
                })));
  }
}
