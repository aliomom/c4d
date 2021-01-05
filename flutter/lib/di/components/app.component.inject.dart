import 'app.component.dart' as _i1;
import '../../utils/logger/logger.dart' as _i2;
import '../../module_localization/service/localization_service/localization_service.dart'
    as _i3;
import 'dart:async' as _i4;
import '../../main.dart' as _i5;
import '../../module_orders/orders_module.dart' as _i6;
import '../../module_orders/ui/screens/order_status_for_owner/order_status_for_owner.dart'
    as _i7;
import '../../module_orders/state_manager/order_status/order_status.state_manager.dart'
    as _i8;
import '../../module_orders/service/orders/orders.service.dart' as _i9;
import '../../module_orders/manager/orders_manager/orders_manager.dart' as _i10;
import '../../module_orders/repository/order_repository/order_repository.dart'
    as _i11;
import '../../module_network/http_client/http_client.dart' as _i12;
import '../../module_auth/service/auth_service/auth_service.dart' as _i13;
import '../../module_auth/presistance/auth_prefs_helper.dart' as _i14;
import '../../module_auth/manager/auth_manager/auth_manager.dart' as _i15;
import '../../module_auth/repository/auth/auth_repository.dart' as _i16;
import '../../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i17;
import '../../module_orders/ui/screens/order_status_for_captain/order_status_for_captain_screen.dart'
    as _i18;
import '../../module_orders/state_manager/order_status_for_captain/order_status_for_captain.state_manager.dart'
    as _i19;
import '../../module_orders/ui/screens/new_order/new_order_screen.dart' as _i20;
import '../../module_orders/state_manager/new_order/new_order.state_manager.dart'
    as _i21;
import '../../module_orders/ui/screens/owner_orders/owner_orders_screen.dart'
    as _i22;
import '../../module_orders/state_manager/owner_orders/owner_orders.state_manager.dart'
    as _i23;
import '../../module_orders/ui/screens/orders/orders_screen.dart' as _i24;
import '../../module_orders/state_manager/orders/orders.state_manager.dart'
    as _i25;
import '../../module_orders/ui/screens/map/map_screen.dart' as _i26;
import '../../module_auth/authoriazation_module.dart' as _i27;
import '../../module_auth/ui/screen/login_screen/login_screen.dart' as _i28;
import '../../module_auth/state_manager/auth_state_manager/auth_state_manager.dart'
    as _i29;
import '../../module_auth/ui/screen/register_screen/register_screen.dart'
    as _i30;
import '../../module_init/init_account_module.dart' as _i31;
import '../../module_init/ui/screens/init_account_screen/init_account_screen.dart'
    as _i32;
import '../../module_init/state_manager/init_account/init_account.state_manager.dart'
    as _i33;
import '../../module_init/service/init_account/init_account.service.dart'
    as _i34;
import '../../module_init/manager/init_account/init_account.manager.dart'
    as _i35;
import '../../module_init/repository/init_account/init_account.repository.dart'
    as _i36;
import '../../module_profile/service/profile/profile.service.dart' as _i37;
import '../../module_profile/manager/profile/profile.manager.dart' as _i38;
import '../../module_profile/repository/profile/profile.repository.dart'
    as _i39;
import '../../module_theme/service/theme_service/theme_service.dart' as _i40;
import '../../module_theme/pressistance/theme_preferences_helper.dart' as _i41;
import '../../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i42;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._();

  _i2.Logger _singletonLogger;

  _i3.LocalizationService _singletonLocalizationService;

  static _i4.Future<_i1.AppComponent> create() async {
    final injector = AppComponent$Injector._();

    return injector;
  }

  _i5.MyApp _createMyApp() => _i5.MyApp(
      _createOrdersModule(),
      _createAuthorizationModule(),
      _createInitAccountModule(),
      _createAppThemeDataService(),
      _createLocalizationService());
  _i6.OrdersModule _createOrdersModule() => _i6.OrdersModule(
      _createOrderStatusForOwnerScreen(),
      _createOrderStatusForCaptainScreen(),
      _createNewOrderScreen(),
      _createOwnerOrdersScreen(),
      _createOrdersScreen(),
      _createMapScreen());
  _i7.OrderStatusForOwnerScreen _createOrderStatusForOwnerScreen() =>
      _i7.OrderStatusForOwnerScreen(_createOrderStatusStateManager());
  _i8.OrderStatusStateManager _createOrderStatusStateManager() =>
      _i8.OrderStatusStateManager(_createOrdersService());
  _i9.OrdersService _createOrdersService() =>
      _i9.OrdersService(_createOrdersManager());
  _i10.OrdersManager _createOrdersManager() =>
      _i10.OrdersManager(_createOrderRepository());
  _i11.OrderRepository _createOrderRepository() =>
      _i11.OrderRepository(_createApiClient(), _createAuthService());
  _i12.ApiClient _createApiClient() => _i12.ApiClient(_createLogger());
  _i2.Logger _createLogger() => _singletonLogger ??= _i2.Logger();
  _i13.AuthService _createAuthService() => _i13.AuthService(
      _createAuthPrefsHelper(),
      _createAuthManager(),
      _createFireNotificationService());
  _i14.AuthPrefsHelper _createAuthPrefsHelper() => _i14.AuthPrefsHelper();
  _i15.AuthManager _createAuthManager() =>
      _i15.AuthManager(_createAuthRepository());
  _i16.AuthRepository _createAuthRepository() =>
      _i16.AuthRepository(_createApiClient());
  _i17.FireNotificationService _createFireNotificationService() =>
      _i17.FireNotificationService();
  _i18.OrderStatusForCaptainScreen _createOrderStatusForCaptainScreen() =>
      _i18.OrderStatusForCaptainScreen(
          _createOrderStatusForCaptainStateManager());
  _i19.OrderStatusForCaptainStateManager
      _createOrderStatusForCaptainStateManager() =>
          _i19.OrderStatusForCaptainStateManager(_createOrdersService());
  _i20.NewOrderScreen _createNewOrderScreen() =>
      _i20.NewOrderScreen(_createNewOrderStateManager());
  _i21.NewOrderStateManager _createNewOrderStateManager() =>
      _i21.NewOrderStateManager(_createOrdersService());
  _i22.OwnerOrdersScreen _createOwnerOrdersScreen() =>
      _i22.OwnerOrdersScreen(_createOwnerOrdersStateManager());
  _i23.OwnerOrdersStateManager _createOwnerOrdersStateManager() =>
      _i23.OwnerOrdersStateManager(_createOrdersService());
  _i24.OrdersScreen _createOrdersScreen() =>
      _i24.OrdersScreen(_createOrdersStateManager());
  _i25.OrdersStateManager _createOrdersStateManager() =>
      _i25.OrdersStateManager(_createOrdersService());
  _i26.MapScreen _createMapScreen() => _i26.MapScreen();
  _i27.AuthorizationModule _createAuthorizationModule() =>
      _i27.AuthorizationModule(_createLoginScreen(), _createRegisterScreen());
  _i28.LoginScreen _createLoginScreen() =>
      _i28.LoginScreen(_createAuthStateManager());
  _i29.AuthStateManager _createAuthStateManager() =>
      _i29.AuthStateManager(_createAuthService());
  _i30.RegisterScreen _createRegisterScreen() =>
      _i30.RegisterScreen(_createAuthStateManager());
  _i31.InitAccountModule _createInitAccountModule() =>
      _i31.InitAccountModule(_createInitAccountScreen());
  _i32.InitAccountScreen _createInitAccountScreen() =>
      _i32.InitAccountScreen(_createInitAccountStateManager());
  _i33.InitAccountStateManager _createInitAccountStateManager() =>
      _i33.InitAccountStateManager(
          _createInitAccountService(), _createProfileService());
  _i34.InitAccountService _createInitAccountService() =>
      _i34.InitAccountService(_createInitAccountManager());
  _i35.InitAccountManager _createInitAccountManager() =>
      _i35.InitAccountManager(_createInitAccountRepository());
  _i36.InitAccountRepository _createInitAccountRepository() =>
      _i36.InitAccountRepository(_createApiClient(), _createAuthService());
  _i37.ProfileService _createProfileService() =>
      _i37.ProfileService(_createProfileManager());
  _i38.ProfileManager _createProfileManager() =>
      _i38.ProfileManager(_createProfileRepository());
  _i39.ProfileRepository _createProfileRepository() =>
      _i39.ProfileRepository(_createApiClient(), _createAuthService());
  _i40.AppThemeDataService _createAppThemeDataService() =>
      _i40.AppThemeDataService(_createThemePreferencesHelper());
  _i41.ThemePreferencesHelper _createThemePreferencesHelper() =>
      _i41.ThemePreferencesHelper();
  _i3.LocalizationService _createLocalizationService() =>
      _singletonLocalizationService ??=
          _i3.LocalizationService(_createLocalizationPreferencesHelper());
  _i42.LocalizationPreferencesHelper _createLocalizationPreferencesHelper() =>
      _i42.LocalizationPreferencesHelper();
  @override
  _i5.MyApp get app => _createMyApp();
}