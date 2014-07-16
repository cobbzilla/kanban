# encoding: utf-8

# create only the barebones structure required. users and boardmembers will be created upon first login.

Board.create([
     { :name => 'general', :description => 'all-purpose board', :open => true, :created_at => '2014-05-13 00:00:00', :updated_at => '2014-05-13 00:00:00'},
     { :name => 'bugs', :description => 'bug board', :open => true, :created_at => '2014-05-13 00:00:00', :updated_at => '2014-05-13 00:00:00'},
     { :name => 'features', :description => 'feature board', :open => true, :created_at => '2014-05-13 00:00:00', :updated_at => '2014-05-13 00:00:00'},
], :without_protection => true )

List.create([
        { :board_id => 1, :title => 'todo', :open => true, :created_at => '2014-05-13 00:00:00', :updated_at => '2014-05-13 00:00:00', :position => 1 },
        { :board_id => 1, :title => 'working on it', :open => true, :created_at => '2014-05-13 00:00:00', :updated_at => '2014-05-13 00:00:00', :position => 2 },
        { :board_id => 1, :title => 'done', :open => true, :created_at => '2014-05-13 00:00:00', :updated_at => '2014-05-13 00:00:00', :position => 3 },
        { :board_id => 2, :title => 'todo', :open => true, :created_at => '2014-05-13 00:00:00', :updated_at => '2014-05-13 00:00:00', :position => 1 },
        { :board_id => 2, :title => 'working on it', :open => true, :created_at => '2014-05-13 00:00:00', :updated_at => '2014-05-13 00:00:00', :position => 2 },
        { :board_id => 2, :title => 'done', :open => true, :created_at => '2014-05-13 00:00:00', :updated_at => '2014-05-13 00:00:00', :position => 3 },
        { :board_id => 3, :title => 'todo', :open => true, :created_at => '2014-05-13 00:00:00', :updated_at => '2014-05-13 00:00:00', :position => 1 },
        { :board_id => 3, :title => 'working on it', :open => true, :created_at => '2014-05-13 00:00:00', :updated_at => '2014-05-13 00:00:00', :position => 2 },
        { :board_id => 3, :title => 'done', :open => true, :created_at => '2014-05-13 00:00:00', :updated_at => '2014-05-13 00:00:00', :position => 3 },
], :without_protection => true )
