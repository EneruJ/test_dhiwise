import '../article_screen/widgets/relatedarticles_item_widget.dart';
import '../article_screen/widgets/topics_item_widget.dart';
import '../article_screen/widgets/trendings_item_widget.dart';
import 'bloc/article_bloc.dart';
import 'models/article_model.dart';
import 'models/relatedarticles_item_model.dart';
import 'models/topics_item_model.dart';
import 'models/trendings_item_model.dart';
import 'package:flutter/material.dart';
import 'package:test/core/app_export.dart';
import 'package:test/widgets/app_bar/appbar_leading_image.dart';
import 'package:test/widgets/app_bar/appbar_subtitle.dart';
import 'package:test/widgets/app_bar/appbar_trailing_image.dart';
import 'package:test/widgets/app_bar/custom_app_bar.dart';
import 'package:test/widgets/custom_search_view.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ArticleBloc>(
        create: (context) =>
            ArticleBloc(ArticleState(articleModelObj: ArticleModel()))
              ..add(ArticleInitialEvent()),
        child: ArticleScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocSelector<ArticleBloc, ArticleState,
                              TextEditingController?>(
                          selector: (state) => state.searchController,
                          builder: (context, searchController) {
                            return CustomSearchView(
                                controller: searchController,
                                hintText: "msg_search_article".tr);
                          }),
                      SizedBox(height: 23.v),
                      Text("msg_popular_articles".tr,
                          style:
                              CustomTextStyles.titleMediumOnPrimaryContainer_1),
                      SizedBox(height: 10.v),
                      _buildTopics(context),
                      SizedBox(height: 23.v),
                      _buildTrendingArticles(context),
                      SizedBox(height: 11.v),
                      _buildTrendings(context),
                      SizedBox(height: 16.v),
                      _buildRelatedArticles(context),
                      SizedBox(height: 12.v),
                      _buildRelatedArticles1(context)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 45.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.h, top: 10.v, bottom: 10.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_articles".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotification,
              margin: EdgeInsets.fromLTRB(14.h, 14.v, 14.h, 10.v))
        ]);
  }

  /// Section Widget
  Widget _buildTopics(BuildContext context) {
    return BlocSelector<ArticleBloc, ArticleState, ArticleModel?>(
        selector: (state) => state.articleModelObj,
        builder: (context, articleModelObj) {
          return Wrap(
              runSpacing: 5.v,
              spacing: 5.h,
              children: List<Widget>.generate(
                  articleModelObj?.topicsItemList.length ?? 0, (index) {
                TopicsItemModel model =
                    articleModelObj?.topicsItemList[index] ?? TopicsItemModel();
                return TopicsItemWidget(model, onSelectedChipView: (value) {
                  context.read<ArticleBloc>().add(
                      UpdateChipViewEvent(index: index, isSelected: value));
                });
              }));
        });
  }

  /// Section Widget
  Widget _buildTrendingArticles(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("msg_trending_articles".tr,
              style: CustomTextStyles.titleMediumOnPrimaryContainer_1),
          Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: Text("lbl_see_all".tr,
                  style: CustomTextStyles.labelLargeCyan300))
        ]);
  }

  /// Section Widget
  Widget _buildTrendings(BuildContext context) {
    return SizedBox(
        height: 223.v,
        child: BlocSelector<ArticleBloc, ArticleState, ArticleModel?>(
            selector: (state) => state.articleModelObj,
            builder: (context, articleModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.only(right: 12.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 17.h);
                  },
                  itemCount: articleModelObj?.trendingsItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    TrendingsItemModel model =
                        articleModelObj?.trendingsItemList[index] ??
                            TrendingsItemModel();
                    return TrendingsItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildRelatedArticles(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text("msg_related_articles".tr,
          style: CustomTextStyles.titleMediumOnPrimaryContainer_1),
      Padding(
          padding: EdgeInsets.only(bottom: 3.v),
          child:
              Text("lbl_see_all".tr, style: CustomTextStyles.labelLargeCyan300))
    ]);
  }

  /// Section Widget
  Widget _buildRelatedArticles1(BuildContext context) {
    return BlocSelector<ArticleBloc, ArticleState, ArticleModel?>(
        selector: (state) => state.articleModelObj,
        builder: (context, articleModelObj) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 10.v);
              },
              itemCount: articleModelObj?.relatedarticlesItemList.length ?? 0,
              itemBuilder: (context, index) {
                RelatedarticlesItemModel model =
                    articleModelObj?.relatedarticlesItemList[index] ??
                        RelatedarticlesItemModel();
                return RelatedarticlesItemWidget(model);
              });
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
