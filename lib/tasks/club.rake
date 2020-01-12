namespace :club do
    desc "Loads club and members into database" 

    task :load => :environment do
        hash = YAML.load_file(File.join(Rails.root, "config", "club.yml"))
        clubs = hash.fetch(Rails.env, [])

        clubs.each do |club_name, members|
            club = Club.find_or_create_by!(name: club_name)

            members["members"].each do |member|
                club.create_member!(member)
            end
        end
    end
end