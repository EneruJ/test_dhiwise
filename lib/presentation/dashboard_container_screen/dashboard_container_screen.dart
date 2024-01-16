import 'bloc/dashboard_container_bloc.dart';
import 'models/dashboard_container_model.dart';
import 'package:flutter/material.dart';
import 'package:test/core/app_export.dart';
import 'package:test/presentation/dashboard_page/dashboard_page.dart';
import 'package:test/presentation/message_tab_container_page/message_tab_container_page.dart';
import 'package:test/presentation/schedule_tab_container_page/schedule_tab_container_page.dart';
import 'package:test/presentation/settings_page/settings_page.dart';
import 'package:test/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class DashboardContainerScreen extends StatelessWidget {
  DashboardContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<DashboardContainerBloc>(
        create: (context) => DashboardContainerBloc(DashboardContainerState(
            dashboardContainerModelObj: DashboardContainerModel()))
          ..add(DashboardContainerInitialEvent()),
        child: DashboardContainerScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardContainerBloc, DashboardContainerState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.dashboardPage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar: _buildBottomBar(context)));
    });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.dashboardPage;
      case BottomBarEnum.Messages:
        return AppRoutes.messageTabContainerPage;
      case BottomBarEnum.Appointment:
        return AppRoutes.scheduleTabContainerPage;
      case BottomBarEnum.Profile:
        return AppRoutes.settingsPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.dashboardPage:
        return DashboardPage.builder(context);
      case AppRoutes.messageTabContainerPage:
        return MessageTabContainerPage.builder(context);
      case AppRoutes.scheduleTabContainerPage:
        return ScheduleTabContainerPage.builder(context);
      case AppRoutes.settingsPage:
        return SettingsPage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
