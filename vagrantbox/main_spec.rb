require_relative 'spec_helper'

jobs_list = [
  'job-builder_flow1',
  'job-builder_job2a',
  'job-builder_job2b',
  'job-builder_seed1',
  'job_builder-job1'
]

describe command('sudo java -jar /opt/jenkins/jenkins-cli.jar -s http://127.0.0.1:8080/ list-jobs') do
  jobs_list.each do |job|
    its(:stdout) { should include job }
  end
end

