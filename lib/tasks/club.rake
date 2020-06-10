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

    task :seed_member => :environment do
        club = Club.find_by(name: ENV['CLUB'])

        member = club.create_member!(ENV['NAME'])

        User.create!(
            member: member,
            username: member.first_name.downcase[0] + member.last_name.downcase,
            password: "password1b"
        )
    end

    task :seed_collections => :environment do
      Club.all.each do |club|
        Collection::Types::ALL.each do |collection_type|
          Collection.find_or_create_by(
            club_id: club.id,
            type: collection_type
          )
        end
      end
    end
end