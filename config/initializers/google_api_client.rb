require 'dotenv'
Dotenv.load

require 'google/apis/civicinfo_v2'

CivicInfo = Google::Apis::CivicinfoV2
CivicInfoService = CivicInfo::CivicInfoService

CI = CivicInfoService.new
CI.key = ENV["GOOGLE_API_KEY"]
