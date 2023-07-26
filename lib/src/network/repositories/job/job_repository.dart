import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/job.dart';

abstract class JobRepository {
  Future<XResult<JobsModel>> getListJob();
}
