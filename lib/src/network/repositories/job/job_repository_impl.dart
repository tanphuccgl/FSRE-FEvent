import 'package:fevent/src/config/constants/endpoints.dart';
import 'package:fevent/src/network/data_sources/base_data_source.dart';
import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/job.dart';
import 'package:fevent/src/network/repositories/job/job_repository.dart';
import 'package:fevent/src/utils/helper/logger.dart';

class JobRepositoryImpl extends JobRepository {
  @override
  Future<XResult<JobsModel>> getListJob() async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.jobs}?page=0&pageSize=12&orderBy=createdAt&order=ASC&isShowInactive=false",
      );

      final result = JobsModel.fromJson(
        response.data,
      );

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> GET job  CATCH Error< $e');

      return XResult.exception(e);
    }
  }
}
