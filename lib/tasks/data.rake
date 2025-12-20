namespace :data do
  desc "Backfill upvotes for existing sites from their submitters"
  task backfill_submitter_upvotes: :environment do
    puts "Starting backfill of submitter upvotes..."

    Site.find_each do |site|
      next unless site.user

      if Upvote.exists?(user_id: site.user_id, site_id: site.id)
        puts "Skipping (already upvoted): #{site.title} by user #{site.user_id}"
        next
      end

      Upvote.create!(user: site.user, site: site)
      puts "Upvoted: #{site.title} by user #{site.user_id}"
    end

    puts "Backfill complete."
  end
end
