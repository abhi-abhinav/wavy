import 'package:wavy/consts/consts.dart';
import 'package:wavy/views/auth_screen/login_screen.dart';
import 'package:wavy/views/home_screen/home.dart';
import 'package:wavy/widgets_common/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // creating a method to change screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      // using getX
      /* Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      ); */
      auth.authStateChanges().listen((User) {
        if (User == null && mounted) {
          Get.to(() => const LoginScreen());
        } else {
          Get.to(() => const Home());
        }
      });
    });
  }

  late Image image1;
  @override
  void initState() {
    changeScreen();
    super.initState();
    image1 = Image.asset("assets/icons/bg1.png");
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _buildPortraitLayout();
          } else {
            return _buildLandscapeLayout();
          }
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/rmbg.png", width: 300),
          const SizedBox(height: 20),
          applogoWidget(),
          const SizedBox(height: 10),
          appname.text.fontFamily(bold).size(22).white.make(),
          const SizedBox(height: 5),
          appversion.text.white.make(),
          const Spacer(),
          credits.text.white.fontFamily(semibold).make(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/rmbg.png", width: 150),
              const SizedBox(width: 20),
              applogoWidget(),
            ],
          ),
          const SizedBox(height: 10),
          appname.text.fontFamily(bold).size(22).white.make(),
          const SizedBox(height: 5),
          appversion.text.white.make(),
          const Spacer(),
          credits.text.white.fontFamily(semibold).make(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
