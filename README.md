This repo contains ansible code to reconfigure jobs in Jenkins using the
python tool jenkins-job-builder

When cloning from github, simply run:

    rake

When using galaxy, simply run:

    ansible-galaxy install Azulinho.azulinho-jenkins-reconfigure-jobs-using-job-builder


To consume this role, you should place the variables below in group_vars/all,
or into a wrapper_role <wrapper_role/vars/main.yaml>

VARIABLES:

    azulinho_reconfigure_jobs_using_job_builder:
      - job:
          name: job-builder_flow1
          project_type: job-builder_flow
          dsl: |
            build("job-builder_job1")
            parallel (
              { build("job-builder_job2a") },
              { build("job-builder_job2b") },
            )
            build("job-builder_job3")

      - job:
          name: job_builder-job1
          project-type: freestyle
          defaults: global
          disabled: false
          display-name: 'job_builder-job1'
          concurrent: true
          quiet-period: 5
          block-downstream: false
          block-upstream: false
          retry-count: 3

      - job:
          name: job-builder_job2a

      - job:
          name: job-builder_job2b

      - job:
          name: job-builder_seed1
          project-type: freestyle
          defaults: global
          disabled: false
          display-name: 'job-builder_seed1'
          concurrent: true
          quiet-period: 5
          block-downstream: false
          block-upstream: false
          retry-count: 3
