import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/auth/session.dart';
import '../core/config/app_config_provider.dart';
import '../core/providers.dart';
import '../features/auth/presentation/gate_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/splash_screen.dart';
import '../features/auth/presentation/update_screen.dart';
import '../features/catch_log/presentation/catch_log_screen.dart';
import '../features/consignments/presentation/consign_screen.dart';
import '../features/consignments/presentation/consignment_screen.dart';
import '../features/consignments/presentation/consignments_screen.dart';
import '../features/contacts/presentation/contact_form_screen.dart';
import '../features/contacts/presentation/contacts_screens.dart';
import '../features/dalals/presentation/dalals_screen.dart';
import '../features/fleet/data/fleet.dart';
import '../features/fleet/presentation/boat_form_screen.dart';
import '../features/fleet/presentation/boat_screen.dart';
import '../features/fleet/presentation/fisher_form_screen.dart';
import '../features/fleet/presentation/fisher_screen.dart';
import '../features/fleet/presentation/fleet_lists.dart';
import '../features/fleet/presentation/maintenance_form_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/more/presentation/more_screen.dart';
import '../features/notifications/presentation/notifications_screen.dart';
import '../features/profile/presentation/change_password_screen.dart';
import '../features/profile/presentation/edit_profile_screen.dart';
import '../features/profile/presentation/profile_screen.dart';
import '../features/sales/presentation/sale_form_screen.dart';
import '../features/sales/presentation/sale_screen.dart';
import '../features/sales/presentation/sales_screen.dart';
import '../features/stock/presentation/stock_movements_screen.dart';
import '../features/stock/presentation/stock_screen.dart';
import '../features/trips/data/trip.dart';
import '../features/trips/presentation/catch_screen.dart';
import '../features/trips/presentation/trip_form_screen.dart';
import '../features/trips/presentation/trip_screen.dart';
import '../features/trips/presentation/trips_screen.dart';
import 'shell.dart';

part 'router.g.dart';

/// Every path in one place.
abstract final class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const gate = '/gate';
  static const update = '/update';
  static const home = '/home';
  static const trips = '/trips';
  static const sales = '/sales';
  static const more = '/more';
  static const notifications = '/notifications';
  static const profile = '/profile';
  static const editProfile = '/profile/edit';
  static const changePassword = '/profile/password';
  static const newTrip = '/trip/new';
  static const catchLog = '/catch-log';
  static const consignments = '/consignments';
  static const stock = '/stock';
  static const dalals = '/dalals';
  static const boats = '/boats';
  static const newBoat = '/boat/new';
  static const editMaintenance = '/maintenance/edit';

  static String tripsAt(TripStage stage) => '$trips?stage=${stage.apiValue}';
  static String unpaidSales() => '$sales?unpaid=1';
  static String trip(int id) => '/trip/$id';
  static String editTrip(int id) => '/trip/$id/edit';
  static String submitCatch(int id) => '/trip/$id/catch';
  static String sale(int id) => '/sale/$id';
  static String newSale(int tripId) => '/sale/new?trip=$tripId';
  static String newConsignment(int tripId) => '/consign/new?trip=$tripId';
  static String consignment(int id) => '/consignment/$id';
  static String stockMovements({int? speciesId}) =>
      speciesId == null ? '$stock/movements' : '$stock/movements?species=$speciesId';

  static String boat(int id) => '/boat/$id';
  static String editBoat(int id) => '/boat/$id/edit';
  static String fishers(FisherKind kind, {int? boatId}) =>
      _withBoat(kind == FisherKind.captain ? '/captains' : '/crew', boatId);
  static String newFisher(FisherKind kind, {int? boatId}) => _withBoat('/fisher/${kind.name}/new', boatId);
  static String fisher(FisherKind kind, int id) => '/fisher/${kind.name}/$id';
  static String editFisher(FisherKind kind, int id) => '/fisher/${kind.name}/$id/edit';
  static String maintenance({int? boatId}) => _withBoat('/maintenance', boatId);
  static String newMaintenance({int? boatId}) => _withBoat('/maintenance/new', boatId);
  static String contacts(ContactKind kind) => switch (kind) {
    ContactKind.customer => '/customers',
    ContactKind.vendor => '/vendors',
    ContactKind.employee => '/employees',
  };
  static String newContact(ContactKind kind) => '/contact/${kind.name}/new';
  static String contact(ContactKind kind, int id) => '/contact/${kind.name}/$id';

  static String _withBoat(String path, int? boatId) => boatId == null ? path : '$path?boat=$boatId';

  static const _outside = {splash, login, gate, update};
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final refresh = ValueNotifier<int>(0);
  ref
    ..listen(sessionProvider, (_, _) => refresh.value++)
    ..listen(appConfigControllerProvider, (_, _) => refresh.value++)
    ..onDispose(refresh.dispose);

  String? redirect(BuildContext context, GoRouterState state) {
    final location = state.matchedLocation;
    String? goTo(String path) => location == path ? null : path;

    final config = ref.read(appConfigControllerProvider);
    if (!config.hasValue) return goTo(Routes.splash);
    if (config.requireValue.requiresUpdate(ref.read(appVersionProvider))) return goTo(Routes.update);

    return switch (ref.read(sessionProvider)) {
      SessionRestoring() || SessionRestoreFailed() => goTo(Routes.splash),
      SignedOut() => goTo(Routes.login),
      SignedIn(:final user) when !user.isOwner => goTo(Routes.gate),
      SignedIn() => Routes._outside.contains(location) ? Routes.home : null,
    };
  }

  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.splash,
    refreshListenable: refresh,
    redirect: redirect,
    routes: [
      GoRoute(path: Routes.splash, builder: (_, _) => const SplashScreen()),
      GoRoute(path: Routes.login, builder: (_, _) => const LoginScreen()),
      GoRoute(path: Routes.gate, builder: (_, _) => const GateScreen()),
      GoRoute(path: Routes.update, builder: (_, _) => const UpdateScreen()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [GoRoute(path: Routes.home, builder: (_, _) => const HomeScreen())],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.trips,
                builder: (_, state) => TripsScreen(initialStage: TripStage.parse(state.uri.queryParameters['stage'])),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.sales,
                builder: (_, state) => SalesScreen(unpaidOnly: state.uri.queryParameters['unpaid'] == '1'),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: Routes.more, builder: (_, _) => const MoreScreen())],
          ),
        ],
      ),
      GoRoute(path: Routes.notifications, builder: (_, _) => const NotificationsScreen()),
      GoRoute(path: Routes.profile, builder: (_, _) => const ProfileScreen()),
      GoRoute(path: Routes.editProfile, builder: (_, _) => const EditProfileScreen()),
      GoRoute(path: Routes.changePassword, builder: (_, _) => const ChangePasswordScreen()),
      GoRoute(path: Routes.catchLog, builder: (_, _) => const CatchLogScreen()),
      GoRoute(path: Routes.newTrip, builder: (_, _) => const TripFormScreen()),
      GoRoute(
        path: '/trip/:id',
        builder: (_, state) => TripScreen(id: _id(state)),
        routes: [
          GoRoute(
            path: 'edit',
            builder: (_, state) => TripFormScreen(tripId: _id(state)),
          ),
          GoRoute(
            path: 'catch',
            builder: (_, state) => CatchScreen(tripId: _id(state)),
          ),
        ],
      ),
      // Before '/sale/:id', or "new" would be read as an invoice id.
      GoRoute(
        path: '/sale/new',
        builder: (_, state) => SaleFormScreen(tripId: _query(state, 'trip') ?? 0),
      ),
      GoRoute(
        path: '/sale/:id',
        builder: (_, state) => SaleScreen(id: _id(state)),
      ),
      GoRoute(
        path: '/consign/new',
        builder: (_, state) => ConsignScreen(tripId: _query(state, 'trip') ?? 0),
      ),
      GoRoute(path: Routes.consignments, builder: (_, _) => const ConsignmentsScreen()),
      GoRoute(
        path: '/consignment/:id',
        builder: (_, state) => ConsignmentScreen(id: _id(state)),
      ),
      GoRoute(
        path: Routes.stock,
        builder: (_, _) => const StockScreen(),
        routes: [
          GoRoute(
            path: 'movements',
            builder: (_, state) => StockMovementsScreen(speciesId: _query(state, 'species')),
          ),
        ],
      ),
      GoRoute(path: Routes.dalals, builder: (_, _) => const DalalsScreen()),
      GoRoute(path: Routes.boats, builder: (_, _) => const BoatsScreen()),
      GoRoute(path: Routes.newBoat, builder: (_, _) => const BoatFormScreen()),
      GoRoute(
        path: '/boat/:id',
        builder: (_, state) => BoatScreen(id: _id(state)),
        routes: [
          GoRoute(
            path: 'edit',
            builder: (_, state) => BoatFormScreen(id: _id(state)),
          ),
        ],
      ),
      GoRoute(
        path: '/captains',
        builder: (_, _) => const FishersScreen(kind: FisherKind.captain),
      ),
      GoRoute(
        path: '/crew',
        builder: (_, state) => FishersScreen(kind: FisherKind.crew, boatId: _query(state, 'boat')),
      ),
      GoRoute(
        path: '/fisher/:kind/new',
        builder: (_, state) => FisherFormScreen(kind: _fisherKind(state), boatId: _query(state, 'boat')),
      ),
      GoRoute(
        path: '/fisher/:kind/:id',
        builder: (_, state) => FisherScreen(kind: _fisherKind(state), id: _id(state)),
        routes: [
          GoRoute(
            path: 'edit',
            builder: (_, state) => FisherFormScreen(kind: _fisherKind(state), id: _id(state)),
          ),
        ],
      ),
      GoRoute(
        path: '/maintenance',
        builder: (_, state) => MaintenanceScreen(boatId: _query(state, 'boat')),
        routes: [
          GoRoute(
            path: 'new',
            builder: (_, state) => MaintenanceFormScreen(boatId: _query(state, 'boat')),
          ),
          // The row comes with the push; opened without it there is nothing to edit.
          GoRoute(
            path: 'edit',
            redirect: (_, state) => state.extra is Maintenance ? null : '/maintenance',
            builder: (_, state) => MaintenanceFormScreen(record: state.extra! as Maintenance),
          ),
        ],
      ),
      GoRoute(path: '/customers', builder: (_, _) => const CustomersScreen()),
      GoRoute(path: '/vendors', builder: (_, _) => const VendorsScreen()),
      GoRoute(path: '/employees', builder: (_, _) => const EmployeesScreen()),
      GoRoute(
        path: '/contact/:kind/new',
        builder: (_, state) => ContactFormScreen(kind: ContactKind.parse(state.pathParameters['kind'])),
      ),
      GoRoute(
        path: '/contact/:kind/:id',
        builder: (_, state) => ContactFormScreen(kind: ContactKind.parse(state.pathParameters['kind']), id: _id(state)),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}

int _id(GoRouterState state) => int.tryParse(state.pathParameters['id'] ?? '') ?? 0;

FisherKind _fisherKind(GoRouterState state) => FisherKind.parse(state.pathParameters['kind']);

int? _query(GoRouterState state, String key) => int.tryParse(state.uri.queryParameters[key] ?? '');
