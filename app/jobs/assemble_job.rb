class AssembleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Get New Feeds
    Feeds::CreateFeedsFromSubtopicsJob.perform_now

    # Create Feed Items From Feeds
    FeedItems::CreateFeedItemsJob.perform_now

    # Convert HTML to Markdown
    FeedItems::ConvertHtmlToMarkdownJob.perform_now

    # Process SubTopics into Stories
    Stories::CreateStoriesFromSubtopicsJob.perform_now

    # Create Stemmed Stories
    Stories::ProcessStoryStemsJob.perform_now

    # Images from processed stories

  end
end
