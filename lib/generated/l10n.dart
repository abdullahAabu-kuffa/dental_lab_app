// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Avante dental solution`
  String get title {
    return Intl.message(
      'Avante dental solution',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Material Types`
  String get materialTypes {
    return Intl.message(
      'Material Types',
      name: 'materialTypes',
      desc: '',
      args: [],
    );
  }

  /// `Shade Selection`
  String get shadeSelection {
    return Intl.message(
      'Shade Selection',
      name: 'shadeSelection',
      desc: '',
      args: [],
    );
  }

  /// `Design Options`
  String get designOptions {
    return Intl.message(
      'Design Options',
      name: 'designOptions',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Material & Order Online`
  String get chooseYourMaterial {
    return Intl.message(
      'Choose Your Material & Order Online',
      name: 'chooseYourMaterial',
      desc: '',
      args: [],
    );
  }

  /// `Easily select and verify every detail of your order for perfect results, every time.`
  String get easilySelectDetails {
    return Intl.message(
      'Easily select and verify every detail of your order for perfect results, every time.',
      name: 'easilySelectDetails',
      desc: '',
      args: [],
    );
  }

  /// `Egypt's Avante`
  String get quote {
    return Intl.message('Egypt\'s Avante', name: 'quote', desc: '', args: []);
  }

  /// ` dental`
  String get dental {
    return Intl.message(' dental', name: 'dental', desc: '', args: []);
  }

  /// ` solution`
  String get solution {
    return Intl.message(' solution', name: 'solution', desc: '', args: []);
  }

  /// `100% Digital Case Submission`
  String get digitalCaseSubmission {
    return Intl.message(
      '100% Digital Case Submission',
      name: 'digitalCaseSubmission',
      desc: '',
      args: [],
    );
  }

  /// `Upload your ExoCAD or intraoral scan files directly to our cloud platform.`
  String get uploadInstructions {
    return Intl.message(
      'Upload your ExoCAD or intraoral scan files directly to our cloud platform.',
      name: 'uploadInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get received {
    return Intl.message('Received', name: 'received', desc: '', args: []);
  }

  /// `Case files uploaded successfully.`
  String get caseFilesUploaded {
    return Intl.message(
      'Case files uploaded successfully.',
      name: 'caseFilesUploaded',
      desc: '',
      args: [],
    );
  }

  /// `Design`
  String get design {
    return Intl.message('Design', name: 'design', desc: '', args: []);
  }

  /// `Manufacturing`
  String get manufacturing {
    return Intl.message(
      'Manufacturing',
      name: 'manufacturing',
      desc: '',
      args: [],
    );
  }

  /// `Digital modeling in progress.`
  String get digitalModelingInProgress {
    return Intl.message(
      'Digital modeling in progress.',
      name: 'digitalModelingInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Milling & printing the case.`
  String get millingAndPrintingTheCase {
    return Intl.message(
      'Milling & printing the case.',
      name: 'millingAndPrintingTheCase',
      desc: '',
      args: [],
    );
  }

  /// `Shipping`
  String get shipping {
    return Intl.message('Shipping', name: 'shipping', desc: '', args: []);
  }

  /// `Your order is on its way.`
  String get shippingInProgress {
    return Intl.message(
      'Your order is on its way.',
      name: 'shippingInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Easily select and verify every detail of your order for perfect results, every time.`
  String get easlySelect {
    return Intl.message(
      'Easily select and verify every detail of your order for perfect results, every time.',
      name: 'easlySelect',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Login to your Avanté account.`
  String get loginToYourAccount {
    return Intl.message(
      'Login to your Avanté account.',
      name: 'loginToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get elreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'elreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your confirm password`
  String get enterYourConfirmPassword {
    return Intl.message(
      'Enter your confirm password',
      name: 'enterYourConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get enterYourFullName {
    return Intl.message(
      'Enter your full name',
      name: 'enterYourFullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Account`
  String get createYourAccount {
    return Intl.message(
      'Create Your Account',
      name: 'createYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInfo {
    return Intl.message(
      'Personal Information',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get security {
    return Intl.message('Security', name: 'security', desc: '', args: []);
  }

  /// `Professional Information`
  String get professionalInformation {
    return Intl.message(
      'Professional Information',
      name: 'professionalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Specialization`
  String get specialization {
    return Intl.message(
      'Specialization',
      name: 'specialization',
      desc: '',
      args: [],
    );
  }

  /// `Clinic or Lab Name`
  String get clinicOrLabName {
    return Intl.message(
      'Clinic or Lab Name',
      name: 'clinicOrLabName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Clinic or Lab Name`
  String get enterClinicOrLabName {
    return Intl.message(
      'Enter Clinic or Lab Name',
      name: 'enterClinicOrLabName',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get cityLabel {
    return Intl.message('City', name: 'cityLabel', desc: '', args: []);
  }

  /// `Address`
  String get addressLabel {
    return Intl.message('Address', name: 'addressLabel', desc: '', args: []);
  }

  /// `Enter your full address`
  String get enterYourFullAddress {
    return Intl.message(
      'Enter your full address',
      name: 'enterYourFullAddress',
      desc: '',
      args: [],
    );
  }

  /// `Select your specialization`
  String get selectYourSpecialization {
    return Intl.message(
      'Select your specialization',
      name: 'selectYourSpecialization',
      desc: '',
      args: [],
    );
  }

  /// `Select your city`
  String get selectYourCity {
    return Intl.message(
      'Select your city',
      name: 'selectYourCity',
      desc: '',
      args: [],
    );
  }

  /// `Current Orders`
  String get Current {
    return Intl.message('Current Orders', name: 'Current', desc: '', args: []);
  }

  /// `Previous Orders`
  String get Previous {
    return Intl.message(
      'Previous Orders',
      name: 'Previous',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message('Profile', name: 'Profile', desc: '', args: []);
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message('Save', name: 'Save', desc: '', args: []);
  }

  /// `Settings`
  String get Settings {
    return Intl.message('Settings', name: 'Settings', desc: '', args: []);
  }

  /// `Logout`
  String get Logout {
    return Intl.message('Logout', name: 'Logout', desc: '', args: []);
  }

  /// `Orders`
  String get Orders {
    return Intl.message('Orders', name: 'Orders', desc: '', args: []);
  }

  /// `Order`
  String get Order {
    return Intl.message('Order', name: 'Order', desc: '', args: []);
  }

  // skipped getter for the 'Order Details' key

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message('Dark Mode', name: 'dark_mode', desc: '', args: []);
  }

  /// `Light Mode`
  String get light_mode {
    return Intl.message('Light Mode', name: 'light_mode', desc: '', args: []);
  }

  /// `English`
  String get English {
    return Intl.message('English', name: 'English', desc: '', args: []);
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message('Arabic', name: 'Arabic', desc: '', args: []);
  }

  /// `Egypt's first fully digital dental labioratory.`
  String get egyptavante {
    return Intl.message(
      'Egypt\'s first fully digital dental labioratory.',
      name: 'egyptavante',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get Pending {
    return Intl.message('Pending', name: 'Pending', desc: '', args: []);
  }

  /// `Completed`
  String get Completed {
    return Intl.message('Completed', name: 'Completed', desc: '', args: []);
  }

  /// `Canceled`
  String get Canceled {
    return Intl.message('Canceled', name: 'Canceled', desc: '', args: []);
  }

  /// `In Progress`
  String get In_progress {
    return Intl.message('In Progress', name: 'In_progress', desc: '', args: []);
  }

  /// `Ask about your order`
  String get ask_about_your_order {
    return Intl.message(
      'Ask about your order',
      name: 'ask_about_your_order',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get AreYouSure {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'AreYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message('Confirm', name: 'Confirm', desc: '', args: []);
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message('Cancel', name: 'Cancel', desc: '', args: []);
  }

  /// `Login failed! Please check your email or password`
  String get somethingWentWrong {
    return Intl.message(
      'Login failed! Please check your email or password',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Login successful!`
  String get loginSuccessfully {
    return Intl.message(
      'Login successful!',
      name: 'loginSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful!`
  String get registerSuccessfully {
    return Intl.message(
      'Registration successful!',
      name: 'registerSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `High precision crowns and bridges crafted digitally.`
  String get crownAndBridges {
    return Intl.message(
      'High precision crowns and bridges crafted digitally.',
      name: 'crownAndBridges',
      desc: '',
      args: [],
    );
  }

  /// `Our Services`
  String get ourServices {
    return Intl.message(
      'Our Services',
      name: 'ourServices',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `Our Clients`
  String get ourClients {
    return Intl.message('Our Clients', name: 'ourClients', desc: '', args: []);
  }

  /// `Our Partners`
  String get ourPartners {
    return Intl.message(
      'Our Partners',
      name: 'ourPartners',
      desc: '',
      args: [],
    );
  }

  /// `Premium dental restorations crafted with precision and care`
  String get ourTeam {
    return Intl.message(
      'Premium dental restorations crafted with precision and care',
      name: 'ourTeam',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get About {
    return Intl.message('About', name: 'About', desc: '', args: []);
  }

  /// `Us`
  String get Us {
    return Intl.message('Us', name: 'Us', desc: '', args: []);
  }

  /// `Egypt's first fully digital dental laboratory, revolutionizing dental restorations with advanced ExoCAD integration, real-time tracking, and seamless online services.`
  String get aboutUs {
    return Intl.message(
      'Egypt\'s first fully digital dental laboratory, revolutionizing dental restorations with advanced ExoCAD integration, real-time tracking, and seamless online services.',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Who We Are`
  String get whoweare {
    return Intl.message('Who We Are', name: 'whoweare', desc: '', args: []);
  }

  /// `We are Egypt's first fully digital dental laboratory, combining expert craftsmanship with cutting-edge digital technologies...`
  String get weare {
    return Intl.message(
      'We are Egypt\'s first fully digital dental laboratory, combining expert craftsmanship with cutting-edge digital technologies...',
      name: 'weare',
      desc: '',
      args: [],
    );
  }

  /// `What Makes Us Unique`
  String get uniqe {
    return Intl.message(
      'What Makes Us Unique',
      name: 'uniqe',
      desc: '',
      args: [],
    );
  }

  /// `Our digital workflow allows you to easily choose services and materials and track every stage of your case online...`
  String get uniqeness {
    return Intl.message(
      'Our digital workflow allows you to easily choose services and materials and track every stage of your case online...',
      name: 'uniqeness',
      desc: '',
      args: [],
    );
  }

  /// `Educational Resources`
  String get educational {
    return Intl.message(
      'Educational Resources',
      name: 'educational',
      desc: '',
      args: [],
    );
  }

  /// `We provide comprehensive guides, workshops, and tutorials on ExoCAD best practices...`
  String get educationaltext {
    return Intl.message(
      'We provide comprehensive guides, workshops, and tutorials on ExoCAD best practices...',
      name: 'educationaltext',
      desc: '',
      args: [],
    );
  }

  /// `Join Our Community`
  String get community {
    return Intl.message(
      'Join Our Community',
      name: 'community',
      desc: '',
      args: [],
    );
  }

  /// `Partner with us and experience seamless digital dentistry — where technology, craftsmanship, and professional support come together.`
  String get communitytext {
    return Intl.message(
      'Partner with us and experience seamless digital dentistry — where technology, craftsmanship, and professional support come together.',
      name: 'communitytext',
      desc: '',
      args: [],
    );
  }

  /// `Crown & Bridge`
  String get crowbnridge {
    return Intl.message(
      'Crown & Bridge',
      name: 'crowbnridge',
      desc: '',
      args: [],
    );
  }

  /// `High precision crowns and bridges crafted digitally.`
  String get highprecision {
    return Intl.message(
      'High precision crowns and bridges crafted digitally.',
      name: 'highprecision',
      desc: '',
      args: [],
    );
  }

  /// `Implants`
  String get implants {
    return Intl.message('Implants', name: 'implants', desc: '', args: []);
  }

  /// `Digital implant planning with ExoCAD integration.`
  String get digitalimplants {
    return Intl.message(
      'Digital implant planning with ExoCAD integration.',
      name: 'digitalimplants',
      desc: '',
      args: [],
    );
  }

  /// `Veneers`
  String get veneers {
    return Intl.message('Veneers', name: 'veneers', desc: '', args: []);
  }

  /// `Premium dental veneers crafted with precision and.`
  String get premiumveneers {
    return Intl.message(
      'Premium dental veneers crafted with precision and.',
      name: 'premiumveneers',
      desc: '',
      args: [],
    );
  }

  /// `Orthodontics`
  String get orthodontics {
    return Intl.message(
      'Orthodontics',
      name: 'orthodontics',
      desc: '',
      args: [],
    );
  }

  /// `Clear aligners and advanced orthodontic solutions.`
  String get clearaligners {
    return Intl.message(
      'Clear aligners and advanced orthodontic solutions.',
      name: 'clearaligners',
      desc: '',
      args: [],
    );
  }

  /// `All Orders`
  String get allorders {
    return Intl.message('All Orders', name: 'allorders', desc: '', args: []);
  }

  /// `No Orders Found.`
  String get noOrders {
    return Intl.message(
      'No Orders Found.',
      name: 'noOrders',
      desc: '',
      args: [],
    );
  }

  /// `Patient Name`
  String get patientname {
    return Intl.message(
      'Patient Name',
      name: 'patientname',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get totalprice {
    return Intl.message('Total Price', name: 'totalprice', desc: '', args: []);
  }

  /// `Invoice ID`
  String get invoiceId {
    return Intl.message('Invoice ID', name: 'invoiceId', desc: '', args: []);
  }

  /// `Created`
  String get Created {
    return Intl.message('Created', name: 'Created', desc: '', args: []);
  }

  /// `Updated`
  String get Updated {
    return Intl.message('Updated', name: 'Updated', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Options`
  String get options {
    return Intl.message('Options', name: 'options', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
