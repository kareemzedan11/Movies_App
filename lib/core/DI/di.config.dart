// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source_contract/local/fire_store_movie.dart' as _i79;
import '../../data/data_source_contract/local/login_data_source.dart' as _i20;
import '../../data/data_source_contract/local/register_data_source.dart' as _i8;
import '../../data/data_source_contract/remote/cast/cast_datasource.dart'
    as _i14;
import '../../data/data_source_contract/remote/cast/cast_jobs_datasource.dart'
    as _i27;
import '../../data/data_source_contract/remote/movies/categories_datasource.dart'
    as _i42;
import '../../data/data_source_contract/remote/movies/filter_datasource.dart'
    as _i47;
import '../../data/data_source_contract/remote/movies/movie_review_datasource.dart'
    as _i23;
import '../../data/data_source_contract/remote/movies/movieDetails_datasource.dart'
    as _i25;
import '../../data/data_source_contract/remote/movies/now_playing_datasource.dart'
    as _i36;
import '../../data/data_source_contract/remote/movies/popular_datasource.dart'
    as _i74;
import '../../data/data_source_contract/remote/movies/rating_datasource.dart'
    as _i44;
import '../../data/data_source_contract/remote/movies/search_datasource.dart'
    as _i6;
import '../../data/data_source_contract/remote/movies/similer_datasource.dart'
    as _i53;
import '../../data/data_source_contract/remote/movies/toprated_datasource.dart'
    as _i31;
import '../../data/data_source_contract/remote/movies/trailler_datasource.dart'
    as _i57;
import '../../data/data_source_contract/remote/movies/upcoming_datasource.dart'
    as _i51;
import '../../data/data_source_contract/remote/series/popular_series_datasource.dart'
    as _i33;
import '../../data/data_source_contract/remote/series/season_details_datasource.dart'
    as _i18;
import '../../data/data_source_contract/remote/series/series_details_datasource.dart'
    as _i38;
import '../../data/data_source_contract/remote/series/similler_series_datasource.dart'
    as _i12;
import '../../data/data_source_contract/remote/series/top_rated_series_data_source.dart'
    as _i16;
import '../../data/data_source_contract/remote/shared/arabic_datasource.dart'
    as _i55;
import '../../data/data_source_impl/local/fire_store_movie_impl.dart' as _i80;
import '../../data/data_source_impl/local/login_data_source_impl.dart' as _i21;
import '../../data/data_source_impl/local/register_data_source_impl.dart'
    as _i9;
import '../../data/data_source_impl/remote/cast/cast_datasource_impl.dart'
    as _i15;
import '../../data/data_source_impl/remote/cast/cast_jobs_datasource_impl.dart'
    as _i28;
import '../../data/data_source_impl/remote/movies/categories_datasource_impl.dart'
    as _i43;
import '../../data/data_source_impl/remote/movies/filter_datasource_impl.dart'
    as _i48;
import '../../data/data_source_impl/remote/movies/movie_details_datasource_impl.dart'
    as _i26;
import '../../data/data_source_impl/remote/movies/movie_review_datasource_impl.dart'
    as _i24;
import '../../data/data_source_impl/remote/movies/now_playing_datasource_impl.dart'
    as _i37;
import '../../data/data_source_impl/remote/movies/popular_datasource_impl.dart'
    as _i75;
import '../../data/data_source_impl/remote/movies/rating_datasource_impl.dart'
    as _i45;
import '../../data/data_source_impl/remote/movies/search_datasource_impl.dart'
    as _i7;
import '../../data/data_source_impl/remote/movies/similer_datasource_impl.dart'
    as _i54;
import '../../data/data_source_impl/remote/movies/toprated_datasource_impl.dart'
    as _i32;
import '../../data/data_source_impl/remote/movies/trailler_datasource_impl.dart'
    as _i58;
import '../../data/data_source_impl/remote/movies/upcoming_datasource_impl.dart'
    as _i52;
import '../../data/data_source_impl/remote/series/popular_datasource_impl.dart'
    as _i34;
import '../../data/data_source_impl/remote/series/season_details_datasource_impl.dart'
    as _i19;
import '../../data/data_source_impl/remote/series/series_details_datasource_impl.dart'
    as _i39;
import '../../data/data_source_impl/remote/series/similer_series_datasource_impl.dart'
    as _i13;
import '../../data/data_source_impl/remote/series/top_rated_series_data_source_impl.dart'
    as _i17;
import '../../data/data_source_impl/remote/shared/arabic_datasource_impl.dart'
    as _i56;
import '../../data/repository_impl/local/fire_store_movie_repository_impl.dart'
    as _i98;
import '../../data/repository_impl/local/login_repository_impl.dart' as _i50;
import '../../data/repository_impl/local/register_repository_impl.dart' as _i11;
import '../../data/repository_impl/remote/movies/categories_repository_impl.dart'
    as _i65;
import '../../data/repository_impl/remote/movies/filter_repository_impl.dart'
    as _i62;
import '../../data/repository_impl/remote/movies/movie_details_repository_impl.dart'
    as _i73;
import '../../data/repository_impl/remote/movies/movie_review_repo_impl.dart'
    as _i67;
import '../../data/repository_impl/remote/movies/popular_repository_impl.dart'
    as _i111;
import '../../data/repository_impl/remote/movies/rate_repository_impl.dart'
    as _i95;
import '../../data/repository_impl/remote/movies/search_repository_impl.dart'
    as _i30;
import '../../data/repository_impl/remote/movies/similer_repository_impl.dart'
    as _i69;
import '../../data/repository_impl/remote/movies/toprated_repository_impl.dart'
    as _i60;
import '../../data/repository_impl/remote/movies/trailler_repository_impl.dart'
    as _i83;
import '../../data/repository_impl/remote/movies/upcoming_repository_impl.dart'
    as _i88;
import '../../data/repository_impl/remote/series/top_rated_series_repo_impl.dart'
    as _i71;
import '../../domain/repository_contract/local/fire_store_movie_repository.dart'
    as _i97;
import '../../domain/repository_contract/local/login_repository.dart' as _i49;
import '../../domain/repository_contract/local/register_repository.dart'
    as _i10;
import '../../domain/repository_contract/remote/movies/categories_repository.dart'
    as _i64;
import '../../domain/repository_contract/remote/movies/filter_repository.dart'
    as _i61;
import '../../domain/repository_contract/remote/movies/movie_details_repository.dart'
    as _i72;
import '../../domain/repository_contract/remote/movies/movie_review_repo.dart'
    as _i66;
import '../../domain/repository_contract/remote/movies/popular_repository.dart'
    as _i110;
import '../../domain/repository_contract/remote/movies/rating_repository.dart'
    as _i94;
import '../../domain/repository_contract/remote/movies/search_repository.dart'
    as _i29;
import '../../domain/repository_contract/remote/movies/similer_repository.dart'
    as _i68;
import '../../domain/repository_contract/remote/movies/toprated_repository.dart'
    as _i59;
import '../../domain/repository_contract/remote/movies/trailler_repository.dart'
    as _i82;
import '../../domain/repository_contract/remote/movies/upcoming_repository.dart'
    as _i87;
import '../../domain/repository_contract/remote/series/top_rated_series_repo.dart'
    as _i70;
import '../../domain/use_cases/Local/fire_store_movie_use_case.dart' as _i106;
import '../../domain/use_cases/Local/login_usecase.dart' as _i84;
import '../../domain/use_cases/Local/register_usecase.dart' as _i22;
import '../../domain/use_cases/remote/movies/category_usecase.dart' as _i78;
import '../../domain/use_cases/remote/movies/filter_usecase.dart' as _i63;
import '../../domain/use_cases/remote/movies/movie_details_usecase.dart'
    as _i102;
import '../../domain/use_cases/remote/movies/movie_review_usecase.dart'
    as _i103;
import '../../domain/use_cases/remote/movies/popular_usecase.dart' as _i117;
import '../../domain/use_cases/remote/movies/rate_usecase.dart' as _i115;
import '../../domain/use_cases/remote/movies/search_usecase.dart' as _i41;
import '../../domain/use_cases/remote/movies/similer_usecase.dart' as _i108;
import '../../domain/use_cases/remote/movies/toprated_usecase.dart' as _i104;
import '../../domain/use_cases/remote/movies/trailler_usecase.dart' as _i85;
import '../../domain/use_cases/remote/movies/upcoming_usecase.dart' as _i100;
import '../../domain/use_cases/remote/series/top_rated_series_use_case.dart'
    as _i109;
import '../../Presentation/layouts/auth/login/login_Viewmodel/login_view_model.dart'
    as _i101;
import '../../Presentation/layouts/auth/register/register_viewmodel/register_view_model.dart'
    as _i89;
import '../../Presentation/layouts/category_filter/view_model/category_filter_view_model.dart'
    as _i93;
import '../../Presentation/layouts/home/tabs/browse_tab/view_model/browse_view_model.dart'
    as _i96;
import '../../Presentation/layouts/home/tabs/casts/view_model/cast_jobs_view_model_cubit.dart'
    as _i86;
import '../../Presentation/layouts/home/tabs/casts/view_model/cast_view_model_cubit.dart'
    as _i81;
import '../../Presentation/layouts/home/tabs/home_tab/view_model/arabic_movie_view_model.dart'
    as _i91;
import '../../Presentation/layouts/home/tabs/home_tab/view_model/arabic_series_view_model.dart'
    as _i92;
import '../../Presentation/layouts/home/tabs/home_tab/view_model/last_updated_view_model.dart'
    as _i40;
import '../../Presentation/layouts/home/tabs/home_tab/view_model/popular_home_tab_view_model.dart'
    as _i119;
import '../../Presentation/layouts/home/tabs/home_tab/view_model/popular_series_view_model.dart'
    as _i76;
import '../../Presentation/layouts/home/tabs/home_tab/view_model/top_rated_series_view_model.dart'
    as _i116;
import '../../Presentation/layouts/home/tabs/home_tab/view_model/toprated_home_tab_view_model.dart'
    as _i105;
import '../../Presentation/layouts/home/tabs/home_tab/view_model/upcoming_home_tab_view_model.dart'
    as _i112;
import '../../Presentation/layouts/home/tabs/search_feature/view_model/search_view_model.dart'
    as _i46;
import '../../Presentation/layouts/home/tabs/watch%20list_tab/view_model/watch_list_view_model.dart'
    as _i107;
import '../../Presentation/layouts/movie_details/view_model/movie_details_view_model.dart'
    as _i118;
import '../../Presentation/layouts/movie_details/view_model/rate_view_model.dart'
    as _i120;
import '../../Presentation/layouts/movie_details/view_model/similer_view_model.dart'
    as _i114;
import '../../Presentation/layouts/movie_details/widgets/comments/view_model/comments_view_model_cubit.dart'
    as _i113;
import '../../Presentation/layouts/movie_details/widgets/movie_trailler/view_model/trailler_view_model.dart'
    as _i90;
import '../../Presentation/layouts/series_details/view_model.dart/series_details_view_model.dart'
    as _i99;
import '../../Presentation/layouts/series_details/widgets/seasons/view_model.dart/season_details_view_model.dart'
    as _i77;
import '../../Presentation/layouts/series_details/widgets/similer_series/view_model/similer_series_view_model.dart'
    as _i35;
import '../api/api_manger.dart' as _i3;
import '../firebase/auth_helper.dart' as _i4;
import '../firebase/firestore_helper.dart' as _i5;

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
    gh.singleton<_i4.AuthHelper>(() => _i4.AuthHelper());
    gh.singleton<_i5.FireStoreHelper>(() => _i5.FireStoreHelper());
    gh.factory<_i6.SearchDataSource>(
        () => _i7.SearchDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i8.RegisterDataSource>(
        () => _i9.registerDataSourceImpl(gh<_i4.AuthHelper>()));
    gh.factory<_i10.RegisterRepository>(() => _i11.registerRepositoryImpl(
        registerDataSource: gh<_i8.RegisterDataSource>()));
    gh.factory<_i12.SimillerSeriesDatasource>(
        () => _i13.SimilerSeriesDatasourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i14.CastDatasource>(
        () => _i15.CastDatasourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i16.TopRatedSeriesDataSource>(
        () => _i17.TopRatedSeriesDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i18.SeasonDetailsDatasource>(
        () => _i19.SeasonDetailsDatasourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i20.LoginDataSource>(
        () => _i21.LoginDataSourceImpl(gh<_i4.AuthHelper>()));
    gh.factory<_i22.RegisterUsecase>(
        () => _i22.RegisterUsecase(gh<_i10.RegisterRepository>()));
    gh.factory<_i23.MovieReviewDataSource>(
        () => _i24.MovieReviewDatasourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i25.MovieDetailsDataSource>(
        () => _i26.MovieDetailsDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i27.CastJobsDatasource>(
        () => _i28.CastJobsDatasourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i29.SearchRepository>(
        () => _i30.SearchRepositoryImpl(gh<_i6.SearchDataSource>()));
    gh.factory<_i31.TopRatedDataSource>(
        () => _i32.TopRatedDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i33.PopularSeriesDatasource>(
        () => _i34.PopularSeriesDatasourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i35.SimilerSeriesViewModel>(
        () => _i35.SimilerSeriesViewModel(gh<_i12.SimillerSeriesDatasource>()));
    gh.factory<_i36.NowPlayingDatasource>(
        () => _i37.NowPlayingDatasourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i38.SeriesDetailsDatasource>(
        () => _i39.SeriesDetailsDatasourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i40.LastUpdatedViewModel>(
        () => _i40.LastUpdatedViewModel(gh<_i36.NowPlayingDatasource>()));
    gh.factory<_i41.SearchUseCase>(
        () => _i41.SearchUseCase(gh<_i29.SearchRepository>()));
    gh.factory<_i42.CategoriesDataSource>(
        () => _i43.CategoriesDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i44.RatingDataSource>(
        () => _i45.RatingDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i46.SearchTabViewModel>(
        () => _i46.SearchTabViewModel(gh<_i41.SearchUseCase>()));
    gh.factory<_i47.FilterDataSource>(
        () => _i48.FilterDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i49.LoginRepository>(
        () => _i50.LoginRepositoryImpl(gh<_i20.LoginDataSource>()));
    gh.factory<_i51.UpcomingDataSorce>(
        () => _i52.UpcomingDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i53.SimilerDataSource>(
        () => _i54.SimilerDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i55.ArabicDatasource>(
        () => _i56.ArabicDatasourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i57.TraillerDataSource>(
        () => _i58.TraillerDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i59.TopRatedRepository>(
        () => _i60.TopRatedRepositoryImpl(gh<_i31.TopRatedDataSource>()));
    gh.factory<_i61.FilterRepository>(
        () => _i62.FilterRepositoryImpl(gh<_i47.FilterDataSource>()));
    gh.factory<_i63.FilterUseCase>(
        () => _i63.FilterUseCase(gh<_i61.FilterRepository>()));
    gh.factory<_i64.CategoriesRepository>(
        () => _i65.CategoriesRepositoryImpl(gh<_i42.CategoriesDataSource>()));
    gh.factory<_i66.MovieReviewRepo>(() => _i67.MovieReviewRepoImpl(
        movieReviewDataSource: gh<_i23.MovieReviewDataSource>()));
    gh.factory<_i68.SimilerRepository>(
        () => _i69.SimilerRepositoryImpl(gh<_i53.SimilerDataSource>()));
    gh.factory<_i70.TopRatedSeriesRepo>(
        () => _i71.TopRatedSeriesRepoImpl(gh<_i16.TopRatedSeriesDataSource>()));
    gh.factory<_i72.MovieDetailsReposityory>(() =>
        _i73.MovieDetailsRepositoryImpl(gh<_i25.MovieDetailsDataSource>()));
    gh.factory<_i74.PopularDataSource>(
        () => _i75.PopularDataSourceImpl(apiManger: gh<_i3.ApiManger>()));
    gh.factory<_i76.PopularSeriesViewModel>(
        () => _i76.PopularSeriesViewModel(gh<_i33.PopularSeriesDatasource>()));
    gh.factory<_i77.SeasonDetailsViewModel>(
        () => _i77.SeasonDetailsViewModel(gh<_i18.SeasonDetailsDatasource>()));
    gh.factory<_i78.CategoryUseCase>(
        () => _i78.CategoryUseCase(gh<_i64.CategoriesRepository>()));
    gh.factory<_i79.FireStoreMovieDataSource>(
        () => _i80.FireStoreMovieDateSourceImpl(gh<_i5.FireStoreHelper>()));
    gh.factory<_i81.CastViewModelCubit>(
        () => _i81.CastViewModelCubit(gh<_i14.CastDatasource>()));
    gh.factory<_i82.TraillerRepository>(
        () => _i83.TraillerRepositoryImpl(gh<_i57.TraillerDataSource>()));
    gh.factory<_i84.LoginUsecase>(
        () => _i84.LoginUsecase(gh<_i49.LoginRepository>()));
    gh.factory<_i85.TraillerUseCase>(
        () => _i85.TraillerUseCase(gh<_i82.TraillerRepository>()));
    gh.factory<_i86.CastJobsViewModelCubit>(
        () => _i86.CastJobsViewModelCubit(gh<_i27.CastJobsDatasource>()));
    gh.factory<_i87.UpcomingRepository>(
        () => _i88.UpcomingRepositoryImpl(gh<_i51.UpcomingDataSorce>()));
    gh.factory<_i89.RegisterViewModel>(
        () => _i89.RegisterViewModel(gh<_i22.RegisterUsecase>()));
    gh.factory<_i90.TraillerViewMode>(
        () => _i90.TraillerViewMode(gh<_i85.TraillerUseCase>()));
    gh.factory<_i91.ArabicMovieViewModel>(
        () => _i91.ArabicMovieViewModel(gh<_i55.ArabicDatasource>()));
    gh.factory<_i92.ArabicSeriesViewModel>(
        () => _i92.ArabicSeriesViewModel(gh<_i55.ArabicDatasource>()));
    gh.factory<_i93.CategoryFilterViewModel>(
        () => _i93.CategoryFilterViewModel(gh<_i63.FilterUseCase>()));
    gh.factory<_i94.RatingRepository>(
        () => _i95.RatingRepositoryImpl(gh<_i44.RatingDataSource>()));
    gh.factory<_i96.BrowseTabViewModel>(
        () => _i96.BrowseTabViewModel(gh<_i78.CategoryUseCase>()));
    gh.factory<_i97.FireStoreMovieRepository>(() =>
        _i98.FireStoreMovieRepositoryImpl(gh<_i79.FireStoreMovieDataSource>()));
    gh.factory<_i99.SeriesDetailsViewModel>(
        () => _i99.SeriesDetailsViewModel(gh<_i38.SeriesDetailsDatasource>()));
    gh.factory<_i100.UpcomingUseCase>(
        () => _i100.UpcomingUseCase(gh<_i87.UpcomingRepository>()));
    gh.factory<_i101.LoginViewModel>(() => _i101.LoginViewModel(
          gh<_i84.LoginUsecase>(),
          gh<_i20.LoginDataSource>(),
        ));
    gh.factory<_i102.MovieDetailsUseCase>(
        () => _i102.MovieDetailsUseCase(gh<_i72.MovieDetailsReposityory>()));
    gh.factory<_i103.MovieReviewUsecase>(
        () => _i103.MovieReviewUsecase(gh<_i66.MovieReviewRepo>()));
    gh.factory<_i104.TopRatedUseCase>(
        () => _i104.TopRatedUseCase(gh<_i59.TopRatedRepository>()));
    gh.factory<_i105.TopRatedHomeTabViewModel>(
        () => _i105.TopRatedHomeTabViewModel(gh<_i104.TopRatedUseCase>()));
    gh.factory<_i106.FireStoreMovieUseCase>(
        () => _i106.FireStoreMovieUseCase(gh<_i97.FireStoreMovieRepository>()));
    gh.factory<_i107.WatchListTabViewModel>(
        () => _i107.WatchListTabViewModel(gh<_i106.FireStoreMovieUseCase>()));
    gh.factory<_i108.SimilerUseCase>(
        () => _i108.SimilerUseCase(gh<_i68.SimilerRepository>()));
    gh.factory<_i109.TopRatedSeriesUseCase>(() => _i109.TopRatedSeriesUseCase(
        topRatedSeriesRepo: gh<_i70.TopRatedSeriesRepo>()));
    gh.factory<_i110.PopularRepository>(
        () => _i111.PopularRepositoryImpl(gh<_i74.PopularDataSource>()));
    gh.factory<_i112.UpcomingHomeTabViewModel>(
        () => _i112.UpcomingHomeTabViewModel(gh<_i100.UpcomingUseCase>()));
    gh.factory<_i113.CommentsViewModelCubit>(
        () => _i113.CommentsViewModelCubit(gh<_i103.MovieReviewUsecase>()));
    gh.factory<_i114.SimilerHomeTabViewModel>(
        () => _i114.SimilerHomeTabViewModel(gh<_i108.SimilerUseCase>()));
    gh.factory<_i115.RatingUseCase>(
        () => _i115.RatingUseCase(gh<_i94.RatingRepository>()));
    gh.factory<_i116.TopRatedSeriesViewModel>(
        () => _i116.TopRatedSeriesViewModel(gh<_i109.TopRatedSeriesUseCase>()));
    gh.factory<_i117.PoplularUseCase>(
        () => _i117.PoplularUseCase(gh<_i110.PopularRepository>()));
    gh.factory<_i118.MovieDetailsHomeTabViewModel>(
        () => _i118.MovieDetailsHomeTabViewModel(
              gh<_i102.MovieDetailsUseCase>(),
              gh<_i115.RatingUseCase>(),
            ));
    gh.factory<_i119.PopularHomeTabViewModel>(
        () => _i119.PopularHomeTabViewModel(gh<_i117.PoplularUseCase>()));
    gh.factory<_i120.RateViewModel>(
        () => _i120.RateViewModel(gh<_i115.RatingUseCase>()));
    return this;
  }
}
