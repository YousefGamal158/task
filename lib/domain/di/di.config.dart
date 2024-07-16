// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../apiManger/ApiManger.dart' as _i3;
import '../../products/ProductsViewModel.dart' as _i8;
import '../dataSourceContract/ProductsDataSource.dart' as _i4;
import '../dataSourceImpl/ProductsDataSourceImpl.dart' as _i5;
import '../reositoryContract/ProductsRepositoryContract.dart' as _i6;
import '../repositoryImpl/ProductsRepositorImpl.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManger>(() => _i3.ApiManger());
    gh.factory<_i4.ProductsDataSource>(
        () => _i5.ProductsDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i6.ProductsRepositoryContract>(
        () => _i7.ProductsRepositoryImpl(gh<_i4.ProductsDataSource>()));
    gh.factory<_i8.ProductsViewModel>(
        () => _i8.ProductsViewModel(gh<_i6.ProductsRepositoryContract>()));
    return this;
  }
}
