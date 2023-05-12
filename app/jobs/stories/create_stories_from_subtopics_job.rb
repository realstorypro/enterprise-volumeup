module Stories
  class CreateStoriesFromSubtopicsJob < ApplicationJob
    queue_as :default

    def perform(*_args)
      sub_topics = SubTopic.all
      sub_topics.each do |sub_topic|
        Stories::CreateStoriesJob.perform_now(sub_topic:)
      end
    end
  end
end