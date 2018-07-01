20.times do |n|
    name = "No.#{n + 1}:〇〇大学"
    circle_name = "〇〇サークル"
    user = Univercity.create!(name: name, circle_name: circle_name)
    10.times do |nn|
        name = "Team No.#{nn + 1}"
        team = user.teams.create!(name: name)
        8.times do |nnn|
            name = "Demo No.#{nnn + 1}"
            team.demos.create!(name: name, univercity_id: n + 1)
        end
    end
end