require "rake"
class Api::TaskController < ApplicationController
  def run_example_task
    # Rakeタスクを呼び出す
    Rake::Task.clear # Clear previously defined tasks to avoid duplication
    Rails.application.load_tasks # Load Rake tasks
    Rake::Task['sample_task:sample'].invoke

    render json: { message: 'Rake task executed' }, status: :ok
  end
end
