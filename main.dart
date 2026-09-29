import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Care',
      home: Furlo(),

    );
  }
}

class Furlo extends StatefulWidget {
  @override
  FurloState createState() => FurloState();
}

class FurloState extends State<Furlo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.green[200],
      appBar: AppBar(
        backgroundColor:Colors.green[200],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset('assets/pets.png'),
            Text('FURLO',
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
            SizedBox(height:10),
            Text('Everything your pet needs,in one place',
              style: TextStyle(fontSize:20),),
            SizedBox(height: 10),
            ElevatedButton(
                style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[200],
                    foregroundColor:Colors.black),
                child: Text('Get Started',style: TextStyle(fontSize: 15)),
                onPressed:(){
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>LoginPage()));
                } ),
          ],
        ),
      ),
    );
  }
}
//Login Page
class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: SingleChildScrollView(
        child:Center(
          child: Column(
            children:<Widget> [
              Container(
                height:585,
                padding: EdgeInsets.all(20),
                child: Form(
                    child:Column(
                      children: <Widget>[
                        Text('WELCOME BACK!',style:TextStyle(fontSize: 30,
                            fontWeight:FontWeight.bold),),
                        Text('Log in to see how Mochi and Biscuit are doing',
                            style:TextStyle(fontSize:15,)),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.email_outlined),
                            hintText: ' Email',
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.password_outlined),
                            hintText:'Password',
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height:20),
                        ElevatedButton(
                            style:ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown[700],
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(7)
                                ),
                                minimumSize: Size(180,45)
                            ) ,
                            child: Text('Log in'),
                            onPressed:(){
                              Navigator.push(context,MaterialPageRoute(
                                  builder: (context)=>HomePage()));
                            } ),
                        Row(children: <Widget>[
                          Padding(padding:EdgeInsets.only(left:16.0),
                            child: Text('New to Furlo?'),),
                          TextButton(onPressed:(){
                            Navigator.push(context,MaterialPageRoute(
                                builder: (context)=>Register()));},
                            child:Text('Create an account'),)
                        ],
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Register
class Register extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}
class RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body:SingleChildScrollView(
        child:Center(
          child: Column(
              children:<Widget> [
                Container(
                  height:585,
                  padding: EdgeInsets.all(20),
                  child:Form(
                    key:formKey,
                    child: Column(
                      children: <Widget>[
                        Text('Create Account',style:TextStyle(fontSize: 30,
                            fontWeight:FontWeight.bold),),
                        Padding(padding: EdgeInsets.all(20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon:Icon(Icons.person) ,
                              labelText: 'Name',
                              hintText: 'Enter your full name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(20),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              icon:Icon(Icons.email_outlined) ,
                              labelText: 'Email',
                              hintText: 'Enter your Email',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) =>
                            value == null || !value.contains('@')
                                ? 'Enter a valid email'
                                : null,
                            onSaved: (value) => email = value!,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(20),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              icon:Icon(Icons.password_outlined),
                              labelText: 'Password',
                              hintText: 'Enter your Password',
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            validator: (value) =>
                            value!.length < 6
                                ? 'Password must be at least 6 characters'
                                : null,
                            onSaved: (value) => password = value!,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(20),
                          child: TextFormField(
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              icon:Icon(Icons.password_sharp),
                              labelText: 'Confirm password',
                              hintText: 'Enter same password',
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value != passwordController.text) {
                                return 'Password do not match';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:Colors.orange[200],
                                foregroundColor:Colors.black ,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(7)
                                ),
                                minimumSize: Size(180,45)
                            ),
                            child: Text('Register',style:TextStyle(fontSize: 15),),
                            onPressed: () {
                              if (formKey.currentState!.validate())
                              {formKey.currentState!.save();
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => OnboardingScreen()));
                              }}),
                        SizedBox(height: 10),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:Colors.orange[200] ,
                                foregroundColor:Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(7)
                                ),
                                minimumSize: Size(180,45)
                            ),
                            child: Text('Reset',style: TextStyle(fontSize: 15),),
                            onPressed: () {
                              formKey.currentState!.reset();
                              emailController.clear();
                              passwordController.clear();
                              confirmPasswordController.clear();
                            }
                        )
                      ],
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
//OnBoarding
class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() {
    return _OnboardingScreenState();
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  int index = 0;

  void nextSlide() {
    if (index < 2) {
      setState(() {
        index++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    String title = "";
    String body = "";
    IconData icon = Icons.pets;
    Color color = Colors.green;

    if (index == 0) {
      title = "Track every tail wag";
      body = "Keep weight, vaccinations, and vet notes for each pet.";
      icon = Icons.pets;
      color = Colors.green;
    }

    if (index == 1) {
      title = "Book trusted care nearby";
      body = "Find vets, groomers, and sitters and book in a few taps.";
      icon = Icons.favorite;
      color = Colors.blue;
    }

    if (index == 2) {
      title = "Never miss a moment";
      body = "Get reminders for meals, meds, and check-ups on time.";
      icon = Icons.calendar_today;
      color = Colors.orange;
    }

    return Scaffold(
      body: Column(
        children: [

          SizedBox(height: 80),

          Container(
            width: 150,
            height: 150,

            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              size: 60,
              color: color,
            ),
          ),

          SizedBox(height: 20),

          Text(title,style: TextStyle(
            fontSize: 22,fontWeight: FontWeight.bold,
          ),
          ),

          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.all(30),
            child: Text(body,textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),

          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: index == 0 ? 18 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: index == 0
                      ? Colors.green
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(width: 8),
              Container(
                width: index == 1 ? 18 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: index == 1
                      ? Colors.green
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(width: 8),
              Container(
                width: index == 2 ? 18 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: index == 2
                      ? Colors.green
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: nextSlide,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                index == 2 ? "Get Started" : "Next",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//Home
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool notifications = true;
  bool locationCare = true;
  bool isDark = false;

  void changeTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'My pets',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFFFF3E0),
                        child: Text('🐱', style: TextStyle(fontSize: 20)),
                      ),
                      title: Text('Mochi',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      trailing: Icon(Icons.chevron_right, color: Colors.grey),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ServicePage()));
                      },
                    ),
                    Divider(height: 1, color: Color(0xFFE0E0E0)),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFE8F0EC),
                        child: Text('🐶', style: TextStyle(fontSize: 20)),
                      ),
                      title: Text('Biscuit',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      trailing: Icon(Icons.chevron_right, color: Colors.grey),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ServicePage()));
                      },
                    ),
                    Divider(height: 1, color: Color(0xFFE0E0E0)),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFE8F0EC),
                        child: Icon(Icons.add, color: Color(0xFF3D6B4F)),
                      ),
                      title: Text('Add another pet',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      trailing: Icon(Icons.chevron_right, color: Colors.grey),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Preferences', style: TextStyle(fontSize: 20)),
              SwitchListTile(
                secondary: Icon(Icons.notifications, color: Color(0xFFE0A100)),
                title: Text('Notifications'),
                value: notifications,
                activeColor: Color(0xFF234E32),
                onChanged: (value) => setState(() => notifications = value),
              ),
              SwitchListTile(
                secondary: Icon(Icons.location_on, color: Color(0xFFD9534F)),
                title: Text('Location for nearby care'),
                value: locationCare,
                activeColor: Color(0xFF234E32),
                onChanged: (value) => setState(() => locationCare = value),
              ),
              SwitchListTile(
                secondary: Icon(Icons.nightlight_round, color: Color(0xFFE0A100)),
                title: Text('Dark mode'),
                value: isDark,
                activeColor: Color(0xFF234E32),
                onChanged: (value) => setState(() => isDark = value),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Service
class ServicePage extends StatefulWidget {
  @override
  ServicePageState createState() => ServicePageState();
}
class ServicePageState extends State<ServicePage> {
  int selectedFilterIndex = 0;
  final List<String> categories = ['Walking', 'Grooming', 'Boarding', 'Training'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFFAF7F2),
      appBar: AppBar(
        title: Text('Services', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme:IconThemeData(color: Colors.black),
      ),
      body: ListView(padding:EdgeInsets.all(16.0),
        children: [
          SizedBox(height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedFilterIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilterIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration:Duration(milliseconds: 200),
                    margin:  EdgeInsets.only(right: 8.0),
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: isSelected ?  Color(0xFF234E32) : Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: isSelected ? Color(0xFF234E32) : Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          if (selectedFilterIndex == 0) ...[
            Card(
              child: ListTile(
                leading:  CircleAvatar(
                  backgroundColor: Color(0xFFFAF7F2),
                  child: Text('🐈', style: TextStyle(fontSize: 20)),
                ),
                title: Text("Cat Walking",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('⭐ 4.9 • 2.1 km'),
                trailing: Text('\$18/hr',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),

            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFFAF7F2),
                  child: Text('🐕', style: TextStyle(fontSize: 20)),
                ),
                title: Text('Dog Walking',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('⭐ 4.5 • 3.4 km'),
                trailing: Text('\$15/hr',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
          if (selectedFilterIndex == 1) ...[
            Card(
              child: ListTile(
                leading:CircleAvatar(
                  backgroundColor: Color(0xFFFAF7F2),
                  child: Text('✂️', style: TextStyle(fontSize: 20)),
                ),
                title:Text('Fluff & Fold Grooming',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('⭐ 4.8 • 1.8 km'),
                trailing: Text('\$45',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFFAF7F2),
                  child: Text('🛁', style: TextStyle(fontSize: 20)),
                ),
                title: Text('Paws Spa & Wash',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('⭐ 4.7 • 2.9 km'),
                trailing: Text('\$40',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
          if (selectedFilterIndex == 2) ...[
            Card(
              child: ListTile(
                leading:CircleAvatar(
                  backgroundColor: Color(0xFFFAF7F2),
                  child: Text('🏠', style: TextStyle(fontSize: 20)),
                ),
                title:Text('Cozy Paws Boarding',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle:Text('⭐ 4.9 • 4.0 km'),
                trailing: Text('\$32/night',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFFAF7F2),
                  child: Text('🏡', style: TextStyle(fontSize: 20)),
                ),
                title: Text('Happy Tails Pet Resort',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('⭐ 4.6 • 5.1 km'),
                trailing: Text('\$35/night',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
          if (selectedFilterIndex == 3) ...[
            const Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFFAF7F2),
                  child: Text('🎓', style: TextStyle(fontSize: 20)),
                ),
                title: Text('K9 Obedience Training',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('⭐ 5.0 • 5.2 km'),
                trailing: Text('\$50/hr',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFFAF7F2),
                  child: Text('🐶', style: TextStyle(fontSize: 20)),
                ),
                title: Text('Puppy School Academy',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('⭐ 4.8 • 3.0 km'),
                trailing: Text('\$45/hr',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
          SizedBox(height: 12),
          GestureDetector(
            onTap: () {},
            child: Card(
              child: Padding(
                padding:EdgeInsets.symmetric(vertical: 14.0),
                child: Center(
                  child: Column(children:<Widget> [
                    TextButton(child: Text( 'Request a booking',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed:(){Navigator.push(context,MaterialPageRoute(
                          builder: (context)=>Booking()));},
                    ),
                  ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//Booking
class Booking extends StatefulWidget {
  @override
  BookingState createState() => BookingState();
}

class BookingState extends State<Booking> {
  bool CatWalking= false;
  bool DogWalking= false;
  bool FluffGrooming= false;
  bool Washing= false;
  bool CozyPawsBoarding= false;
  bool HappyTailsPetResort= false;
  bool K9ObedienceTraining= false;
  bool PuppySchoolAcademy= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.orange[200],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('Walking',style: TextStyle(fontSize: 30)),
            CheckboxListTile(value: CatWalking,
                title:Text('Cat Walking'),
                secondary:Icon(Icons.pets),
                onChanged: (bool? value){
                  setState(() {
                    CatWalking=value?? false;
                  });
                }),
            CheckboxListTile(value: DogWalking,
                title:Text('Dog Walking'),
                secondary:Icon(Icons.house_siding),
                onChanged: (bool? value){
                  setState(() {
                    DogWalking=value?? false;
                  });
                }),
            SizedBox(height: 10),
            Text('Grooming',style: TextStyle(fontSize: 30)),
            CheckboxListTile(value:  FluffGrooming,
                title:Text('Fluff & Fold Grooming'),
                secondary:Icon(Icons.content_cut),
                onChanged: (bool? value){
                  setState(() {
                    FluffGrooming=value?? false;
                  });
                }),
            CheckboxListTile(value:  Washing,
                title:Text('Paws Spa & Wash'),
                secondary:Icon(Icons.shower),
                onChanged: (bool? value){
                  setState(() {
                    Washing=value?? false;
                  });
                }),
            SizedBox(height: 10),
            Text('Boarding',style: TextStyle(fontSize: 30)),
            CheckboxListTile(value:  CozyPawsBoarding,
                title:Text('Cozy Paws Boarding'),
                secondary:Icon(Icons.house),
                onChanged: (bool? value){
                  setState(() {
                    CozyPawsBoarding=value?? false;
                  });
                }),
            CheckboxListTile(value:   HappyTailsPetResort,
                title:Text(' Happy Tails Pet Resort'),
                secondary:Icon(Icons.cottage),
                onChanged: (bool? value){
                  setState(() {
                    HappyTailsPetResort=value?? false;
                  });
                }),
            SizedBox(height: 10),
            Text('Training',style: TextStyle(fontSize: 30)),
            CheckboxListTile(value:   K9ObedienceTraining,
                title:Text('K9 Obedience Training'),
                secondary:Icon(Icons.fitness_center),
                onChanged: (bool? value){
                  setState(() {
                    K9ObedienceTraining=value?? false;
                  });
                }),
            CheckboxListTile(value:PuppySchoolAcademy,
                title:Text(' Puppy School Academy'),
                secondary:Icon(Icons.sports),
                onChanged: (bool? value){
                  setState(() {
                    PuppySchoolAcademy=value?? false;
                  });
                }),
            Text("Selected Service:",
              style:TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ) ,
            ),
            Text(CatWalking ?"✓ Cat Walking":" "),
            Text(DogWalking ?"✓ Dog Walking":" "),
            Text(FluffGrooming ?"✓ Fluff & Fold Grooming":" "),
            Text(Washing ?"✓ Paws Spa & Wash":" "),
            Text(CozyPawsBoarding ?"✓ Cozy Paws Boarding":" "),
            Text(HappyTailsPetResort ?"✓ Happy Tails Pet Resort":" "),
            Text(K9ObedienceTraining ?"✓ K9O bedience Training":" "),
            Text(PuppySchoolAcademy ?"✓ Puppy School Academy":" "),
            SizedBox(height:15),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[700],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal:70,vertical:18),
                  textStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),),
                child: Text('Confirm booking'),
                onPressed:(){
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>PaymentDetails()));
                } ),
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
//PaymentDetails
class PaymentDetails extends StatefulWidget {
  @override
  PaymentDetailsState createState() => PaymentDetailsState();
}

class PaymentDetailsState extends State<PaymentDetails> {
  TextEditingController nameController =TextEditingController();
  TextEditingController card_detailsController =TextEditingController();
  TextEditingController mobile_numberController =TextEditingController();
  TextEditingController dateController =TextEditingController();
  TextEditingController addressController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.orange[200],
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('User Details',style: TextStyle(fontSize: 25)),
              Padding(
                  padding:EdgeInsets.all(20),
                  child:TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText:"Name",
                      hintText: "Enter your full name",
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                  padding:EdgeInsets.all(20),
                  child:TextField(
                    controller: mobile_numberController,
                    decoration: InputDecoration(
                      labelText:"Mobile Number",
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                  padding:EdgeInsets.all(20),
                  child:TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText:"Address",
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Text('Add Card Details',style: TextStyle(fontSize: 25)),
              Padding(
                  padding:EdgeInsets.all(20),
                  child:TextField(
                    controller: card_detailsController,
                    decoration: InputDecoration(
                      labelText:"Card Number",
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                  padding:EdgeInsets.all(20),
                  child:TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      labelText:"Expiry  date",
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                  padding:EdgeInsets.all(20),
                  child:TextField(
                    controller: card_detailsController,
                    decoration: InputDecoration(
                      labelText:" Name on Card ",
                      hintText: "Enter exact name",
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[700],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal:70,vertical: 20),
                  textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child:Text("Data Saved"),
                onPressed:showAlertDialog,
              ),
              SizedBox(height: 15)
            ],
          ),
        ) ,
      ),
    );
  }
  void showAlertDialog(){
    AlertDialog alert=AlertDialog(
        title: Text("Payer Details",
          style: TextStyle(fontWeight: FontWeight.bold),),
        content:Text(
            " Name:${nameController.text}\n"
                " Mobile Number:${mobile_numberController.text}\n"
                "Address:${addressController.text}\n"
                "Card Number:${card_detailsController.text}\n"
                "Exipry Date:${dateController.text}\n"
                "Name on Card:${card_detailsController.text}\n"

        ),
        actions:<Widget>[
          TextButton(
            child:Text("saved"),
            onPressed:() {Navigator.pop(context);},
          ),
        ]
    );
    showDialog(
      context: context,
      builder: (context){
        return alert;
      },
    );
  }
}


