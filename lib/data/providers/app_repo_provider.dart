import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lupiter_work_demo/repo/app_repo.dart';
import 'package:lupiter_work_demo/repo/prod_repo.dart';

final appRepoProvider = Provider<AppRepo>((_) => ProdRepo());
