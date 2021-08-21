import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work/models/hot_category_job_model.dart';
import 'package:work/models/job_model.dart';
import 'package:work/providers/job_provider.dart';
import 'package:work/widgets/job_tile.dart';

import '../theme.dart';

class CategoryPage extends StatelessWidget {
  final HotCategoryJobModel categoryJobModel;

  CategoryPage({required this.categoryJobModel});

  @override
  Widget build(BuildContext context) {
    JobProvider jobProvider = Provider.of<JobProvider>(context);

    Widget header(int totalJob) {
      return Container(
        height: 270,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: defaultMargin,
          bottom: 30,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              categoryJobModel.imageUrl!,
            ),
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryJobModel.name!,
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              '$totalJob available',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    Widget companies() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Big Companies',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            FutureBuilder<List<JobModel>>(
                future: jobProvider.getJobsByCategory(categoryJobModel.name!),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    final result = snapshot.data;

                    return Column(
                      children: result!
                          .map((data) => JobTile(
                                jobModel: data,
                              ))
                          .toList(),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      );
    }

    Widget newStartups() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 20,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Startups',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            FutureBuilder<List<JobModel>>(
                future: jobProvider.getJobs(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    final result = snapshot.data;

                    return Column(
                      children: result!
                          .map((data) => JobTile(
                                jobModel: data,
                              ))
                          .toList(),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      );
    }

    return Scaffold(
      body: FutureBuilder<List<JobModel>>(
          future: jobProvider.getJobsByCategory(categoryJobModel.name!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final result = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    header(result!.length),
                    companies(),
                    newStartups(),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
