require "aws-sdk-ecs"
require "dotenv-rails"

class EcsController < ApplicationController

  def run_task
    # Credentialsは環境変数から参照
    client = Aws::ECS::Client.new(
      region: 'ap-northeast-1',
    )
  
    resp = client.run_task({
      cluster: "arimura-test",
      count: 1, 
      launch_type: "FARGATE",
      network_configuration: {
        awsvpc_configuration: {
          subnets: ["subnet-0cdae57f1976f61ae"], # required
          security_groups: ["sg-04e00430e87bb17ae"],
          assign_public_ip: "DISABLED", # accepts ENABLED, DISABLED
        },
      },
      task_definition: "sandbox-rake-task:2", 
      overrides: {
        container_overrides: [
          {
            name: "sandbox-rake-task",
            command: ["bundle", "exec", "rake", "sample_task:sample"],
          },
        ],
      }
    })
  
    puts "RUN TASK"
    render json: { message: 'ECS Task Started' }, status: :ok
  end
  
end
