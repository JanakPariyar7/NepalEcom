import 'package:ecom/common/common_styles.dart';
import 'package:ecom/common/reusable_widgets/reusable_button.dart';
import 'package:ecom/features/personalized/screens/profile/widgets/profile_listing.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(showBackArrow: true, title: Text('Profile')),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              //Heading Section
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Jcircle(
                      circleHeight: 50,
                      circleRadius: 50,
                      circleWidth: 50,
                      child: JroundedImage(
                        imageUrl: JImagesPath.darkLogo,
                        height: 50,
                        width: 50,
                        borderRadius: 50,
                      ),
                    ),
                    SizedBox(height: JSizes.spacebtwnItems),
                    Text('change Profile Picture'),
                  ],
                ),
              ),

              SizedBox(height: JSizes.spacebtwnItems),

              Divider(),

              //Profile Information
              SizedBox(height: JSizes.spacebtwnItems),

              JsectionHeader(
                sectionHeader: 'Profile Information',
                hasSectionButton: false,
                padding: EdgeInsets.zero,
              ),

              SizedBox(height: JSizes.spacebtwnItems),

              JProfileInformation(
                title: 'Name',
                subtitle: 'Janak Pariyar',
                onTap: () {},
              ),

              JProfileInformation(
                title: 'Username',
                subtitle: 'J.P.T',
                onTap: () {},
              ),
              SizedBox(height: JSizes.spacebtwnItems),

              Divider(),

              //Personal information
              SizedBox(height: JSizes.spacebtwnItems),

              JsectionHeader(
                sectionHeader: 'Personal Information',
                hasSectionButton: false,
                padding: EdgeInsets.zero,
              ),

              SizedBox(height: JSizes.spacebtwnItems),

              JProfileInformation(
                title: 'User ID',
                subtitle: '548230',
                onTap: () {},
              ),

              JProfileInformation(
                title: 'Email',
                subtitle: 'Example@gmail.com',
                onTap: () {},
              ),

              JProfileInformation(
                title: 'Phone Number',
                subtitle: '980123456',
                onTap: () {},
              ),
              JProfileInformation(
                title: 'Gender',
                subtitle: 'Male',
                onTap: () {},
              ),

              JProfileInformation(
                title: 'Date of Birth',
                subtitle: '10 Oct 2000',
                onTap: () {},
              ),
              Divider(),

              SizedBox(height: JSizes.spacebtwnItems),

              //close account button
              ReusableButton(
                text: 'Close Account',
                onPressed: () {},
                buttonType: ButtonType.text,
                textColor: Colors.white,
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
