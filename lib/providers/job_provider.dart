import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:work/models/job_model.dart';

import '../constants.dart';

class JobProvider with ChangeNotifier {
  Future<List<JobModel>> getJobs() async {
    try {
      final response = await http.get(Uri.parse("$url/jobs"));

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];

        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((job) {
          jobs.add(JobModel.fromJson(job));
        });

        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<JobModel>> getJobsByCategory(String category) async {
    try {
      final response =
          await http.get(Uri.parse("$url/jobs?category=$category"));

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];

        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((job) {
          jobs.add(JobModel.fromJson(job));
        });

        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
